import 'package:flutter/material.dart';
import '../../../utils/theme.dart';
import '../components/order_detail.dart';
import '../components/shopping_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    print("sdfhjds");

    return Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [OrderDetail()])));
  }
}
