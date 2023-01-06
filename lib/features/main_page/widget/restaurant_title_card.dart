import 'package:fidu_service/features/main_page/pages/shop_info_page.dart';
import 'package:fidu_service/features/main_page/widget/bottom_review_editor.dart';
import 'package:fidu_service/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class RestaurantTitleCard extends StatefulWidget {
  RestaurantTitleCard({Key? key});

  @override
  State<RestaurantTitleCard> createState() => _RestaurantTitleCardState();
}

class _RestaurantTitleCardState extends State<RestaurantTitleCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: orange,
          boxShadow: const [BoxShadow(blurRadius: 15.0, color: Colors.black12)],
        ),
        height: 200,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 220,
                          child: Text(
                            'Big Golder Salad',
                            overflow: TextOverflow.ellipsis,
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: textColorCardTitle,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                      SizedBox(width: MediaQuery.of(context).size.width - 360),
                      ElevatedButton(
                        onPressed: () async {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext bc) {
                                return BottomEditLayout();
                              }).then((value) => setState(() {}));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: primaryColorDarkOne),
                        child: const Icon(
                          Icons.add_comment_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: primaryColorDarkOne,
                            size: 17,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "4.5",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ".",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: grayColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "1360 reviews",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: textColor,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.restaurant_rounded,
                        color: primaryColorDarkOne,
                        size: 16,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Biryani, Fast Food, Chinese',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: primaryColorDarkOne,
                        size: 16,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Periyakulam Locality, Periyakulam',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 1.6,
                    width: MediaQuery.of(context).size.width - 80,
                    color: grayColorOne,
                    padding: EdgeInsets.only(right: 6, left: 6),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.directions_bike_rounded,
                        color: primaryColorDarkOne,
                        size: 16,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        '15 km away',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        '|',
                        style: TextStyle(
                          color: grayColorOne,
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Icon(
                        Icons.timelapse_rounded,
                        color: primaryColorDarkOne,
                        size: 16,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        '25 mins',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
