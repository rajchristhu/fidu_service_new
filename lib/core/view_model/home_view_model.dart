import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../model/shop_model.dart';
import '../../model/treanding_model.dart';

import '../../model/banner_model.dart';
import '../../model/product_model.dart';
import '../service/home_services.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  String? id;

  List<BannerModel> get categoryModel => _categoryModel;
  final List<BannerModel> _categoryModel = [];

  List<ProductModel> get dealModel => _dealModel;
  final List<ProductModel> _dealModel = [];

  List<TrendingModel> get trendModel => _trendModel;
  final List<TrendingModel> _trendModel = [];

  List<ShopModel> get shopModel => _shopModel;
  final List<ShopModel> _shopModel = [];




  HomeViewModel() {
    getBanner();
    getDeal();
    getShopping();
    getTrend();
  }

  getBanner() async {
    _loading.value = true;
    HomeService().getBanner().then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      _categoryModel.clear();
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }

  getDeal() async {
    _loading.value = true;
    HomeService().getTopDeal().then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      _dealModel.clear();
      for (int i = 0; i < value.length; i++) {
        _dealModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }

  getTrend() async {
    _loading.value = true;
    HomeService().getTopTrend().then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      _trendModel.clear();
      for (int i = 0; i < value.length; i++) {
        _trendModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }

  getShopping() async {
    _loading.value = true;
    print("asfjnasjnfasfassaf");
    HomeService().getShop().then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      shopModel.clear();
      for (int i = 0; i < value.length; i++) {
        shopModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }

}
