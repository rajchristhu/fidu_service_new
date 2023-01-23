class Product {
  dynamic id;
  dynamic price;
  dynamic name;
  dynamic img;

  Product({ this.id,  this.price,  this.name, this.img});

  Product.fromMap(Map snapshot,String id) :
        price = snapshot['price'] ?? '',
        name = snapshot['name'] ?? '',
        img = snapshot['img'] ?? '';

  toJson() {
    return {
      "price": price,
      "name": name,
      "img": img,
    };
  }
}