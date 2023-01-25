import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../core/view_model/cart_viewmodel.dart';
import '../../../res/Resources.dart';
import '../../../utils/theme.dart';
import '../../../core/view_model/productvm.dart';
import '../../widgets/custom_text.dart';
import '../components/cart_list.dart';
import '../components/cart_summary.dart';
import '../components/category_list.dart';
import '../components/home_banner.dart';
import '../components/shopping_page.dart';
import '../components/top_trending.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    Get.find<CartViewModel>().getCartProducts();

    return GetBuilder<CartViewModel>(
        init: Get.find<CartViewModel>(),
        builder: (controller) => Scaffold(
            backgroundColor: whiteColor,
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CartSummary(controller),
                    CartListPage(controller),
                  ]),
            )));
  }
}
