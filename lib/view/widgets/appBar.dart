import 'package:flutter/material.dart';

import '../../utils/theme.dart';

AppBar appBar(GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    toolbarHeight: 60,
    elevation: 0.3,
    shadowColor: whiteColor,
    foregroundColor: whiteColor,
    actions: <Widget>[
      IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          icon: Icon(Icons.menu_rounded, size: 23, color: blackColor),
          onPressed: () {
            scaffoldKey.currentState!.openEndDrawer();
          }),
    ],
    centerTitle: false,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 0,
                child: InkWell(
                  child: Icon(
                    Icons.pin_drop,
                    color: primaryColor,
                    size: 16,
                  ),
                )),
            const SizedBox(
              width: 3,
            ),
            Expanded(
                flex: 2,
                child: Text(
                  "Location",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: dark_blue,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600),
                ))
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "--",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: blackColor, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
      ],
    ),
    backgroundColor: whiteColor,
  );
}
