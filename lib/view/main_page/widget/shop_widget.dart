import 'package:fidu_service/core/view_model/product_detail_vm.dart';
import 'package:fidu_service/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/view_model/cart_viewmodel.dart';
import '../../../core/view_model/control_view_model.dart';
import '../../../features/main_page/widget/restaurant_app_bar.dart';
import '../../../features/main_page/widget/restaurant_food_card.dart';
import '../../../features/main_page/widget/restaurant_title_card.dart';
import '../../../res/Resources.dart';
import '../../../resources/colors.dart';
import '../../../widget/custom_progress_bar.dart';
import '../../control_view.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/filter.button/round_animated_button.dart';
import '../../widgets/filter.button/veg_or_non_slider.dart';

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
  late ScrollController _controller;
  Map<String, int> _category = <String, int>{};

  bool isVegSelected = false;
  bool isNonVegSelected = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _category.clear();
    _category = <String, int>{};
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FiduProgressDialog.instance.dismissDialog(context);
    int index = 1;
    int categoryIndex = 0;
    for (var category in widget.controller.productCategories) {
      _category.addIf(true, category, index - 1);
      index += widget.controller.productDetailModel
          .where((model) => model.description == category)
          .length;
    }
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
                  controller: _controller,
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
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.09),
                                Text(
                                  "Price",
                                  textScaleFactor: 1.3,
                                  style: TextStyle(
                                    color: textColorSmall,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(width: 10),
                                AnimatedButton(index: 0),
                              ],
                            ),
                            VegOrNonVegSlider(index: 0),
                            SizedBox(
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: widget
                                      .controller.productDetailModel.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    bool isTitlePlace = categoryIndex <
                                            widget.controller.productCategories
                                                .length &&
                                        _category[widget
                                                .controller.productCategories
                                                .elementAt(categoryIndex)]! ==
                                            index &&
                                        widget.controller.productDetailModel
                                            .where((model) =>
                                                model.description ==
                                                widget.controller
                                                    .productCategories
                                                    .elementAt(categoryIndex))
                                            .isNotEmpty;
                                    return Column(
                                      children: [
                                        isTitlePlace
                                            ? Column(
                                                children: [
                                                  const SizedBox(height: 10),
                                                  Container(
                                                    height: 1.6,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            80,
                                                    color: grayColorOne,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 6, left: 6),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                            right: 16,
                                                            left: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.09),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            widget.controller
                                                                .productCategories
                                                                .elementAt(
                                                                    categoryIndex++),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textScaleFactor:
                                                                1.3,
                                                            style: TextStyle(
                                                              color:
                                                                  textColorSmall,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Container(
                                                    height: 1.6,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            80,
                                                    color: grayColorOne,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 6, left: 6),
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              )
                                            : Container(),
                                        InkWell(
                                          onTap: () {
                                            // scrollToIndex(index);
                                          },
                                          child: FoodInRestaurant(
                                            widget.controller
                                                .productDetailModel[index],
                                            widget.cartProducts,
                                            widget.storeName,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<CartViewModel>(
                builder: (controllers) => Positioned(
                  bottom: 8,
                  left: 10,
                  child: controllers.cartProducts.isNotEmpty
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.82,
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
                                      Flexible(
                                        flex: 1,
                                        child: CustomText(
                                          text:
                                              "${controllers.cartProducts.length} products added",
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
                                          text:
                                              "Price: ${controllers.totalPrice}",
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
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: widget.controller.productCategories.length,
            itemBuilder: (BuildContext context, int index) {
              bool isAvailable = widget.controller.productDetailModel
                  .where((model) =>
                      model.description ==
                      widget.controller.productCategories.elementAt(index))
                  .isNotEmpty;
              return isAvailable
                  ? ListTile(
                      onTap: () async {
                        Navigator.maybePop(context);
                        await Future.delayed(const Duration(milliseconds: 500));
                        scrollToIndex(_category[widget
                            .controller.productCategories
                            .elementAt(index)]!);
                      },
                      leading: Text(
                        widget.controller.productCategories.elementAt(index),
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                    )
                  : Container();
            },
          ),
        );
      },
    );
  }

  void scrollToIndex(int index) {
    _controller.animateTo(
      (145 * index.toDouble()),
      curve: Curves.linear,
      duration: const Duration(milliseconds: 2000),
    );
  }

  _scrollListener() {}
}
