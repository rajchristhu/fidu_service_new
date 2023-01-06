import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/colors.dart';

class BottomEditLayout extends StatefulWidget {
  const BottomEditLayout({super.key});

  @override
  State<BottomEditLayout> createState() => _BottomEditLayout();
}

class _BottomEditLayout extends State<BottomEditLayout> {
  late TextEditingController textController = TextEditingController();

  String _messageText = "";
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

  List<Widget> getRattingStarWidgets() {
    List<Widget> rattingStars = [];
    for (int i = 1; i < 6; i++) {
      rattingStars.add(IconButton(
        onPressed: () {
          if (selectedStar != i) {
            selectedStar = i;
          } else {
            selectedStar = 0;
          }
          setState(() {});
        },
        icon: Icon(
            selectedStar < i ? Icons.star_border_rounded : Icons.star_rounded,
            color: primaryColorDarkOne,
            size: 22),
      ));
    }

    return rattingStars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 1.5,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  controller: textController,
                  onChanged: (text) => _messageText = text,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.rate_review_rounded,
                            color: primaryColorDarkOne, size: 20),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => {Get.back()},
                        icon: Icon(Icons.send_rounded,
                            color: primaryColorDarkOne, size: 20),
                      ),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grayColors, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grayColors, width: 1.0),
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          gapPadding: 3),
                      labelStyle: TextStyle(color: textColorSmall),
                      hintStyle: TextStyle(color: textColorSmall),
                      labelText: 'Add Review',
                      hintText: ' Submit your review'),
                  style: TextStyle(color: textColor),
                  cursorColor: textColorSmall,
                  autocorrect: true,
                ),
                Row(children: getRattingStarWidgets()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
