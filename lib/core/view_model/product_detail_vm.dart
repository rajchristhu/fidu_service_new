import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../model/product_detail_model.dart';
import '../../model/shop_model.dart';
import '../../model/treanding_model.dart';

import '../../model/banner_model.dart';
import '../../model/product_model.dart';
import '../service/home_services.dart';

class ProductDetailViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  String? id;

  List<ProductDetailModel> get productDetailModel => _productDetailModel;

  Set<String> get productCategories => _productCategories;
  final List<ProductDetailModel> _productDetailModel = [];
  final Set<String> _productCategories = {};

  ProductDetailViewModel() {
    // getProductDetail();
  }

  getProductDetail() async {
    _loading.value = true;
    HomeService().getProductDetail(id).then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      _productDetailModel.clear();
      _productCategories.clear();
      for (int i = 0; i < value.length; i++) {
        _productDetailModel.add(value[i]);
        _productCategories.add(value[i].description ?? "");
        _loading.value = false;
      }
      update();
    });
  }
}
