import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/form/form_controller.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    this.inputAction,
    this.inputType,
    this.controller,
    this.maxLines,
    this.hintText,
    this.isEnable,
  }) : super(key: key);

  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;
  final bool? isEnable;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: kBodyRegular,
      textInputAction: inputAction,
      keyboardType: inputType,
      maxLines: maxLines,
      controller: controller,
      enabled: isEnable,
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        hintStyle: kBodyRegularHint,
      ),
    );
  }
}

class DropDownInputPickUp extends StatelessWidget {
  const DropDownInputPickUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FormController>();
    List address = <String>[
      'Stasiun Lempuyangan',
      'Stasiun Tugu',
      'Kantor Frent Jogja',
      'Lainnya',
    ];

    return DropdownButtonFormField2(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      isExpanded: true,
      hint: Text(
        'Lokasi penjemputan',
        style: kBodyRegularHint,
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: kBlack,
      ),
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      items: address
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: kBodyRegular),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null) return 'Lokasi penjemputan';
        return null;
      },
      onChanged: (value) {
        controller.pickUpLocation.value = value.toString();
      },
      onSaved: (value) {
        controller.pickUpLocation.value = value.toString();
      },
    );
  }
}

class DropDownInputDelivery extends StatelessWidget {
  const DropDownInputDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FormController>();
    List address = <String>[
      'Stasiun Lempuyangan',
      'Stasiun Tugu',
      'Kantor Frent Jogja',
      'Lainnya',
    ];

    return DropdownButtonFormField2(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      isExpanded: true,
      hint: Text(
        'Lokasi pengantaran',
        style: kBodyRegularHint,
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: kBlack,
      ),
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      items: address
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: kBodyRegular),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null) return 'Lokasi pengantaran';
        return null;
      },
      onChanged: (value) {
        controller.deliveryLocation.value = value.toString();
      },
      onSaved: (value) {
        controller.deliveryLocation.value = value.toString();
      },
    );
  }
}
