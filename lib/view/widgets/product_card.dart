import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../model/product_detail_model.dart';
import '../../res/Resources.dart';

import '../../core/view_model/cart_viewmodel.dart';
import '../../model/cart_model.dart';
import 'custom_buttom.dart';
import 'custom_text.dart';

Card ProductCard(BuildContext context, ProductDetailModel productDetailModel) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2.5,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              CachedNetworkImage(
                fit: BoxFit.cover,
                height: 100.0,
                width: 100.0,
                imageUrl: productDetailModel.image!,
                placeholder: (context, url) => Container(
                  height: 130.0,
                  width: 100.0,
                  color: HexColor("#8AE2E2E2"),
                ),
                errorWidget: (context, url, error) => Container(
                  width: MediaQuery.of(context).size.width,
                  color: HexColor("#8AE2E2E2"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: productDetailModel.name!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Resources(context).color.colorBlack,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CustomText(
                      text: productDetailModel.description!,
                      fontSize: 12,
                      color: Resources(context).color.colorBlack,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: "Price: " + productDetailModel.price!,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Resources(context).color.colorBlack,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: GetBuilder<CartViewModel>(
              builder: (controllers) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: controllers.cartProducts
                            .where((element) =>
                                element.productId == productDetailModel.id)
                            .isEmpty
                        ? Resources(context).color.colorPrimary
                        : Resources(context).color.colorBlack,
                  ),
                  width: MediaQuery.of(context).size.width / 2 - 18,
                  height: 35,
                  child: controllers.cartProducts
                          .where((element) =>
                              element.productId == productDetailModel.id)
                          .isEmpty
                      ? CustomButton(
                          'ADD',
                          () {
                            controllers.addProduct(
                              CartModel(
                                name: productDetailModel.name!,
                                image: productDetailModel.image!,
                                price: productDetailModel.price!,
                                productId: productDetailModel.id!,
                              ),
                            );
                          },
                        )
                      : CustomButton("REMOVE", () {
                          controllers.removeProduct(productDetailModel.id!);
                        })),
            ),
          )
        ],
      ));
}
