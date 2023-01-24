import 'package:flutter/cupertino.dart';

import '../helper/extenstion.dart';

class ProductDetailModel {
  String? name, image, description, qty,rate,offer, price,id,productId;

  ProductDetailModel({this.name, this.image, this.description, this.qty, this.rate, this.offer, this.price, this.id, this.productId});

  ProductDetailModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['foodname'];
    image = map['image'];
    description = map['menu'];
    qty = map['quantity'];
    rate = map['originalprice'];
    offer = map['menu'];
    price = map['price'];
    id = map['id'];
    productId = map['itemId'];
  }

  toJson() {
    return {
      'foodname': name,
      'image': image,
      'description': description,
      'qty': qty,
      'rate': rate,
      'offer': offer,
      'price': price,
      'id': id,
      'productId': productId,
    };
  }
}
