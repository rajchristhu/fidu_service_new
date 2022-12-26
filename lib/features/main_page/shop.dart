import 'package:fidu_service/features/main_page/pages/category_list.dart';
import 'package:fidu_service/features/main_page/pages/home_banner.dart';
import 'package:fidu_service/features/main_page/pages/shopping_page.dart';
import 'package:fidu_service/features/main_page/pages/top_trending.dart';
import 'package:fidu_service/features/search/search.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../widget/text_widget.dart';
import 'package:get/get.dart';

class ShopFidu extends StatefulWidget {
  const ShopFidu({Key? key}) : super(key: key);

  @override
  _ShopFiduState createState() => _ShopFiduState();
}

class _ShopFiduState extends State<ShopFidu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(SearchPage(""));
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 16, left: 16),
                      child:  InkWell(
                        onTap: () {
                          Get.to(SearchPage(""));
                        },
                        child:TextFormField(
                        cursorColor: accentColor,
                        enableInteractiveSelection: false,
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Get.to(SearchPage(""));
                        },
                        toolbarOptions: const ToolbarOptions(
                            copy: true, paste: true, cut: true, selectAll: true
                            //by default all are disabled 'false'
                            ),
                        decoration: InputDecoration(
                          fillColor: Colors.white38,
                          filled: true,
                          counterText: "",
                          labelText: "Type Food, Shop etc..",
                          errorStyle: textStyle(
                            fontSize: 10,
                            color: accentColor.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              color: accentColor.withOpacity(0.7),
                              onPressed: () {}),
                          errorMaxLines: 3,
                          labelStyle: editTextStyle(
                            color: accentColor.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          hintStyle: hintTextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: accentColor.withOpacity(0.7)),
                          hintText: "Search",

                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          // contentPadding: type == FIELD_TYPE.MOB_NO
                          //     ? EdgeInsets.only(
                          //         left: _sizeHelper.mobileLabelPaddingLeft(context),
                          //         top: 24, //system defined padding
                          //         right: 12, //system defined padding
                          //         bottom: 16, //system defined padding
                          //       )
                          //     : null,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: dark_blue.withOpacity(0.2)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: dark_blue.withOpacity(0.2)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                    ),
                  ),
                  HomeBannerLanding(),
                  const CategoryList(),
                  const TopTrending(),
                   ShoppingPage(true)
                ])));
  }
}
