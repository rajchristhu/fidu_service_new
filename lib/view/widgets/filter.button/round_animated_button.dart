import 'package:fidu_service/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  AnimatedButton({super.key, required this.index});

  int index;

  @override
  State<StatefulWidget> createState() {
    return AnimatedButtonState();
  }
}

class AnimatedButtonState extends State<AnimatedButton> {
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
          1: buildSegment("Low to high", 1),
          2: buildSegment("High to low", 2),
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
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: groupValue == index ? Colors.white : Colors.black),
    );
  }
}
