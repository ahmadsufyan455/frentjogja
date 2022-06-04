import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: kRed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 34.0,
          vertical: 14.0,
        ),
        child: Text(
          text,
          style: kBodyRegular.copyWith(color: kWhite),
        ),
      ),
    );
  }
}
