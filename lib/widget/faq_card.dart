import 'package:flutter/material.dart';

import '../utils/styles.dart';

class FaqCard extends StatelessWidget {
  const FaqCard({
    Key? key,
    required this.question,
    required this.asnwer,
  }) : super(key: key);

  final String question;
  final List<Widget> asnwer;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        title: Text(question, style: kBodyBold),
        children: asnwer,
      ),
    );
  }
}
