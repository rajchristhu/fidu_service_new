import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/checkout_model.dart';
import '../service/firestore_checkout.dart';
import 'cart_viewmodel.dart';



class CheckoutViewModel extends GetxController {
  String? address, landmark, product, price;
int? status;
  List<CheckoutModel> _checkouts = [];

  List<CheckoutModel> get checkouts => _checkouts;

  // bool _isLoading = false;

  // bool get isLoading => _isLoading;
  ValueNotifier<bool> get isLoading => _isLoading;
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  @override
  void onInit() {
    super.onInit();
    _getCheckoutsFromFireStore();
  }

  _getCheckoutsFromFireStore() async {
    print("dsfi");
    _isLoading.value=true;
    _checkouts = [];
    List<QueryDocumentSnapshot> _checkoutsSnapshot =
        await FirestoreCheckout().getOrdersFromFirestore();
    _checkoutsSnapshot.forEach((order) {
      _checkouts
          .add(CheckoutModel.fromJson(order.data() as Map<String, dynamic>));
    });
    _isLoading.value = false;
    update();
  }

  addCheckoutToFireStore() async {
    await FirestoreCheckout().addOrderToFirestore(CheckoutModel(
      address: address!,
      landmark: landmark!,
      product: product!,
      status: status.toString(),
      totalPrice: Get.find<CartViewModel>().totalPrice.toString(),
      date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
    ));
    Get.find<CartViewModel>().removeAllProducts();
    Get.back();
    _getCheckoutsFromFireStore();
  }
}
