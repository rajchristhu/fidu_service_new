import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:geolocator/geolocator.dart';
import '../../view/main_page/page/shop.dart';
import '../../view/main_page/widget/background.dart';
import '../../view/main_page/widget/separate.dart';

import '../../utils/theme.dart';
class HomeMainPage extends StatefulWidget {
  static const String id = "home";

  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}
final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
Position? _currentPosition;
String? _currentAddress;
class _HomeMainPageState extends State<HomeMainPage> {
  int _page = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

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
        "${place.name!=null?place.name+" ,":""}${place.subLocality!=null?place.subLocality+" ,":""}${place.locality} ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width *
              0.80, // 75% of screen will be occupied
          child: Drawer(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration:  BoxDecoration(
                      color: whiteColors,
                    ),
                    child: ListView(

                      children: <Widget>[
                        SafeArea(
                          child:  ClipRRect(
                            borderRadius:
                            const BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                            child:
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: grayColor),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              padding: const EdgeInsets.only(bottom: 20,left: 10,top: 20),
                              child:   Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    flex: 0,
                                    child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage('https://picsum.photos/100')
                                    ),),
                                  const SizedBox(width: 15,),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          Text("Hello!",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600,fontSize:15,fontFamily: GoogleFonts.lato().fontFamily),),
                                          const SizedBox(height: 6,),
                                          Text("Maria Christhu Rajan fjhbfbhbhwebfhjewbfhb",style: TextStyle(color:blackColor,fontFamily: GoogleFonts.lato().fontFamily,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w600),)
                                        ],)
                                  ),

                                ],
                              ),),



                          ),),


                        ListTile(
                          onTap: (){
                            // getLocation();
                          },
                          leading:  Icon(
                            Icons.history_rounded,
                            size: 22,
                            color: primaryColor,
                          ),
                          // trailing: const Text(
                          //     "99+"
                          // ),
                          title:
                          Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Order History",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                            ),
                          ),


                        ),
                        MySeparator(color: grayColor,),

                        ListTile(
                          onTap: (){},

                          leading:  Icon(
                            Icons.support_agent,
                            size: 22,
                            color: primaryColor,
                          ),
                          title:
                          Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Support",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                            ),
                          ),




                        ),
                        MySeparator(color: grayColor,),

                        ListTile(
                          onTap: (){},

                          leading:  Icon(
                            Icons.help_outline_rounded,
                            size: 22,
                            color: primaryColor,
                          ),
                          title:
                          Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Help",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                            ),
                          ),



                        ),
                        MySeparator(color: grayColor,),

                        ListTile(
                          onTap: (){},
                          leading:  Icon(
                            Icons.note_outlined,
                            size: 22,
                            color: primaryColor,
                          ),
                          title:   Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Terms and Condition",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                            ),
                          ),





                        ),
                        MySeparator(color: grayColor,),

                        ListTile(
                          onTap: (){},
                          leading:  Icon(
                            Icons.star_border_rounded,
                            size: 22,
                            color: primaryColor,
                          ),
                          title: Transform(
                            transform: Matrix4.translationValues(-16, 0.0, 0.0),
                            child: Text(
                              "Rate the Application",style: TextStyle(color: blackColor,fontWeight: FontWeight.w600),
                            ),
                          ),





                        ),



                      ],
                    ),),

                  ClipPath(
                    clipper: FooterWaveClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: orangeGradients,
                            begin: Alignment.bottomLeft,
                            end: Alignment.center),
                      ),
                      height: MediaQuery.of(context).size.height ,
                    ),
                  ),

                ],
              )


          ),
        ),
        appBar: AppBar(
          toolbarHeight: 60,
          elevation:0.3,
          shadowColor: whiteColor,
          foregroundColor: whiteColor,
          actions: <Widget>[
            IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                icon: Icon(Icons.menu_rounded, size: 23, color: blackColor),
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                }),
          ],
          centerTitle: false,
          title:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 0,
                      child: InkWell(
                        child: Icon(
                          Icons.pin_drop,
                          color: primaryColor,
                          size: 16,
                        ),
                      )),
                  const SizedBox(
                    width: 3,
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Location",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: dark_blue,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(_currentAddress??"--",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: blackColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              )
            ],
          )

          ,
          backgroundColor: whiteColor,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 55.0,
          items: <Widget>[
            Icon(
              Icons.more_vert_outlined,
              size: 22,
              color: whiteColor,
            ),
            Icon(Icons.shopping_cart_rounded, size: 22, color: whiteColor),
            Icon(Icons.shopping_bag_rounded,
                size: 22, color: whiteColor),
            Icon(Icons.local_shipping_rounded, size: 22, color: whiteColor),
            Icon(Icons.person_pin, size: 22, color: whiteColor),
          ],
          color: primaryColors,
          buttonBackgroundColor: primaryColors,
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
            ? Container()
            : _page == 2
            ? const ShopMainPage()
            : _page == 3
            ? Container()
            : _page == 4
            ? Container()
            : Container());
  }
}

