import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../core/view_model/cart_viewmodel.dart';

import '../../../core/view_model/home_view_model.dart';
import '../../../core/view_model/product_detail_vm.dart';
import '../../../utils/theme.dart';
import '../../productdetail/productdetail_page.dart';

class CartListPage extends StatefulWidget {
  CartViewModel controller;

  CartListPage(this.controller, {Key? key}) : super(key: key);

  @override
  _CartListPageState createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  @override
  Widget build(BuildContext context) {
    return widget.controller.cartProducts.isNotEmpty
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
                          "Cart Details ",
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18)),
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
                itemCount: widget.controller.cartProducts.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    Container(
                        padding: widget.controller.cartProducts.length == index
                            ? const EdgeInsets.only(
                                bottom: 16, left: 16, right: 16)
                            : 0 == index
                                ? const EdgeInsets.only(left: 16, right: 16)
                                : const EdgeInsets.only(
                                    top: 16, left: 16, right: 16),
                        child: InkWell(
                          onTap: () {
                            // Get.put(ProductDetailViewModel());
                            // Get.find<ProductDetailViewModel>().id =
                            // controller.cartProducts[index].productId!;
                            // Get.to(
                            //   const ProductDetailPage(),
                            // );
                            // Get.find<ProductDetailViewModel>()
                            //     .getProductDetail();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 0,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(2.0),
                                        bottomLeft: Radius.circular(2.0),
                                        bottomRight: Radius.circular(12.0)),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                      imageUrl: widget
                                          .controller.cartProducts[index].image,
                                      placeholder: (context, url) => Container(
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
                                          widget.controller.cartProducts[index]
                                              .name,
                                          style: TextStyle(
                                              color: blackColor,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 3,
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
                                              width: 6,
                                            ),
                                            Text(
                                              "₹ " +
                                                  widget
                                                      .controller
                                                      .cartProducts[index]
                                                      .price,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Container(
                                          height: 1.6,
                                          color: grayColorOne,
                                          padding: const EdgeInsets.only(
                                              right: 6, left: 6),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            widget.controller.removeProduct(
                                                widget
                                                    .controller
                                                    .cartProducts[index]
                                                    .productId);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.delete_forever,
                                                  size: 17,
                                                  color: primaryColorDarkOne),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "Remove the Item",
                                                maxLines: 20,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: textColorSmall,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
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
        : Container(
            color: Colors.white,
          );
  }
}
