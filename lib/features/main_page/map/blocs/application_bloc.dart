import 'dart:async';

import 'package:fidu_service/features/main_page/map/models/geometry.dart';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/location.dart';
import '../models/place.dart';
import '../models/place_search.dart';
import '../services/marker_service.dart';
import '../services/places_service.dart';

final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
Position? _currentPosition;
String? _currentAddress;
class ApplicationBloc with ChangeNotifier {
  // final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();
  final markerService = MarkerService();

  //Variables
  Position? currentLocation;
  List<PlaceSearch>? searchResults;
  StreamController<Place>? selectedLocation = StreamController<Place>();
  StreamController<LatLngBounds>? bounds = StreamController<LatLngBounds>();
  Place? selectedLocationStatic;
  String? placeType;
  List<Place>? placeResults;
  List<Marker> markers = <Marker>[];


  ApplicationBloc() {
    setCurrentLocation();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
        _currentPosition = position;
return _currentPosition;
    }).catchError((e) {
      print(e);
    });
  }
  setCurrentLocation() async {
    currentLocation = _getCurrentLocation();
    selectedLocationStatic = Place(name: "",
      geometry: Geometry(location: Location(
          lat: currentLocation!.latitude, lng: currentLocation!.longitude),), vicinity: '',);
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    searchResults = (await placesService.getAutocomplete(searchTerm)).cast<PlaceSearch>();
    notifyListeners();
  }


  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation!.add(sLocation);
    selectedLocationStatic = sLocation;
    searchResults = null;
    notifyListeners();
  }

  clearSelectedLocation() {
    // selectedLocation!.add(null);
    selectedLocationStatic = null;
    searchResults = null;
    placeType = null;
    notifyListeners();
  }

  togglePlaceType(String value, bool selected) async {
    if (selected) {
      placeType = value;
    } else {
      placeType = null;
    }

    if (placeType != null) {
      var places = await placesService.getPlaces(
          selectedLocationStatic!.geometry.location.lat,
          selectedLocationStatic!.geometry.location.lng, placeType!);
      markers= [];
      if (places.length > 0) {
        var newMarker = markerService.createMarkerFromPlace(places[0],false);
        markers.add(newMarker);
      }

      var locationMarker = markerService.createMarkerFromPlace(selectedLocationStatic!,true);
      markers.add(locationMarker);

      var _bounds = markerService.bounds(Set<Marker>.of(markers));
      bounds!.add(_bounds!);

      notifyListeners();
    }
  }



  @override
  void dispose() {
    selectedLocation!.close();
    bounds!.close();
    super.dispose();
  }}