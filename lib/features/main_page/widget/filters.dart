import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class BottomFilters extends StatefulWidget {
  const BottomFilters({super.key});

  @override
  State<BottomFilters> createState() => _BottomFiltersLayout();
}

class _BottomFiltersLayout extends State<BottomFilters> {
  late TextEditingController textController = TextEditingController();

  bool isRepeatedEvent = false;
  int starSize = 18;
  late int selectedStar;

  @override
  void initState() {
    selectedStar = 0;
    super.initState();
  }

  @override
  void dispose() {
    selectedStar = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: whiteColor, spreadRadius: 10)],
      ),
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 1,
          children: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 10, bottom: 5, right: 15),
                    child: Text(
                      "Sort by",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                        color: textColorCardTitle,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 1.6,
                    width: MediaQuery.of(context).size.width,
                    color: grayColorOne,
                    padding: EdgeInsets.only(right: 6, left: 6),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Rating : High To Low",
                          style: TextStyle(
                            color: textColorCardTitle,
                            fontSize: 20,
                          ),
                        ),
                        trailing: Radio(
                          value: null,
                          activeColor: primaryColorDarkOne,
                          groupValue: null,
                          onChanged: (Null? value) {},
                          // value:,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Cost : High To Low",
                          style: TextStyle(
                            color: textColorCardTitle,
                            fontSize: 20,
                          ),
                        ),
                        trailing: Radio(
                          value: null,
                          activeColor: primaryColorDarkOne,
                          groupValue: null,
                          onChanged: (Null? value) {},
                          // value:,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Cost : Low To High",
                          style: TextStyle(
                            color: textColorCardTitle,
                            fontSize: 20,
                          ),
                        ),
                        trailing: Radio(
                          value: null,
                          activeColor: primaryColorDarkOne,
                          groupValue: null,
                          onChanged: (Null? value) {},
                          // value:,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Popularity",
                          style: TextStyle(
                            color: textColorCardTitle,
                            fontSize: 20,
                          ),
                        ),
                        trailing: Radio(
                          value: null,
                          activeColor: primaryColorDarkOne,
                          groupValue: null,
                          onChanged: (Null? value) {},
                          // value:,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 1.6,
                    width: MediaQuery.of(context).size.width,
                    color: grayColorOne,
                    padding: EdgeInsets.only(right: 6, left: 6),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 10, bottom: 5, right: 15),
                    child: Text(
                      "Veg",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                        color: textColorCardTitle,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 1.6,
                    width: MediaQuery.of(context).size.width,
                    color: grayColorOne,
                    padding: EdgeInsets.only(right: 6, left: 6),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 10, bottom: 5, right: 15),
                    child: Text(
                      "Non - Veg",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                        color: textColorCardTitle,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
