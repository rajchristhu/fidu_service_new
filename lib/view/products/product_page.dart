import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../core/view_model/home_view_model.dart';
import '../../core/view_model/product_detail_vm.dart';
import '../../view/productdetail/productdetail_page.dart';

import '../../core/view_model/product_view_model.dart';
import '../../utils/theme.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: GoogleFonts.nunitoSansTextTheme(
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

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    // Get.put(HomeViewModel());
    return GetBuilder<ProductViewmodel>(
        init: Get.find<ProductViewmodel>(),
        builder: (controller) => controller.loading.value
            ? Container(
                color: Colors.white,
              )
            : controller.shopViewModel.isNotEmpty
                ? Scaffold(
                    body: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          elevation: 0.3,
                          shadowColor: blackColor,
                          foregroundColor: blackColor,
                          pinned: _pinned,
                          backgroundColor: whiteColor,
                          snap: _snap,
                          floating: _floating,
                          expandedHeight: 220.0,
                          flexibleSpace: FlexibleSpaceBar(
                              titlePadding: EdgeInsets.all(10),
                              title: Row(
                                children: [
                                  Text(
                                    "Product",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontFamily:
                                          GoogleFonts.nunitoSans().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
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
                                          colors: [
                                            Colors.black,
                                            Colors.transparent
                                          ],
                                        ).createShader(Rect.fromLTRB(
                                            10, 10, rect.width, rect.height));
                                      },
                                      blendMode: BlendMode.dstATop,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            controller.shopViewModel[0].image!,
                                        placeholder: (context, url) =>
                                            Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: HexColor("#8AE2E2E2"),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                      padding:
                                          controller.shopViewModel.length - 1 ==
                                                  index
                                              ? const EdgeInsets.only(
                                                  bottom: 16,
                                                  left: 16,
                                                  right: 16,
                                                  top: 16)
                                              : 0 == index
                                                  ? const EdgeInsets.only(
                                                      left: 16,
                                                      right: 16,
                                                      top: 16)
                                                  : const EdgeInsets.only(
                                                      top: 16,
                                                      left: 16,
                                                      right: 16),
                                      child: InkWell(
                                        onTap: () {
                                          Get.put(ProductDetailViewModel());
                                          Get.find<ProductDetailViewModel>()
                                                  .id =
                                              controller
                                                  .shopViewModel[index].productId!;
                                          Get.to(
                                            const ProductDetailPage(),
                                          );
                                          Get.find<ProductDetailViewModel>().getProductDetail();

                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                flex: 0,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  2.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  2.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12.0)),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    width: 110,
                                                    height: 110,
                                                    imageUrl: controller
                                                        .shopViewModel[index]
                                                        .image!,
                                                    placeholder:
                                                        (context, url) =>
                                                            Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      color:
                                                          HexColor("#8AE2E2E2"),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      color:
                                                          HexColor("#8AE2E2E2"),
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 18,
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Mac",
                                                        style: TextStyle(
                                                            color: blackColor,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      const SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "Mac Shop",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color:
                                                                textColorSmall,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      const SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "Nunkambakkam",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color:
                                                                textColorSmall,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      const SizedBox(
                                                        height: 3,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .star_rate_rounded,
                                                              size: 17,
                                                              color: textColor),
                                                          const SizedBox(
                                                            width: 6,
                                                          ),
                                                          Text(
                                                            "4.6",
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color:
                                                                    textColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          const SizedBox(
                                                            width: 6,
                                                          ),
                                                          Text(
                                                            ".",
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color:
                                                                    textColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          const SizedBox(
                                                            width: 6,
                                                          ),
                                                          Text(
                                                            "₹ 30000 for two",
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color:
                                                                    textColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Container(
                                                        height: 1.6,
                                                        color: grayColorOne,
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 6,
                                                                left: 6),
                                                      ),
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .local_fire_department,
                                                              size: 17,
                                                              color:
                                                                  primaryColorDarkOne),
                                                          const SizedBox(
                                                            width: 6,
                                                          ),
                                                          Text(
                                                            "50% offer upto two",
                                                            maxLines: 20,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color:
                                                                    textColorSmall,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ))
                                ],
                              );
                            },
                            childCount: controller.shopViewModel.length,
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    color: Colors.white,
                  ));
  }
}
