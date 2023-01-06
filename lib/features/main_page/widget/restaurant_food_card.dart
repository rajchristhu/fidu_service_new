import 'package:fidu_service/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FoodInRestaurant extends StatefulWidget {
  FoodInRestaurant({Key? key});

  @override
  State<FoodInRestaurant> createState() => _FoodInRestaurantState();
}

class _FoodInRestaurantState extends State<FoodInRestaurant> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 0,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: grayColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 110,
                      height: 110,
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
                  ))),
          const SizedBox(
            width: 18,
          ),
          Expanded(
              flex: 2,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Biriyani",
                                style: TextStyle(
                                    color: blackColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Pizza",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: textColorSmall,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Nunkambakkam",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: textColorSmall,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: counter == 0
                              ? SizedBox(
                                  width: 75,
                                  height: 25,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      counter++;
                                      setState(() {});
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        backgroundColor: whiteColor,
                                        padding: EdgeInsets.all(0)),
                                    child: Text("Add",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: primaryColorDark,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          counter--;
                                          setState(() {});
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            backgroundColor:
                                                primaryColorDarkOne,
                                            padding: EdgeInsets.all(0)),
                                        child: Icon(
                                          Icons.remove,
                                          color: whiteColor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "$counter",
                                      style: TextStyle(
                                        color: textColorSmall,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          counter++;
                                          setState(() {});
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            backgroundColor:
                                                primaryColorDarkOne,
                                            padding: EdgeInsets.all(0)),
                                        child: Icon(
                                          Icons.add,
                                          color: whiteColor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star_rate_rounded,
                            size: 17, color: textColor),
                        SizedBox(width: 6),
                        Text(
                          "4.6",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 6),
                        Text(
                          ".",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "₹ 30000 for two",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 1.6,
                      color: grayColorOne,
                      padding: EdgeInsets.only(right: 6, left: 6),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.local_fire_department,
                            size: 17, color: primaryColorDarkOne),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "50% offer upto two",
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: textColorSmall,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
