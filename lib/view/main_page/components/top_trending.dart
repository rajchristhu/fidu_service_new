import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/view_model/home_view_model.dart';
import '../../../utils/theme.dart';
import '../widget/topgrid.dart';

class TopTrending extends StatefulWidget {
  const TopTrending({Key? key}) : super(key: key);

  @override
  _TopTrendingState createState() => _TopTrendingState();
}

class _TopTrendingState extends State<TopTrending> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder: (controller) => controller.loading.value
            ? Container(
                color: Colors.white,
              )
            : controller.trendModel.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: whiteColor,
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                child: Text(
                                  "Top Trending",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 50.0,
                                height: 1,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(18)),
                                    shape: BoxShape.rectangle,
                                    color: (primaryColor)
                                    // .withOpacity(_current == entry.key ? 0.9 : 0.1)
                                    ),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: GridView.count(
                            physics: const ClampingScrollPhysics(),
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            children: List.generate(
                                controller.trendModel.length, (index) {
                              return Center(
                                child: TopGrid(
                                    choice:
                                        controller.trendModel[index].image!),
                              );
                            })),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : Container());
  }
}

