import 'package:flutter/cupertino.dart';

import '../helper/extenstion.dart';

class ShopModel {
  String? name, image, description, place,rate,offer, price,id,productId;

  ShopModel({this.name, this.image, this.description, this.place, this.rate, this.offer, this.price, this.id, this.productId});

  ShopModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    place = map['place'];
    rate = map['rate'];
    offer = map['offer'];
    price = map['price'];
    id = map['id'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'place': place,
      'rate': rate,
      'offer': offer,
      'price': price,
      'id': id,
      'productId': productId,
    };
  }
}
