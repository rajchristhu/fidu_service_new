import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/view_model/home_view_model.dart';
import '../../../core/view_model/product_detail_vm.dart';
import '../../../utils/theme.dart';
import '../../productdetail/productdetail_page.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder: (controller) => controller.loading.value
            ? Container(
                color: Colors.white,
              )
            : controller.shopModel.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                child: Text(
                                  "Shopping ",
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
                      SizedBox(
                          child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.shopModel.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Column(
                          children: [
                            Container(
                                padding: controller.shopModel.length == index
                                    ? const EdgeInsets.only(
                                        bottom: 16, left: 16, right: 16)
                                    : 0 == index
                                        ? const EdgeInsets.only(
                                            left: 16, right: 16)
                                        : const EdgeInsets.only(
                                            top: 16, left: 16, right: 16),
                                child: InkWell(
                                  onTap: () {
                                    Get.put(ProductDetailViewModel());
                                    Get.find<ProductDetailViewModel>().id =
                                        controller.shopModel[index].id!;
                                    Get.find<ProductDetailViewModel>()
                                        .getProductDetail();
                                    Get.to(
                                      const ProductDetailPage(),
                                    );

                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 0,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12.0),
                                                    topRight:
                                                        Radius.circular(2.0),
                                                    bottomLeft:
                                                        Radius.circular(2.0),
                                                    bottomRight:
                                                        Radius.circular(12.0)),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              width: 110,
                                              height: 110,
                                              imageUrl: controller
                                                  .shopModel[index].image!,
                                              placeholder: (context, url) =>
                                                  Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: HexColor("#8AE2E2E2"),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: HexColor("#8AE2E2E2"),
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Biriyani",
                                                  style: TextStyle(
                                                      color: blackColor,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  "Pizza",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: textColorSmall,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  "Nunkambakkam",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: textColorSmall,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                        Icons.star_rate_rounded,
                                                        size: 17,
                                                        color: textColor),
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      "4.6",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: textColor,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      ".",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: textColor,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      "₹ 30000 for two",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: textColor,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
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
                                                      const EdgeInsets.only(
                                                          right: 6, left: 6),
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
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: textColorSmall,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
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
                        ),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : Container());
  }
}
