import 'package:fidu_service/resources/colors.dart';
import 'package:flutter/material.dart';

import 'numeric_pad.dart';
import 'verify_phone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class ContinueWithPhone extends StatefulWidget {
  @override
  _ContinueWithPhoneState createState() => _ContinueWithPhoneState();
}

class _ContinueWithPhoneState extends State<ContinueWithPhone> {
  String phoneNumber = "";
bool check=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.close,
          size: 30,
          color: accentColor,
        ),
        title: Text(
          "Fidu Service",
          style:GoogleFonts.pacifico(
        textStyle:  TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
        ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: SafeArea(

          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    orwhite,
                    orwhite,
                    orwhite,
                  ],
                )
            ),
            child:  Column(

              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFFFFFF),
                          Color(0xFFF7F7F7),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Lottie.asset(
                        "assets/lottie/sms.json",
                          key: Key('${Random().nextInt(999999999)}'),
                          height: 200,
                          alignment: Alignment.topCenter,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 230,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Enter your phone number",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: grayColor1,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "+91 ",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: grayColor1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    phoneNumber,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VerifyPhone(phoneNumber: phoneNumber)),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration:  BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(60),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Send OTP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                NumericPad(
                  onNumberSelected: (value) {
                    setState(() {
                      check=true;
                      // if(phoneNumber.length<10) {
                      if (value != -1) {
                        if (phoneNumber.length < 10) {
                          phoneNumber = phoneNumber + value.toString();
                        }
                        print("asd");
                      } else {
                        if (phoneNumber != "") {
                          phoneNumber =
                              phoneNumber.substring(0, phoneNumber.length - 1);
                        }
                        print("Asd");
                      }
                      // }
                    });
                  },
                ),
              ],
            ),
          )

      ),
    );
  }
}
