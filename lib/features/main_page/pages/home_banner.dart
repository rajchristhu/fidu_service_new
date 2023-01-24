import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import '../../../core/FirebaseCURD.dart';
import '../../../core/view_model/home_view_model.dart';
import '../../../resources/colors.dart';
import '../../product_page/product_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeBannerLanding extends StatefulWidget {
  @override
  _HomeBannerLandingState createState() => new _HomeBannerLandingState();
}

bool check = false;

class _HomeBannerLandingState extends State<HomeBannerLanding> {
  bool checks =false;

  @override
  void initState() {
    super.initState();
    check = true;
    checks = false;
  }

  List<String> carousalList = [
    "https://blog.dineout-cdn.co.in/blog/wp-content/uploads/2019/05/Indore_Blog-1030x538.jpg",
    "https://image.freepik.com/free-vector/flat-food-banner-template_23-2149048461.jpg",
    "https://picsum.photos/200"
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();


    return GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder: (controller) => controller.loading.value
            ? Container(
          color: Colors.white,
        )
            : controller.categoryModel.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: CarouselSlider(
                items: controller.categoryModel
                    .map((item) =>
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: grayColor),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        margin: const EdgeInsets.only(
                            right: 16, left: 16, top: 25, bottom: 10),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                          // const BorderRadius.all( Radius.circular(18.0)),
                          child: InkWell(
                            onTap: () {
                              Get.to(const ProductPage());
                            },
                            child: CachedNetworkImage(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 250,
                              imageUrl: item.image!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: 250,
                                    color: HexColor("#E2E2E2"),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: 250,
                                    color: HexColor("#E2E2E2"),
                                  ),
                            ),
                          ),
                        )))
                    .toList(),
                carouselController: _controller,
                options: CarouselOptions(
                    height: 250.0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 2,
                    autoPlayCurve: Curves.easeIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: const Duration(
                        milliseconds: 800),
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: controller.categoryModel
                    .asMap()
                    .entries
                    .map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 20.0,
                      height: 4.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(18)),
                          shape: BoxShape.rectangle,
                          color: (_current == entry.key
                              ? primaryColor
                              : HexColor("#E2E2E2"))
                        // .withOpacity(_current == entry.key ? 0.9 : 0.1)
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        )
            : Container());


    //
    //   FutureBuilder(
    //   future: checks?null:FirebaseCrud.readHomebanner(),
    //   builder: (context, dataSnapshot) {
    //
    //     checks=true;
    //     if (dataSnapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else {
    //       if (dataSnapshot.error != null) {
    //         return Center(
    //           child: Text('An error occured'),
    //         );
    //       } else {
    //         return Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Container(
    //               child: CarouselSlider(
    //                 items: dataSnapshot.data!
    //                     .map((item) =>
    //                     Container(
    //                         decoration: BoxDecoration(
    //                           border: Border.all(color: grayColor),
    //                           borderRadius: BorderRadius.circular(30),
    //                         ),
    //                         margin: const EdgeInsets.only(
    //                             right: 16, left: 16, top: 25, bottom: 10),
    //                         child: ClipRRect(
    //                           borderRadius:
    //                           const BorderRadius.all(Radius.circular(30.0)),
    //                           // const BorderRadius.all( Radius.circular(18.0)),
    //                           child: InkWell(
    //                             onTap: () {
    //                               Get.to(const ProductPage());
    //                             },
    //                             child: CachedNetworkImage(
    //                               width: MediaQuery
    //                                   .of(context)
    //                                   .size
    //                                   .width,
    //                               height: 250,
    //                               imageUrl: item["image"],
    //                               fit: BoxFit.cover,
    //                               placeholder: (context, url) =>
    //                                   Container(
    //                                     width: MediaQuery
    //                                         .of(context)
    //                                         .size
    //                                         .width,
    //                                     height: 250,
    //                                     color: HexColor("#E2E2E2"),
    //                                   ),
    //                               errorWidget: (context, url, error) =>
    //                                   Container(
    //                                     width: MediaQuery
    //                                         .of(context)
    //                                         .size
    //                                         .width,
    //                                     height: 250,
    //                                     color: HexColor("#E2E2E2"),
    //                                   ),
    //                             ),
    //                           ),
    //                         )))
    //                     .toList(),
    //                 carouselController: _controller,
    //                 options: CarouselOptions(
    //                     height: 250.0,
    //                     enlargeCenterPage: true,
    //                     autoPlay: false,
    //                     aspectRatio: 2,
    //                     autoPlayCurve: Curves.easeIn,
    //                     enableInfiniteScroll: false,
    //                     autoPlayAnimationDuration: const Duration(
    //                         milliseconds: 800),
    //                     viewportFraction: 1,
    //                     onPageChanged: (index, reason) {
    //                       setState(() {
    //                         _current = index;
    //                       });
    //                     }),
    //               ),
    //             ),
    //             Container(
    //               padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: dataSnapshot.data!
    //                     .asMap()
    //                     .entries
    //                     .map((entry) {
    //                   return GestureDetector(
    //                     onTap: () => _controller.animateToPage(entry.key),
    //                     child: Container(
    //                       width: 20.0,
    //                       height: 4.0,
    //                       margin: const EdgeInsets.symmetric(
    //                           vertical: 0.0, horizontal: 2.0),
    //                       decoration: BoxDecoration(
    //                           borderRadius: const BorderRadius.all(
    //                               Radius.circular(18)),
    //                           shape: BoxShape.rectangle,
    //                           color: (_current == entry.key
    //                               ? primaryColor
    //                               : HexColor("#E2E2E2"))
    //                         // .withOpacity(_current == entry.key ? 0.9 : 0.1)
    //                       ),
    //                     ),
    //                   );
    //                 }).toList(),
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //           ],
    //         );
    //       }
    //     }
    //   },
    // );
  }}