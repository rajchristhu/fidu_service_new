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
    image = map['kadaiImage'];
    description = map['address'];
    place = map['oru'];
    rate = map['count'];
    offer = map['maindish'];
    price = map['phoneno'];
    id = map['id'];
    productId = map['type'];
  }

  toJson() {
    return {
      'name': name,
      'kadaiImage': image,
      'address': description,
      'oru': place,
      'count': rate,
      'maindish': offer,
      'phoneno': price,
      'id': id,
      'productId': productId,
    };
  }
}
