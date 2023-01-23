
import 'package:flutter/material.dart';

class PhoneNoAuth extends StatefulWidget {
  const PhoneNoAuth({Key? key, required this.title}) : super(key: key);
  final String title;
  static const String id = "phoneno_auth";

  @override
  State<PhoneNoAuth> createState() => _PhoneNoAuthState();
}

class _PhoneNoAuthState extends State<PhoneNoAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}