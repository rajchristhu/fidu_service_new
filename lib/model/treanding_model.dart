class TrendingModel {
  String? name, image, id;

  TrendingModel({this.name, this.image, this.id});

  TrendingModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    id = map['id'];
  }

  toJson() {
    return {'name': name, 'image': image, 'id': id};
  }
}
