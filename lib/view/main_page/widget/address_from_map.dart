import 'package:fidu_service/google_maps_place_picker/src/models/pick_result.dart';
import 'package:flutter/material.dart';

import '../../../res/Resources.dart';
import '../../../resources/colors.dart';
import '../../../utils/pick_location.dart';
import '../../widgets/custom_buttom.dart';

class AddressSelect extends StatefulWidget {
  AddressSelect(this.location, {super.key});

  PickResult? location;

  @override
  State<AddressSelect> createState() => _AddressSelectState();
}

class _AddressSelectState extends State<AddressSelect> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: grayColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                width: 70,
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "Complete address : ",
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    SizedOverflowBox(
                      alignment: Alignment.centerLeft,
                      size: Size(MediaQuery.of(context).size.width, 20),
                      child: Text(
                        "${widget.location == null ? "Fetching current location .... " : widget.location?.formattedAddress}",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    const SizedBox(height: 10),
                    lineSeparator(context),
                    const SizedBox(height: 20),
                    Text(
                      "Landmark / Flat No : ",
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          alignLabelWithHint: true,
                          label: Text('Landmark (optional)'),
                        ),
                        onChanged: (value) {
                          SelectedLocation.instance.landMark = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(60),
                    ),
                    color: Resources(context).color.colorPrimary),
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: CustomButton(
                  'Confirm Location ',
                  () {
                    SelectedLocation.instance.locationInfo = widget.location;
                    Navigator.maybePop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lineSeparator(context) {
    return Container(
      height: 1.6,
      width: MediaQuery.of(context).size.width,
      color: grayColorOne,
      padding: const EdgeInsets.only(right: 6, left: 6),
    );
  }
}
