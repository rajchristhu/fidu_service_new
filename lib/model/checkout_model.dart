class CheckoutModel {
  late String landmark, address, product, totalPrice, date;
  late String status;

  CheckoutModel({
    required this.landmark,
    required this.address,
    required this.product,
    required this.totalPrice,
    required this.date,
    required this.status,
  });

  CheckoutModel.fromJson(Map<dynamic, dynamic> map) {
    landmark = map['landmark'];
    address = map['address'];
    product = map['deleveryperson'];
    totalPrice = map['totalPrice'];
    status = map['status'];
  }

  toJson() {
    return {
      'landmark': landmark,
      'address': address,
      'product': product,
      'totalPrice': totalPrice,
      'date': date,
      'status': status,
    };
  }
}
