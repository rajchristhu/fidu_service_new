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
  final List<ProductDetailModel> _productDetailModel = [];

  ProductDetailViewModel() {
    // getProductDetail();
  }


  getProductDetail() async {
    _loading.value = true;
print("object");
    HomeService().getProductDetail(id).then((value) {
print(value);
      if (value.isEmpty) {
        _loading.value = false;
      }
      _productDetailModel.clear();
      for (int i = 0; i < value.length; i++) {
        _productDetailModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }
}
