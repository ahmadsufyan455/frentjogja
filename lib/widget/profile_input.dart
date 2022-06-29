import 'package:flutter/material.dart';

class ProfileInput extends StatelessWidget {
  const ProfileInput({
    Key? key,
    required this.controller,
    required this.label,
    required this.isEnable,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEnable,
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
