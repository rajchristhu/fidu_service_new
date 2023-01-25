import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../core/view_model/checkout_viewmodel.dart';
import 'package:timelines/timelines.dart';

import '../../../core/view_model/home_view_model.dart';
import '../../../core/view_model/product_detail_vm.dart';
import '../../../utils/theme.dart';
import '../../productdetail/productdetail_page.dart';
import '../widget/screen_progress.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    print("dsfds");
    return GetBuilder<CheckoutViewModel>(
        init: Get.find<CheckoutViewModel>(),
        builder: (controller) => controller.isLoading.value
            ? Container(
                color: Colors.white,
              )
            : controller.checkouts.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: Text(
                                  "Order Details ",
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
                        itemCount: controller.checkouts.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Column(
                          children: [
                            Container(
                                padding: controller.checkouts.length == index
                                    ? const EdgeInsets.only(
                                        bottom: 16, left: 16, right: 16)
                                    : 0 == index
                                        ? const EdgeInsets.only(
                                            left: 16, right: 16)
                                        : const EdgeInsets.only(
                                            top: 16, left: 16, right: 16),
                                child: InkWell(
                                  onTap: () {
                                    // Get.put(ProductDetailViewModel());
                                    // Get.find<ProductDetailViewModel>().id =
                                    // controller.checkouts[index].!;
                                    // Get.to(
                                    //   const ProductDetailPage(),
                                    // );
                                    // Get.find<ProductDetailViewModel>()
                                    //     .getProductDetail();
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
                                              width: 30,
                                              height: 30,
                                              imageUrl: controller
                                                  .checkouts[index].address,
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
                                                  controller
                                                      .checkouts[index].product,
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
                                                  controller
                                                      .checkouts[index].address,
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
                                                  controller.checkouts[index]
                                                      .landmark,
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
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      "₹ " +
                                                          controller
                                                              .checkouts[index]
                                                              .totalPrice,
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
                                                  children: const [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text("Ordered")),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text("Package")),
                                                    Expanded(
                                                        flex: 1,
                                                        child:
                                                            Text("Delivery")),
                                                    Expanded(
                                                        flex: 1,
                                                        child:
                                                            Text("Delivered")),
                                                  ],
                                                ),
                                                ScreenProgress(
                                                    ticks: 0,
                                                    contexts: context)
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
