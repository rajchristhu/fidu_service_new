class BannerModel {
  String? id, image;
  bool? new_shop;
  dynamic offer;

  BannerModel({this.id, this.image, this.new_shop, this.offer});

  BannerModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    image = map['image'];
    new_shop = map['status'];
    offer = map['name'];
  }

  toJson() {
    return {
      'id': id,
      'image': image,
      'name': new_shop,
      'status': offer,
    };
  }
}
