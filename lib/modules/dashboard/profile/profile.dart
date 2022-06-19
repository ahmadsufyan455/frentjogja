import 'package:flutter/material.dart';
import '../../../modules/auth/auth_controller.dart';
import '../../../widget/button.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Profile Screen'),
              const SizedBox(height: 16),
              CustomButton(text: 'Keluar', onPressed: () => controller.logout())
            ],
          ),
        ),
      ),
    );
  }
}
