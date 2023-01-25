import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../core/view_model/cart_viewmodel.dart';
import '../../../view/main_page/widget/separate.dart';

import '../../../core/view_model/home_view_model.dart';
import '../../../core/view_model/product_detail_vm.dart';
import '../../../res/Resources.dart';
import '../../../utils/theme.dart';
import '../../productdetail/productdetail_page.dart';
import '../../widgets/address_widget.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_text.dart';

class CartSummary extends StatefulWidget {
  CartViewModel controller;

  CartSummary(this.controller, {Key? key}) : super(key: key);

  @override
  _CartSummaryState createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
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
                      const SizedBox(height: 30),
                      SizedBox(
                        child: Text(
                          "Cart Summary ",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 80.0,
                        height: 2,
                        margin: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18)),
                            shape: BoxShape.rectangle,
                            color: (primaryColor)
                            // .withOpacity(_current == entry.key ? 0.9 : 0.1)
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Price: ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.normal),
                              )),
                          Expanded(
                              flex: 1,
                              child: Text(
                                  "₹ " +
                                      widget.controller.totalPrice.toString(),
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal))),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text("Delivery Charge: ",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal))),
                          Expanded(
                              flex: 1,
                              child: Text("₹ 50",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal))),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MySeparator(color: grayColor,),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text("Total Price: ",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal))),
                          Expanded(
                              flex: 1,
                              child: Text(
                                  "₹ " +
                                      (widget.controller.totalPrice + 50)
                                          .toString(),
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal))),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all( Radius.circular(60),
                              ),
                              color: Resources(context).color.colorPrimary),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: CustomButton(
                            'Order Now ',
                            () {
                              Get.dialog(
                                AlertDialog(
                                  content: SingleChildScrollView(
                                      child: AddressWidget(context)),
                                ),
                                barrierDismissible: false,
                              );

                              // showModalBottomSheet<void>(
                              //     isScrollControlled: true,
                              //     context: context,
                              //     backgroundColor: Colors.transparent,
                              //     builder: (BuildContext context) {
                              //       return AddressWidget(context);
                              //     });
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      MySeparator(color: grayColor,),
                    ]),
              ),
              const SizedBox(
                height: 0,
              ),
            ],
          )
        : Container(
            color: Colors.white,
          );
  }
}
