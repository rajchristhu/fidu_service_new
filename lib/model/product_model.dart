import 'package:flutter/cupertino.dart';

import '../helper/extenstion.dart';

class ProductModel {
  String? name, image,id;

  ProductModel(
      {this.name,
      this.image,
      this.id});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    id = map['id'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'id': id
    };
  }
}
