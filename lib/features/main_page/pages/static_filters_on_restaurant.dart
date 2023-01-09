import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class StaticRestaurantFilters extends StatefulWidget {
  const StaticRestaurantFilters({super.key});

  @override
  State<StaticRestaurantFilters> createState() =>
      _StaticRestaurantFiltersState();
}

class _StaticRestaurantFiltersState extends State<StaticRestaurantFilters> {
  bool isVegSelected = false;
  bool isNonVegSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle customFilterStyle = TextStyle(
      fontSize: 16,
      color: textColor,
      fontWeight: FontWeight.w600,
    );

    return Container(
      height: 35,
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 15),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVegSelected = !isVegSelected;
                    setState(() {});
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: BorderSide(
                            width: 0.5,
                            color: isVegSelected
                                ? primaryColorDarkOne
                                : whiteColor)),
                    backgroundColor:
                        isVegSelected ? chipSelectedColor : whiteColor,
                    padding: EdgeInsets.all(8)),
                child: Row(
                  children: [
                    Image.asset('assets/pages/veg.png'),
                    const SizedBox(width: 8),
                    Text(
                      "Veg",
                      style: customFilterStyle,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isNonVegSelected = !isNonVegSelected;
                    setState(() {});
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: BorderSide(
                            width: 0.5,
                            color: isNonVegSelected
                                ? primaryColorDarkOne
                                : whiteColor)),
                    backgroundColor:
                        isNonVegSelected ? chipSelectedColor : whiteColor,
                    padding: EdgeInsets.all(8)),
                child: Row(
                  children: [
                    Image.asset('assets/pages/non-veg.png'),
                    const SizedBox(width: 8),
                    Text(
                      "Non-veg",
                      style: customFilterStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
