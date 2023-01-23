import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/product_detail_model.dart';

import '../../model/banner_model.dart';
import '../../model/product_model.dart';
import '../../model/shop_model.dart';
import '../../model/treanding_model.dart';

class HomeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<BannerModel>> getBanner() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Banners").get();
    return snapshot.docs
        .map((docSnapshot) => BannerModel.fromJson(docSnapshot.data()))
        .toList();
  }

  Future<List<ProductModel>> getTopDeal() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Deals").get();
    return snapshot.docs
        .map((docSnapshot) => ProductModel.fromJson(docSnapshot.data()))
        .toList();
  }

  Future<List<TrendingModel>> getTopTrend() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("Trending").get();
    return snapshot.docs
        .map((docSnapshot) => TrendingModel.fromJson(docSnapshot.data()))
        .toList();
  }

  Future<List<ShopModel>> getShop() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("Shop").get();
    return snapshot.docs
        .map((docSnapshot) => ShopModel.fromJson(docSnapshot.data()))
        .toList();
  }  
  
  Future<List<ShopModel>> getProductView(id) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("ProductView")
        .where('id', isEqualTo: id.toString())
        .get();
    return snapshot.docs
        .map((docSnapshot) => ShopModel.fromJson(docSnapshot.data()))
        .toList();
  }
  Future<List<ProductDetailModel>> getProductDetail(id) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("ProductDetail")
        .where('id', isEqualTo: id.toString())
        .get();
    return snapshot.docs
        .map((docSnapshot) => ProductDetailModel.fromJson(docSnapshot.data()))
        .toList();
  }
}
