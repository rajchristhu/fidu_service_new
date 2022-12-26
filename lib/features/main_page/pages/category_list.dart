import 'package:cached_network_image/cached_network_image.dart';
import 'package:fidu_service/features/search/search.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import '../../../resources/colors.dart';
import '../../product_page/product_page.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}



class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    List<String> carousalList = ["https://static.vecteezy.com/system/resources/previews/001/254/978/original/creative-and-colorful-restaurant-food-social-media-banner-post-vector.jpg",
      "https://thumbs.dreamstime.com/b/fast-food-creative-poster-design-set-web-graphics-modern-vector-illustration-npremium-quality-logo-concept-pictogram-76858679.jpg",
      "https://c.neh.tw/thumb/f/720/4913631651168256.jpg"

    ];
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

            SizedBox(
              child: Text(
                "Top Deal",
                style: TextStyle(
                    color: blackColor, fontSize: 17.0, fontWeight: FontWeight.w700),
              ),
            ),
                const SizedBox(
                  height: 5,
                ),
            Container(
              width: 50.0,
              height: 0,
              margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  shape: BoxShape.rectangle,
                  color: ( primaryColor)
                // .withOpacity(_current == entry.key ? 0.9 : 0.1)
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            height: 160.0,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: carousalList.length,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Container(

                      padding: carousalList.length == index
                          ? const EdgeInsets.only(right: 16)
                          : 0 == index
                          ? const EdgeInsets.only(left: 16, right: 16)
                          : const EdgeInsets.only(right: 16),
                      child:
                      InkWell(
                        onTap: (){
                          Get.to( SearchPage("Hello"));
                        },
                        child:  Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: grayColor),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(18.0)),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 130,
                                  height: 130,
                                  imageUrl: carousalList[index],
                                  placeholder:
                                      (context, url) =>
                                      Container(
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width,
                                        height: 150,
                                        color:
                                        HexColor("#8AE2E2E2"),
                                      ),
                                  errorWidget:
                                      (context, url, error) =>
                                      Container(
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width,
                                        height: 150,
                                        color:
                                        HexColor("#8AE2E2E2"),
                                      ),
                                ),
                              ),
                            )
                            ,
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   "Offer Available",
                            //   style: TextStyle(
                            //       color: blackColor,
                            //       fontSize: 12,
                            //       fontWeight: FontWeight.w600),
                            // )
                          ],
                        ),
                      )


                  )
                ],
              ),
            )),
        const SizedBox(
          height: 0,
        ),
      ],
    );
  }
}
