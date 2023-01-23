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
    new_shop = map['new_shop'];
    offer = map['offer'];
  }

  toJson() {
    return {
      'id': id,
      'image': image,
      'new_shop': new_shop,
      'offer': offer,
    };
  }
}
