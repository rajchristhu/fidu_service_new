import 'package:cloud_firestore/cloud_firestore.dart';
import '../../geo2/src/geo_firestore_flutter.dart';
import '../../model/product_detail_model.dart';

import '../../model/banner_model.dart';
import '../../model/product_model.dart';
import '../../model/shop_model.dart';
import '../../model/treanding_model.dart';

class HomeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<BannerModel>> getBanner() async {
    final queryLocation = GeoPoint(10.53825, 79.634827);
    GeoFirestore geoFirestore = GeoFirestore(_db.collection('deal'));

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("deal").get();
    List<DocumentSnapshot<Map<String, dynamic>>> documents = await geoFirestore.getAtLocation(queryLocation, 5,false);

    return documents
        .map((docSnapshot) => BannerModel.fromJson(docSnapshot.data()!))
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
    final queryLocation = GeoPoint(10.53825, 79.634827);
    GeoFirestore getKadai = GeoFirestore(_db.collection('kadai'));
    List<DocumentSnapshot<Map<String, dynamic>>>  documents = await getKadai.getAtLocation(queryLocation, 5,true);
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("kadai").get();
    return documents
        .map((docSnapshot) => ShopModel.fromJson(docSnapshot.data()!))
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
    print(id);
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("kadaiItem").doc(id).collection("food")
        // .where('id', isEqualTo: id.toString())
        .get();
    return snapshot.docs
        .map((docSnapshot) => ProductDetailModel.fromJson(docSnapshot.data()))
        .toList();
  }
}
