import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome'),
      ),
    );
  }
}
