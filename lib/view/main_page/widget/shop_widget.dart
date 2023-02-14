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
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/filter.button/round_animated_button.dart';

class ShopScreen extends StatefulWidget {
  ShopScreen(this.controller, this.cartProducts, this.storeName, {super.key});

  late ProductDetailViewModel controller;
  late List<CartModel> cartProducts;
  late String storeName;

  @override
  State<StatefulWidget> createState() {
    return ShopScreenState();
  }
}

class ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FiduProgressDialog.instance.dismissDialog(context);
    print(widget.controller.productCategories);
    return widget.controller.productDetailModel.isNotEmpty
        ? Stack(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                floatingActionButton: FloatingActionButton.small(
                    onPressed: () {
                      bottomSheetMore(context);
                    },
                    heroTag: null,
                    backgroundColor: primaryColorDarkOne,
                    child: Icon(
                      Icons.restaurant_menu_rounded,
                      color: whiteColor,
                      size: 18,
                    )),
                body: CustomScrollView(
                  slivers: <Widget>[
                    ShopAppBar(title: widget.storeName),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          const SizedBox(height: 10),
                          RestaurantTitleCard(),
                          const SizedBox(height: 15),
                          Container(
                            height: 1.7,
                            width: MediaQuery.of(context).size.width,
                            color: grayColorOne,
                            padding: const EdgeInsets.only(right: 6, left: 6),
                          ),
                          const SizedBox(height: 10),
                          // StaticRestaurantFilters(),
                          AnimatedButton(index: 0),
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
                                    widget.controller.productDetailModel.length,
                                itemBuilder:
                                    (BuildContext context, int index) => Column(
                                  children: [
                                    FoodInRestaurant(
                                      widget
                                          .controller.productDetailModel[index],
                                      widget.cartProducts,
                                      widget.storeName,
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                  child: controllers.cartProducts.isNotEmpty
                      ? SizedBox(
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
                                color: Resources(context).color.colorPrimary,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: CustomText(
                                          text: controllers.cartProducts.length
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
                                              controllers.totalPrice.toString(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Resources(context)
                                              .color
                                              .colorWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ),
            ],
          )
        : Container(color: Colors.red);
  }

  void bottomSheetMore(context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      backgroundColor: whiteColor,
      context: context,
      builder: (builder) {
        return Container(
          height: MediaQuery.of(context).size.height / 2.3,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: grayColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                width: 70,
                height: 10,
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.1,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Menu',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget
                                      .controller.productCategories.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Text(widget.controller.productCategories.elementAt(index)),
                                    );
                                  })
                            ],
                          ),
                        ),
                        const Divider(height: 10.0),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        color: Colors.grey),
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: 45,
                    child: CustomButton(
                      'Clear',
                      () {
                        Navigator.maybePop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(60),
                        ),
                        color: Resources(context).color.colorPrimary),
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: 45,
                    child: CustomButton(
                      'Apply ',
                      () {
                        Navigator.maybePop(context);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        );
      },
    );
  }
}
