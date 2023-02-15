import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VegOrNonVegSlider extends StatefulWidget {
  VegOrNonVegSlider({super.key, required this.index});

  int index;

  @override
  State<StatefulWidget> createState() {
    return VegOrNonVegSliderState();
  }
}

class VegOrNonVegSliderState extends State<VegOrNonVegSlider> {
  int? groupValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: CupertinoSlidingSegmentedControl<int>(
        backgroundColor: const Color(0xFFFFFFFF),
        thumbColor: const Color(0xFFFF814B),
        padding: const EdgeInsets.all(8),
        groupValue: groupValue,
        children: {
          0: buildSegment("All", 0),
          1: buildSegment("veg", 1),
          2: buildSegment("non-veg", 2),
        },
        onValueChanged: (value) {
          setState(() {
            groupValue = value;
          });
        },
      ),
    );
  }

  Widget buildSegment(String text, int index) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
      width: MediaQuery.of(context).size.width * 0.205,
      child: index == 0
          ? Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: groupValue == index ? Colors.white : Colors.black),
              ),
            )
          : SizedBox(
              child: Row(
                children: [
                  groupValue != index
                      ? Image.asset(index == 1
                          ? 'assets/pages/veg.png'
                          : 'assets/pages/non-veg.png')
                      : Container(),
                  const SizedBox(width: 8),
                  groupValue == index
                      ? Center(
                          child: Text(
                            index == 1 ? "veg" : "non-veg",
                            style: TextStyle(
                              fontSize: 18,
                              color: groupValue == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: groupValue == index
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        )
                      : Text(
                          index == 1 ? "veg" : "non-veg",
                          style: TextStyle(
                            fontSize: 18,
                            color: groupValue == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: groupValue == index
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
