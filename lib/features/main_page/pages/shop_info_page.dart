import 'package:fidu_service/features/main_page/pages/static_filters_on_restaurant.dart';
import 'package:fidu_service/features/main_page/widget/restaurant_app_bar.dart';
import 'package:fidu_service/features/main_page/widget/restaurant_food_card.dart';
import 'package:fidu_service/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../widget/restaurant_title_card.dart';

class ShopInfo extends StatefulWidget {
  ShopInfo({Key? key});

  @override
  State<ShopInfo> createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.small(
          onPressed: () {},
          heroTag: null,
          backgroundColor: primaryColorDarkOne,
          child: Icon(
            Icons.restaurant_menu_rounded,
            color: whiteColor,
            size: 18,
          )),
      body: CustomScrollView(
        slivers: <Widget>[
          ShopAppBar(title: "Arabian Restaurant"),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10),
                RestaurantTitleCard(),
                SizedBox(height: 15),
                Container(
                  height: 1.7,
                  width: MediaQuery.of(context).size.width,
                  color: grayColorOne,
                  padding: EdgeInsets.only(right: 6, left: 6),
                ),
                const SizedBox(height: 10),
                StaticRestaurantFilters(),
                const SizedBox(height: 15),
                FoodInRestaurant(),
                FoodInRestaurant(),
                FoodInRestaurant(),
                FoodInRestaurant(),
                FoodInRestaurant(),
                FoodInRestaurant(),
                FoodInRestaurant(),
                FoodInRestaurant(),
                FoodInRestaurant(),
                FoodInRestaurant(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
