import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import '../../resources/colors.dart';

void main() => runApp(const ProductPage());

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: GoogleFonts.varelaRoundTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const ProductPageWidget(),
    );
  }
}

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({Key? key}) : super(key: key);

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  List<String> carousalList = [
    "https://static.vecteezy.com/system/resources/previews/001/254/978/original/creative-and-colorful-restaurant-food-social-media-banner-post-vector.jpg",
    "https://thumbs.dreamstime.com/b/fast-food-creative-poster-design-set-web-graphics-modern-vector-illustration-npremium-quality-logo-concept-pictogram-76858679.jpg",
    "https://c.neh.tw/thumb/f/720/4913631651168256.jpg",
    "https://static.vecteezy.com/system/resources/previews/001/254/978/original/creative-and-colorful-restaurant-food-social-media-banner-post-vector.jpg",
    "https://thumbs.dreamstime.com/b/fast-food-creative-poster-design-set-web-graphics-modern-vector-illustration-npremium-quality-logo-concept-pictogram-76858679.jpg",
    "https://c.neh.tw/thumb/f/720/4913631651168256.jpg",
    "https://static.vecteezy.com/system/resources/previews/001/254/978/original/creative-and-colorful-restaurant-food-social-media-banner-post-vector.jpg",
    "https://thumbs.dreamstime.com/b/fast-food-creative-poster-design-set-web-graphics-modern-vector-illustration-npremium-quality-logo-concept-pictogram-76858679.jpg",
    "https://c.neh.tw/thumb/f/720/4913631651168256.jpg"
  ];

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation:0.0,
            shadowColor: blackColor,
            foregroundColor: blackColor,
            pinned: _pinned,
            backgroundColor: whiteColor,
            snap: _snap,
            floating: _floating,
            expandedHeight: 220.0,
            leading:     Padding(padding: EdgeInsets.only(top:15),child:InkWell(
                onTap: () {
                  Get.back();
                },
                child:  Icon(
                  Icons.keyboard_backspace_sharp,
                  color: blackColor,
                  size: 30,
                )))
            ,
            actions: <Widget>[
              Image.asset("assets/icon/icon_logo.png",width: 50,height: 50,)
                
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all( 10),
                title:Row(children: [

                  SizedBox(width: 40,),
                  Text(
                    "Fidu Service",
                    style: TextStyle(color: blackColor,fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: GoogleFonts.varelaRound().fontFamily,

                    ),
                  ),
                ],),


                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      color: whiteColors,
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(
                              Rect.fromLTRB(10, 10, rect.width, rect.height));
                        },
                        blendMode: BlendMode.dstATop,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: carousalList[1],
                          placeholder: (context, url) => Container(
                            width: MediaQuery.of(context).size.width,
                            color: HexColor("#8AE2E2E2"),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: MediaQuery.of(context).size.width,
                            color: HexColor("#8AE2E2E2"),
                          ),
                        ),

                        // Image.network(
                        //   getCurated[index]
                        //       .bannerImageStorageUrl,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                        padding: carousalList.length-1 == index
                            ? const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16)
                            : 0 == index
                            ? const EdgeInsets.only(left: 16, right: 16, top: 16)
                            : const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 0,
                                  child:Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: grayColor),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0)),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      width: 110,
                                      height: 110,
                                      imageUrl: carousalList[index],
                                      placeholder: (context, url) => Container(
                                        width: MediaQuery.of(context).size.width,
                                        color: HexColor("#8AE2E2E2"),
                                      ),
                                      errorWidget: (context, url, error) => Container(
                                        width: MediaQuery.of(context).size.width,
                                        color: HexColor("#8AE2E2E2"),
                                      ),
                                    ),
                                  )))
                              ,
                              const SizedBox(
                                width: 18,
                              ),
                              Expanded(
                                  flex: 2,

                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          "Biriyani",
                                          style: TextStyle(
                                              color: blackColor,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 3,),

                                        Text(
                                          "Pizza",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: textColorSmall,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ) ,
                                        const SizedBox(height: 3,),

                                        Text(
                                          "Nunkambakkam",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: textColorSmall,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ) ,
                                        const SizedBox(height: 3,),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star_rate_rounded, size: 17, color: textColor),
                                            SizedBox(width: 6,),
                                            Text(
                                              "4.6",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ) , SizedBox(width: 6,),
                                            Text(
                                              ".",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ) , SizedBox(width: 6,),
                                            Text(
                                              "₹ 30000 for two",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ) ,
                                          ],
                                        ),
                                        const SizedBox(height: 6,),
                                        Container(
                                          height: 1.6,
                                          color: grayColorOne,
                                          padding: EdgeInsets.only(right: 6,left: 6),),
                                        const SizedBox(height: 6,),

                                        Row(children: [
                                          Icon(Icons.local_fire_department, size: 17, color: primaryColorDarkOne),
                                          SizedBox(width: 6,),
                                          Text(
                                            "50% offer upto two",
                                            maxLines: 20,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: textColorSmall,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],)

                                      ],
                                    ),
                                  ))


                            ],
                          ),
                        ))

                    // Container(
                    //     padding: carousalList.length == index
                    //         ? const EdgeInsets.only(
                    //             bottom: 0, left: 16, right: 16)
                    //         : 0 == index
                    //             ? const EdgeInsets.only(left: 16, right: 16)
                    //             : const EdgeInsets.only(
                    //                 top: 0, left: 16, right: 16),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         ClipRRect(
                    //           borderRadius: const BorderRadius.only(
                    //               topLeft: Radius.circular(14.0),
                    //               topRight: Radius.circular(2.0),
                    //               bottomLeft: Radius.circular(2.0),
                    //               bottomRight: Radius.circular(14.0)),
                    //           child: CachedNetworkImage(
                    //             fit: BoxFit.cover,
                    //             width: 90,
                    //             height: 90,
                    //             imageUrl: carousalList[index],
                    //             placeholder: (context, url) => Container(
                    //               width: MediaQuery.of(context).size.width,
                    //               color: HexColor("#8AE2E2E2"),
                    //             ),
                    //             errorWidget: (context, url, error) =>
                    //                 Container(
                    //                   width: MediaQuery.of(context).size.width,
                    //                   color: HexColor("#8AE2E2E2"),
                    //                 ),
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           width: 12,
                    //         ),
                    //         SizedBox(
                    //           width: MediaQuery.of(context).size.width - 140,
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 "Crackers",
                    //                 style: TextStyle(
                    //                     color: blackColor,
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.w600),
                    //               ),
                    //               const SizedBox(
                    //                 height: 0,
                    //               ),
                    //               Row(
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 crossAxisAlignment: CrossAxisAlignment.center,
                    //                 children: [
                    //                   Expanded(
                    //                     flex: 1,
                    //                     child: Text(
                    //                       "₹ 20000",
                    //                       style: TextStyle(
                    //                           color: blackColor,
                    //                           fontSize: 13,
                    //                           fontWeight: FontWeight.w600),
                    //                     ),
                    //                   ),
                    //                   Expanded(
                    //                     flex: 2,
                    //                     child: Text(
                    //                       "₹ 30000",
                    //                       overflow: TextOverflow.ellipsis,
                    //                       style: TextStyle(
                    //                           decoration:
                    //                           TextDecoration.lineThrough,
                    //                           color: primaryColor,
                    //                           fontSize: 10,
                    //                           fontWeight: FontWeight.w500),
                    //                     ),
                    //                   ),
                    //                   Expanded(
                    //                     flex: 1,
                    //                     child: Container(
                    //                       padding: EdgeInsets.all(3),
                    //                       decoration: BoxDecoration(
                    //                           borderRadius:
                    //                           BorderRadius.circular(5),
                    //                           color: primaryColor),
                    //                       child: Row(
                    //                         children: [
                    //                           Expanded(
                    //                             flex: 0,
                    //                             child: InkWell(
                    //                                 onTap: () {},
                    //                                 child: const Icon(
                    //                                   Icons.remove,
                    //                                   color: Colors.white,
                    //                                   size: 16,
                    //                                 )),
                    //                           ),
                    //                           Expanded(
                    //                             flex: 1,
                    //                             child: Container(
                    //                               margin: const EdgeInsets
                    //                                   .symmetric(
                    //                                   horizontal: 2),
                    //                               padding: const EdgeInsets
                    //                                   .symmetric(vertical: 0),
                    //                               decoration: BoxDecoration(
                    //                                   borderRadius:
                    //                                   BorderRadius
                    //                                       .circular(3),
                    //                                   color: primaryColor),
                    //                               child: Text(
                    //                                 '3',
                    //                                 textAlign:
                    //                                 TextAlign.center,
                    //                                 style: TextStyle(
                    //                                     fontWeight:
                    //                                     FontWeight.w600,
                    //                                     color: whiteColor,
                    //                                     fontSize: 14),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           Expanded(
                    //                             flex: 0,
                    //                             child: InkWell(
                    //                                 onTap: () {},
                    //                                 child: const Icon(
                    //                                   Icons.add,
                    //                                   color: Colors.white,
                    //                                   size: 16,
                    //                                 )),
                    //                           )
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //               const SizedBox(
                    //                 height: 0,
                    //               ),
                    //               Text(
                    //                 "20 % offer",
                    //                 maxLines: 2,
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: TextStyle(
                    //                     color: blackColor,
                    //                     fontSize: 12,
                    //                     fontWeight: FontWeight.w500),
                    //               ),
                    //               const SizedBox(
                    //                 height: 5,
                    //               ),
                    //               Text(
                    //                 "View Details",
                    //                 maxLines: 20,
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: TextStyle(
                    //                     color: primaryColor,
                    //                     fontSize: 12,
                    //                     fontWeight: FontWeight.w600),
                    //               )
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ))
                  ],
                );
              },
              childCount: carousalList.length,
            ),
          ),
        ],
      ),
    );
  }
}
