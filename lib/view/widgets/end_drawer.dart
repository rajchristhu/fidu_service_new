import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/theme.dart';
import '../../view/main_page/widget/background.dart';
import '../../view/main_page/widget/separate.dart';

Widget endDrawer(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width *
        0.80, // 75% of screen will be occupied
    child: Drawer(
        child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: whiteColors,
          ),
          child: ListView(
            children: <Widget>[
              SafeArea(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: grayColor),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 10, top: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 0,
                          child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage('https://picsum.photos/100')),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hello!",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontFamily:
                                          GoogleFonts.lato().fontFamily),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Maria Christhu Rajan fjhbfbhbhwebfhjewbfhb",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontFamily: GoogleFonts.lato().fontFamily,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  // getLocation();
                },
                leading: Icon(
                  Icons.history_rounded,
                  size: 22,
                  color: primaryColor,
                ),
                // trailing: const Text(
                //     "99+"
                // ),
                title: Transform(
                  transform: Matrix4.translationValues(-16, 0.0, 0.0),
                  child: Text(
                    "Order History",
                    style: TextStyle(
                        color: blackColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              MySeparator(
                color: grayColor,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.support_agent,
                  size: 22,
                  color: primaryColor,
                ),
                title: Transform(
                  transform: Matrix4.translationValues(-16, 0.0, 0.0),
                  child: Text(
                    "Support",
                    style: TextStyle(
                        color: blackColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              MySeparator(
                color: grayColor,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.help_outline_rounded,
                  size: 22,
                  color: primaryColor,
                ),
                title: Transform(
                  transform: Matrix4.translationValues(-16, 0.0, 0.0),
                  child: Text(
                    "Help",
                    style: TextStyle(
                        color: blackColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              MySeparator(
                color: grayColor,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.note_outlined,
                  size: 22,
                  color: primaryColor,
                ),
                title: Transform(
                  transform: Matrix4.translationValues(-16, 0.0, 0.0),
                  child: Text(
                    "Terms and Condition",
                    style: TextStyle(
                        color: blackColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              MySeparator(
                color: grayColor,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.star_border_rounded,
                  size: 22,
                  color: primaryColor,
                ),
                title: Transform(
                  transform: Matrix4.translationValues(-16, 0.0, 0.0),
                  child: Text(
                    "Rate the Application",
                    style: TextStyle(
                        color: blackColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
        ClipPath(
          clipper: FooterWaveClipper(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: orangeGradients,
                  begin: Alignment.bottomLeft,
                  end: Alignment.center),
            ),
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ],
    )),
  );
}
