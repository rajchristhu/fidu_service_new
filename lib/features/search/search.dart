import 'package:fidu_service/widget/base_app_widget.dart';
import 'package:flutter/material.dart';
import '../../resources/colors.dart';
import '../../resources/size_helper.dart';
import 'package:get/get.dart';

import '../../widget/text_widget.dart';
import '../main_page/pages/shopping_page.dart';

class SearchPage extends FiduServiceFullWidget {
  String queryStr;

  SearchPage(this.queryStr);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends FiduService<SearchPage> {
  final SizeHelper _sizeHelper = SizeHelper.getInstance();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.keyboard_backspace_sharp,
                          color: blackColor,
                          size: 30,
                        )),
                    widget.queryStr == ""
                        ? const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Search ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ))
                        : const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Fidu Service ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )),
                  ],
                )),


            Padding(
              padding: const EdgeInsets.only(top: 30, right: 16, left: 16),
              child: TextFormField(
                cursorColor: accentColor,
                initialValue: widget.queryStr,
                autofocus: true,
                toolbarOptions: const ToolbarOptions(
                    copy: true, paste: true, cut: true, selectAll: true),
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
                      icon: const Icon(Icons.clear),
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
                      color: grayColor1.withOpacity(0.7)),
                  hintText: "Search",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: dark_blue.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: dark_blue.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: ShoppingPage(false),
            ),
            widget.queryStr == "" ?
            Padding(padding: EdgeInsets.only(left: 20,top: 20),child: Text("Enjoy Your\nFav Food",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),) ,)

                : Container(),
          ],
        ),
        
      )
      ,
    );
  }
}
