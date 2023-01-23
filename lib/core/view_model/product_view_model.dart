import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../model/shop_model.dart';
import '../../model/treanding_model.dart';

import '../../model/banner_model.dart';
import '../../model/product_model.dart';
import '../service/home_services.dart';

class ProductViewmodel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  String? id;

  List<ShopModel> get shopViewModel => _shopViewModel;
  final List<ShopModel> _shopViewModel = [];

  ProductViewmodel() {
    getProductView();
  }


  getProductView() async {
    _loading.value = true;
    HomeService().getProductView(id).then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      _shopViewModel.clear();
      for (int i = 0; i < value.length; i++) {
        _shopViewModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }
}
