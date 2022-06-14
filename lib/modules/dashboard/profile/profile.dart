import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/auth/auth_controller.dart';
import 'package:frent_jogja/widget/button.dart';
import 'package:get/instance_manager.dart';

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
