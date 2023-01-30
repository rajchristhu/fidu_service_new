import 'dart:io';

import 'package:fidu_service/core/FirebaseCURD.dart';
import 'package:fidu_service/features/main_page/map/map.dart';
import 'package:fidu_service/resources/colors.dart';
import 'package:fidu_service/resources/strings.dart';
import 'package:fidu_service/util/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fidu_service/features/dashboard/dashboard.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../util/secure_storage.dart';
import '../../view/main_page/page/cart_page.dart';
import '../../view/main_page/page/maps_place_picker_page.dart';
import '../../view/main_page/page/order_page.dart';
import '../../view/main_page/page/profile_page.dart';
import '../../widget/background.dart';
import '../../widget/separate.dart';
import '../main_page/shop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  ConnectionStatusSingleton connectionStatus =
  ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  runApp(const Dahboard());
}

final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
Position? _currentPosition;
String? _currentAddress;

class Dahboard extends StatelessWidget {
  const Dahboard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: ThemeData(
            // fontFamily: 'AvenirNext',
            backgroundColor: backgroundColor,
            primarySwatch: Colors.amber,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.varelaRoundTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: BottomNavBar(),
        ));
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final borderWidth = 1.0;
  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
  );
  final kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [Colors.yellow.shade600, Colors.orange, Colors.red]),
    borderRadius: BorderRadius.circular(20),
  );

  @override
  void initState() {
    super.initState();
    _page = 2;
    _getCurrentLocation();


  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = p[0];
      setState(() {
        _currentAddress =
        "${place.name != null ? place.name + " ," : ""}${place.subLocality != null ? place.subLocality + " ," : ""}${place.locality} ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    secureStorage.get("UID").then((value) =>  print("UID : "+value));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width *
              0.70, // 75% of screen will be occupied
          child: Drawer(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: whiteColors,
                    ),
                    child: ListView(
                      children: <Widget>[
                        SafeArea(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)),
                            // const BorderRadius.all( Radius.circular(18.0)),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              padding:
                              EdgeInsets.only(bottom: 20, left: 10, top: 20),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    flex: 0,
                                    child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            'https://picsum.photos/100')),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Hello!",
                                            style: TextStyle(
                                                color: blackColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "Maria Christhu Rajan fjhbfbhbhwebfhjewbfhb",
                                            style: TextStyle(
                                                color: blackColor,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            // getLocation();
                          },
                          leading: Icon(
                            Icons.history_rounded,
                            size: 22,
                            color: primaryColor,
                          ),
                          // trailing: const Text(
                          //     "99+"
                          // ),
                          title: Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Order History",
                              style: TextStyle(
                                  color: blackColor, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        MySeparator(
                          color: grayColor,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.support_agent,
                            size: 22,
                            color: primaryColor,
                          ),
                          title: Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Support",
                              style: TextStyle(
                                  color: blackColor, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        MySeparator(
                          color: grayColor,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.help_outline_rounded,
                            size: 22,
                            color: primaryColor,
                          ),
                          title: Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Help",
                              style: TextStyle(
                                  color: blackColor, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        MySeparator(
                          color: grayColor,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.note_outlined,
                            size: 22,
                            color: primaryColor,
                          ),
                          title: Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Terms and Condition",
                              style: TextStyle(
                                  color: blackColor, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        MySeparator(
                          color: grayColor,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.star_border_rounded,
                            size: 22,
                            color: primaryColor,
                          ),
                          title: Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Rate the Application",
                              style: TextStyle(
                                  color: blackColor, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipPath(
                    clipper: FooterWaveClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: orangeGradients,
                            begin: Alignment.bottomLeft,
                            end: Alignment.center),
                      ),
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(),
                        ),
                      )),
                ],
              )),
        ),
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0.4,
          shadowColor: whiteColor,
          foregroundColor: whiteColor,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: CircleAvatar(
                radius: 5,
                backgroundImage: NetworkImage('https://picsum.photos/100')),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: grayColor,
                radius: 18,
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: 17,
                  child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      icon:
                      Icon(Icons.notifications, size: 18, color: dark_blue),
                      onPressed: () {
                        // _scaffoldKey.currentState!.openEndDrawer();
                      }), //CircleAvatar
                ), //CircleAvatar
              ), //CircleAvatar
              //   Container(
              // margin: EdgeInsets.all(5),
              //
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(100),
              //     border: Border.all(width: 2, color: grayColor)),
              // child:
              // IconButton(
              //   splashColor: Colors.transparent,
              //   highlightColor: Colors.transparent,
              //   focusColor: Colors.transparent,
              //   icon: Icon(Icons.menu_rounded, size: 24, color: dark_blue),
              //   onPressed: () {
              //     _scaffoldKey.currentState!.openEndDrawer();
              //   }),)
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundColor: grayColor,
                radius: 18,
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: 17,
                  child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      icon:
                      Icon(Icons.menu_rounded, size: 18, color: dark_blue),
                      onPressed: () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      }), //CircleAvatar
                ), //CircleAvatar
              ), //CircleAvatar
              //   Container(
              // margin: EdgeInsets.all(5),
              //
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(100),
              //     border: Border.all(width: 2, color: grayColor)),
              // child:
              // IconButton(
              //   splashColor: Colors.transparent,
              //   highlightColor: Colors.transparent,
              //   focusColor: Colors.transparent,
              //   icon: Icon(Icons.menu_rounded, size: 24, color: dark_blue),
              //   onPressed: () {
              //     _scaffoldKey.currentState!.openEndDrawer();
              //   }),)
            ),
          ],
          centerTitle: false,
          title: Row(
            children: [
              const SizedBox(
                width: 0,
              ),
              InkWell(
                onTap: () async {
                  if (Platform.isAndroid &&
                      await Permission
                          .locationWhenInUse.serviceStatus.isEnabled) {
                    print("Permission Granted");
                    Get.to(MapsPlacePicker());
                  } else if (Platform.isIOS) {
                    print("IOS Plartform");
                    Get.to(MapsPlacePicker());
                  } else {
                    print("Permission denied");
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deliver to",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: grayColor1,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Text(
                        _currentAddress ?? "--",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 14.0,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          backgroundColor: whiteColor,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: Platform.isIOS ? 75.0 : 55.0,
          items: <Widget>[
            Icon(
              Icons.more_vert_outlined,
              size: 22,
              color: whiteColor,
            ),
            Icon(Icons.shopping_cart_rounded, size: 22, color: whiteColor),
            Icon(Icons.fastfood_rounded, size: 22, color: whiteColor),
            Icon(Icons.local_shipping_rounded, size: 22, color: whiteColor),
            Icon(Icons.person_pin, size: 22, color: whiteColor),
          ],
          color: secondaryColor,
          buttonBackgroundColor: secondaryColor,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: _page == 0
            ? Container()
            : _page == 1
            ? CartPage()
            : _page == 2
            ? const ShopFidu()
            : _page == 3
            ? OrderPage()
            : _page == 4
            ? Profile()
            : Container());
  }
}
