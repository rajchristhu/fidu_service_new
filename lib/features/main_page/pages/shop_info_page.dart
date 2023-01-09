import 'package:fidu_service/features/main_page/pages/static_filters_on_restaurant.dart';
import 'package:fidu_service/features/main_page/widget/filters.dart';
import 'package:fidu_service/features/main_page/widget/restaurant_app_bar.dart';
import 'package:fidu_service/features/main_page/widget/restaurant_food_card.dart';
import 'package:fidu_service/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../widget/restaurant_title_card.dart';

class ShopInfo extends StatefulWidget {
  ShopInfo({Key? key});

  @override
  State<ShopInfo> createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  GlobalKey<State<StatefulWidget>> bestSellerKey = GlobalKey();
  GlobalKey<State<StatefulWidget>> vegMenuKey = GlobalKey();
  GlobalKey<State<StatefulWidget>> nonVegMenuKey = GlobalKey();

  Future scrollToVeg(context) async {
    await Scrollable.ensureVisible(
      context,
      alignment: 0.3,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.small(
        foregroundColor: grayColor,
        backgroundColor: primaryColorDarkOne,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return BottomFilters();
              }).then((value) => setState(() {}));
        },
        child: Icon(
          Icons.local_restaurant_rounded,
          size: 26,
          color: whiteColor,
        ),
      )
      // SpeedDial(
      //   // animatedIcon: AnimatedIcons.menu_close,
      //   icon: Icons.local_restaurant_rounded,
      //   backgroundColor: primaryColorDarkOne,
      //   foregroundColor: whiteColor,
      //   overlayColor: Colors.black,
      //   overlayOpacity: 0.5,
      //   children: [
      //     SpeedDialChild(
      //         child: Icon(
      //           Icons.energy_savings_leaf_rounded,
      //           color: primaryColorDarkOne,
      //         ),
      //         label: 'Best Seller',
      //         onTap: () => {scrollToVeg(bestSellerKey.currentContext)}),
      //     SpeedDialChild(
      //         child: Icon(
      //           Icons.add,
      //           color: primaryColorDarkOne,
      //         ),
      //         label: 'Veg menu',
      //         onTap: () => {scrollToVeg(vegMenuKey.currentContext)}),
      //     SpeedDialChild(
      //         child: Icon(
      //           Icons.add_comment_outlined,
      //           color: primaryColorDarkOne,
      //         ),
      //         label: 'Non-Veg menu',
      //         onTap: () => {scrollToVeg(nonVegMenuKey.currentContext)}),
      //   ],
      // ),
      ,
      body: CustomScrollView(
        slivers: <Widget>[
          ShopAppBar(title: "Arabian Restaurant"),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  key: bestSellerKey,
                  child: SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Best Seller",
                          style: TextStyle(
                            color: textColorSmall,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                Container(
                  key: vegMenuKey,
                  child: SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Veg Menu",
                          style: TextStyle(
                            color: textColorSmall,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                Container(
                  key: nonVegMenuKey,
                  child: SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Non Veg Menu",
                          style: TextStyle(
                            color: textColorSmall,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
