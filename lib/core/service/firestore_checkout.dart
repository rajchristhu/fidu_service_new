import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/checkout_model.dart';


class FirestoreCheckout {
  final CollectionReference _ordersCollection = FirebaseFirestore.instance
      // .collection('users')
      // .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('order');
  Future<List<QueryDocumentSnapshot>> getOrdersFromFirestore() async {
    print("asdjasd");

    var _orders =
        await _ordersCollection.where("status",isEqualTo: "open").get();
    return _orders.docs;
  }

  addOrderToFirestore(CheckoutModel checkoutModel) async {
    await _ordersCollection.doc().set(checkoutModel.toJson());
  }
}
