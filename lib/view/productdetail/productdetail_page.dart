import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../core/view_model/product_detail_vm.dart';
import '../../res/Resources.dart';

import '../../../utils/theme.dart';
import '../../core/view_model/productvm.dart';
import '../../core/view_model/cart_viewmodel.dart';
import '../../core/view_model/control_view_model.dart';
import '../control_view.dart';
import '../widgets/appBar.dart';
import '../widgets/custom_text.dart';
import '../widgets/end_drawer.dart';
import '../widgets/product_card.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailViewModel>(
        init: Get.find<ProductDetailViewModel>(),
        builder: (controller) => controller.loading.value
            ? Container(
                color: Colors.white,
              )
            : controller.productDetailModel.isNotEmpty
                ? Stack(
                    children: [
                      Scaffold(
                          key: _scaffoldKey,
                          endDrawer: endDrawer(context),
                          appBar: appBar(_scaffoldKey),
                          backgroundColor: whiteColor,
                          body: Container(
                            padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height,
                            child: GridView.count(
                              primary: true,
                              crossAxisCount: 2,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0,
                              childAspectRatio: 0.90,
                              children: List.generate(
                                  controller.productDetailModel.length,
                                  (index) {
                                return ProductCard(context,
                                    controller.productDetailModel[index]);
                              }),
                            ),
                          )),
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
                                            color: Resources(context)
                                                .color
                                                .colorPrimary,
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: CustomText(
                                                      text: controllers
                                                              .cartProducts
                                                              .length
                                                              .toString() +
                                                          " products added",
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                                      fontWeight:
                                                          FontWeight.normal,
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
                  ));
  }
}
