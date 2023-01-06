import 'package:fidu_service/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopAppBar extends StatefulWidget {
  ShopAppBar({Key? key, required this.title});

  String title;

  @override
  State<ShopAppBar> createState() => _ShopAppBarState();
}

class _ShopAppBarState extends State<ShopAppBar> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      shadowColor: blackColor,
      foregroundColor: blackColor,
      pinned: _pinned,
      backgroundColor: whiteColor,
      snap: _snap,
      floating: _floating,
      expandedHeight: 220.0,
      leading: Padding(
          padding: EdgeInsets.only(top: 15),
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.keyboard_backspace_sharp,
                color: blackColor,
                size: 30,
              ))),
      actions: <Widget>[
        Image.asset(
          "assets/icon/icon_logo.png",
          width: 50,
          height: 50,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(10),
          title: Row(
            children: [
              SizedBox(
                width: 40,
              ),
              // Text(
              //   "${widget.title}",
              //   style: TextStyle(
              //     color: blackColor,
              //     fontWeight: FontWeight.w600,
              //     fontSize: 16,
              //     fontFamily: GoogleFonts.varelaRound().fontFamily,
              //   ),
              // ),
            ],
          ),
          background: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                color: whiteColors,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(10, 10, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstATop,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://d3jmn01ri1fzgl.cloudfront.net/photoadking/webp_thumbnail/5fe3257ad6874_json_image_1608721786.webp",
                    placeholder: (context, url) => Container(
                      width: MediaQuery.of(context).size.width,
                      color: HexColor("#8AE2E2E2"),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: MediaQuery.of(context).size.width,
                      color: HexColor("#8AE2E2E2"),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
