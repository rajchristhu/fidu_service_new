import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/view_model/checkout_viewmodel.dart';
import '../../view/widgets/custom_text_form_field.dart';

import '../../core/view_model/cart_viewmodel.dart';
import '../../res/Resources.dart';
import 'custom_buttom.dart';
import 'custom_text.dart';

Container AddressWidget(BuildContext context) {
  // final _formKey = GlobalKey<FormState>();
  //  final GlobalKey<FormFieldState<String>> _formKey = GlobalKey<FormFieldState<String>>();
   var _formKey = GlobalKey<FormState>();

  return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Resources(context).color.colorWhite),
      padding: EdgeInsets.all(16),
      child: Form(
          key: _formKey,
          child: GetBuilder<CheckoutViewModel>(
            init: Get.find<CheckoutViewModel>(),
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  title: 'Address',
                  hintText: 'Enter Address',
                  validatorFn: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return 'Please enter valid city name.';
                    }
                  },
                  onSavedFn: (value) {
                    controller.address = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  title: 'Landmark',
                  hintText: 'Enter Landmark',
                  validatorFn: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return 'Please enter valid city name.';
                    }
                  },
                  onSavedFn: (value) {
                    controller.landmark = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: Resources(context).color.colorPrimary),
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: CustomButton(
                      'Buy Now',
                      () async {
                        if (_formKey.currentState!.validate()) {
                          String product = "";
                          for (int i = 0;
                              i <=
                                  Get.find<CartViewModel>()
                                          .cartProducts
                                          .length -
                                      1;
                              i++) {
                            product +=
                                Get.find<CartViewModel>().cartProducts[i].name+", ";
                          }
                          controller.product = product.toString();
                          controller.status = 1;
                          _formKey.currentState!.save();
                          await controller.addCheckoutToFireStore();
                          Get.dialog(
                            AlertDialog(
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline_outlined,
                                      color:
                                          Resources(context).color.colorPrimary,
                                      size: 200,
                                    ),
                                    CustomText(
                                      text: 'Order Submitted',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Resources(context).color.colorPrimary,
                                      alignment: Alignment.center,
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    CustomButton(
                                      'Done',
                                      () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            barrierDismissible: false,
                          );
                        }
                      },
                    ))
              ],
            ),
          )));
}
