import 'dart:async';

import 'package:fidu_service/features/main_page/map/services/marker_service.dart';
import 'package:fidu_service/features/main_page/map/services/places_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart';

import 'blocs/application_bloc.dart';
import 'models/geometry.dart';
import 'models/location.dart';
import 'models/place.dart';
import 'models/place_search.dart';
final placesService = PlacesService();
final markerService = MarkerService();
final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
Position? _currentPosition;
String? _currentAddress;
//Variables
Position? currentLocation;
List<PlaceSearch>? searchResults;
StreamController<Place>? selectedLocation = StreamController<Place>();
StreamController<LatLngBounds>? bounds = StreamController<LatLngBounds>();
Place? selectedLocationStatic;
String? placeType;
List<Place>? placeResults;
List<Marker> markers = <Marker>[];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _mapController = Completer();
  StreamSubscription? locationSubscription;
  StreamSubscription? boundsSubscription;
  final _locationController = TextEditingController();
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
    // notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    // notifyListeners();
  }


  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation!.add(sLocation);
    selectedLocationStatic = sLocation;
    searchResults = null;
    // notifyListeners();
  }

  clearSelectedLocation() {
    // selectedLocation!.add(null);
    selectedLocationStatic = null;
    searchResults = null;
    placeType = null;
    // notifyListeners();
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

      // notifyListeners();
    }
  }
  @override
  void initState() {

    setCurrentLocation();
    //Listen for selected Location
    locationSubscription = selectedLocation!.stream.listen((place) {
      if (place != null) {
        _locationController.text = place.name;
        _goToPlace(place);
      } else
        _locationController.text = "";
    });

    bounds!.stream.listen((bounds) async {
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    });
    super.initState();
  }



  @override
  void dispose() {

    // dispose();
    _locationController.dispose();
    locationSubscription!.cancel();
    boundsSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (currentLocation == null)
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _locationController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Search by City',
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (value) => searchPlaces(value),
                onTap: () => clearSelectedLocation(),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 300.0,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          currentLocation!.latitude,
                          currentLocation!.longitude),
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _mapController.complete(controller);
                    },
                    markers: Set<Marker>.of(markers),
                  ),
                ),
                if (searchResults != null &&
                    searchResults!.length != 0)
                  Container(
                      height: 300.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.6),
                          backgroundBlendMode: BlendMode.darken)),
                if (searchResults != null)
                  Container(
                    height: 300.0,
                    child: ListView.builder(
                        itemCount: searchResults!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              searchResults![index].description,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              setSelectedLocation(
                                  searchResults![index].placeId);
                            },
                          );
                        }),
                  ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Find Nearest',
                  style: TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                children: [
                  FilterChip(
                    label: Text('Campground'),
                    onSelected: (val) => togglePlaceType(
                        'campground', val),
                    selected:
                    placeType  =='campground',
                    selectedColor: Colors.blue,
                  ),
                  FilterChip(
                      label: Text('Locksmith'),
                      onSelected: (val) => togglePlaceType('locksmith', val),
                      selected: placeType  =='locksmith',
                      selectedColor: Colors.blue),
                  FilterChip(
                      label: Text('Pharmacy'),
                      onSelected: (val) => togglePlaceType('pharmacy', val),
                      selected:
                      placeType  =='pharmacy',
                      selectedColor: Colors.blue),
                  FilterChip(
                      label: Text('Pet Store'),
                      onSelected: (val) =>togglePlaceType('pet_store', val),
                      selected: placeType  =='pet_store',
                      selectedColor: Colors.blue),
                  FilterChip(
                      label: Text('Lawyer'),
                      onSelected: (val) =>
                         togglePlaceType('lawyer', val),
                      selected:
                      placeType  =='lawyer',
                      selectedColor: Colors.blue),
                  FilterChip(
                      label: Text('Bank'),
                      onSelected: (val) =>
                         togglePlaceType('bank', val),
                      selected:
                      placeType  =='bank',
                      selectedColor: Colors.blue),
                ],
              ),
            )
          ],
        ));
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            zoom: 14.0),
      ),
    );
  }
}
