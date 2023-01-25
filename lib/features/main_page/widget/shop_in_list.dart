import 'package:cached_network_image/cached_network_image.dart';
import 'package:fidu_service/core/view_model/home_view_model.dart';
import 'package:fidu_service/features/main_page/pages/shop_info_page.dart';
import 'package:fidu_service/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/view_model/product_detail_vm.dart';
import '../../../model/shop_model.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({Key? key, required this.carousalList, required this.index,required this.controller})
      : super(key: key);

  final List<ShopModel> carousalList;
  final int index;
  final HomeViewModel controller;

  // final

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.put(ProductDetailViewModel());
        Get.find<ProductDetailViewModel>().id =
        controller.shopModel[index].id!;
        Get.to(
           ShopInfo(carousalList[index].name!),
        );
        Get.find<ProductDetailViewModel>()
            .getProductDetail();
        // Get.to(ShopInfo());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 0,
              child: Container(
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
                      imageUrl: carousalList[index].image!,
                      placeholder: (context, url) => Container(
                        width: MediaQuery.of(context).size.width,
                        color: HexColor("#8AE2E2E2"),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: MediaQuery.of(context).size.width,
                        color: HexColor("#8AE2E2E2"),
                      ),
                    ),
                  ))),
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
                      carousalList[index].name!,
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      (carousalList[index].offer).toString().trim() != ""
                          ? carousalList[index].offer!
                          : "-",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textColorSmall,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      (carousalList[index].description).toString().trim() != ""
                          ? carousalList[index].description!
                          : "-",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textColorSmall,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star_rate_rounded,
                            size: 17, color: textColor),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "4.6",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          ".",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "₹ 30000 for two",
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
                      padding: EdgeInsets.only(right: 6, left: 6),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          carousalList[index].type == "veg"
                              ? 'assets/pages/veg.png'
                              : "assets/pages/non-veg.png",
                          height: 14,
                          width: 14,
                        ),
                        // Icon(Icons.local_fire_department,
                        //     size: 17, color: primaryColorDarkOne),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "50% offer upto two",
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: textColorSmall,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
