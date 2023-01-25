import 'package:fidu_service/core/view_model/product_detail_vm.dart';
import 'package:fidu_service/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/view_model/cart_viewmodel.dart';
import '../../../core/view_model/control_view_model.dart';
import '../../../features/main_page/pages/static_filters_on_restaurant.dart';
import '../../../features/main_page/widget/restaurant_app_bar.dart';
import '../../../features/main_page/widget/restaurant_food_card.dart';
import '../../../features/main_page/widget/restaurant_title_card.dart';
import '../../../res/Resources.dart';
import '../../../resources/colors.dart';
import '../../../widget/custom_progress_bar.dart';
import '../../control_view.dart';
import '../../widgets/custom_text.dart';

class ShopWidget extends StatelessWidget {
  ProductDetailViewModel controller;
  List<CartModel> cartProducts;
  String storeName;

  ShopWidget(this.controller, this.cartProducts, this.storeName);

  @override
  Widget build(BuildContext context) {
    FiduProgressDialog.instance.dismissDialog(context);
    return controller.productDetailModel.isNotEmpty
        ? Stack(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                floatingActionButton: FloatingActionButton.small(
                    onPressed: () {},
                    heroTag: null,
                    backgroundColor: primaryColorDarkOne,
                    child: Icon(
                      Icons.restaurant_menu_rounded,
                      color: whiteColor,
                      size: 18,
                    )),
                body: CustomScrollView(
                  slivers: <Widget>[
                    ShopAppBar(title: storeName),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          SizedBox(height: 10),
                          RestaurantTitleCard(),
                          SizedBox(height: 15),
                          Container(
                            height: 1.7,
                            width: MediaQuery.of(context).size.width,
                            color: grayColorOne,
                            padding: EdgeInsets.only(right: 6, left: 6),
                          ),
                          const SizedBox(height: 10),
                          StaticRestaurantFilters(),
                          const SizedBox(height: 15),
                          SizedBox(
                            child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      controller.productDetailModel.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Column(
                                    children: [
                                      FoodInRestaurant(
                                          controller.productDetailModel[index],
                                          cartProducts,
                                          storeName)
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              GetBuilder<CartViewModel>(
                  builder: (controllers) => Positioned(
                      bottom: 0,
                      child: controllers.cartProducts.length != 0
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              child: Material(
                                  child: InkWell(
                                onTap: () {
                                  Get.put(ControlViewModel());
                                  Get.find<ControlViewModel>()
                                      .changeSelectedValue(1);
                                  Get.offAll(ControlView());
                                },
                                child: Card(
                                    color:
                                        Resources(context).color.colorPrimary,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: CustomText(
                                              text: controllers
                                                      .cartProducts.length
                                                      .toString() +
                                                  " products added",
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Resources(context)
                                                  .color
                                                  .colorWhite,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: CustomText(
                                              text: "Price: " +
                                                  controllers.totalPrice
                                                      .toString(),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Resources(context)
                                                  .color
                                                  .colorWhite,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              )))
                          : Container())),
            ],
          )
        : Container(
            color: Colors.white,
          );
  }
}
