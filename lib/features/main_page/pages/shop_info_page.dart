import 'package:fidu_service/core/service/local_database_cart.dart';
import 'package:fidu_service/features/main_page/widget/restaurant_app_bar.dart';
import 'package:fidu_service/features/main_page/widget/restaurant_food_card.dart';
import 'package:fidu_service/resources/colors.dart';
import 'package:fidu_service/view/main_page/widget/shop_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../../core/view_model/cart_viewmodel.dart';
import '../../../core/view_model/control_view_model.dart';
import '../../../core/view_model/product_detail_vm.dart';
import '../../../model/cart_model.dart';
import '../../../res/Resources.dart';
import '../../../view/control_view.dart';
import '../../../view/widgets/custom_text.dart';
import '../../../widget/custom_progress_bar.dart';
import '../widget/restaurant_title_card.dart';
import 'package:get/get.dart';

class ShopInfo extends StatefulWidget {
  ShopInfo(this.storeName, {Key? key});

  String storeName;

  @override
  State<ShopInfo> createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  List<CartModel> _cartProducts = [];
  LocalDatabaseCart databaseCart = LocalDatabaseCart.db;

  @override
  void initState() {
    super.initState();
    databaseCart.getAllProducts().then((value) => _cartProducts = value);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailViewModel>(
        init: Get.find<ProductDetailViewModel>(),
        builder: (controller) => controller.loading.value
            ? Container(
                color: Colors.white,
                child: FiduProgressDialog.instance.showProgressDialog(context),
              )
            : ShopScreen(controller, _cartProducts, widget.storeName));
  }
}
