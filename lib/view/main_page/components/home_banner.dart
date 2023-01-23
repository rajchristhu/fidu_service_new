import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../../core/view_model/home_view_model.dart';
import '../../../model/product_models.dart';
import '../../../utils/theme.dart';
import '../../../core/view_model/productvm.dart';

class HomeBannerLanding extends StatefulWidget {
  @override
  _HomeBannerLandingState createState() => new _HomeBannerLandingState();
}

bool check = false;

class _HomeBannerLandingState extends State<HomeBannerLanding> {
  @override
  void initState() {
    super.initState();
    check = true;
  }

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
                        padding:
                            const EdgeInsets.only(right: 16, left: 16, top: 20),
                        child: CarouselSlider(
                          items: controller.categoryModel
                              .map((item) => Container(
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0),
                                            topRight: Radius.circular(3.0),
                                            bottomLeft: Radius.circular(3.0)),
                                        // const BorderRadius.all( Radius.circular(18.0)),
                                        child: InkWell(
                                          onTap: () {},
                                          child: CachedNetworkImage(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100,
                                            imageUrl: item.image!,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 160,
                                              color: HexColor("#E2E2E2"),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 160,
                                              color: HexColor("#E2E2E2"),
                                            ),
                                          ),
                                        )),
                                    color: Colors.transparent,
                                  ))
                              .toList(),
                          carouselController: _controller,
                          options: CarouselOptions(
                              height: 160.0,
                              enlargeCenterPage: true,
                              autoPlay: false,
                              aspectRatio: 2,
                              autoPlayCurve: Curves.easeIn,
                              enableInfiniteScroll: false,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(right: 16, left: 16, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: controller.categoryModel
                              .asMap()
                              .entries
                              .map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 15.0,
                                height: 3.0,
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
  }
}
