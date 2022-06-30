import 'package:flutter/material.dart';
import 'package:frent_jogja/models/user.dart';
import 'package:frent_jogja/modules/dashboard/profile/edit_profile.dart';
import 'package:frent_jogja/modules/dashboard/profile/profile_controller.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:frent_jogja/widget/profile_input.dart';
import '../../../modules/auth/auth_controller.dart';
import '../../../utils/styles.dart';
import '../../../widget/button.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Profil',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
        actions: [
          IconButton(
            onPressed: () => authController.logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                const SizedBox(height: 34.0),
                const CircleAvatar(
                  backgroundImage: AssetImage('$image/frent-logo.png'),
                  radius: 60.0,
                ),
                const SizedBox(height: 24.0),
                ProfileInput(
                  controller: profileController.nameController
                    ..text = profileController.user.value.name,
                  label: 'Nama',
                  isEnable: false,
                ),
                const SizedBox(height: 16.0),
                ProfileInput(
                  controller: profileController.idNumberController
                    ..text = profileController.user.value.idNumber.toString(),
                  label: 'NIK',
                  isEnable: false,
                ),
                const SizedBox(height: 16.0),
                ProfileInput(
                  controller: profileController.phoneNumberController
                    ..text =
                        profileController.user.value.phoneNumber.toString(),
                  label: 'No Whatsapp',
                  isEnable: false,
                ),
                const SizedBox(height: 16.0),
                ProfileInput(
                  controller: profileController.emailController
                    ..text = profileController.user.value.email,
                  label: 'Email',
                  isEnable: false,
                ),
                const SizedBox(height: 34.0),
                CustomButton(
                  text: 'Ubah Profil',
                  onPressed: () {
                    final data = UserModel(
                      name: profileController.nameController.text,
                      idNumber:
                          int.parse(profileController.idNumberController.text),
                      phoneNumber: int.parse(
                          profileController.phoneNumberController.text),
                      email: profileController.emailController.text,
                    );
                    Get.toNamed(EditProfile.routeName, arguments: data);
                  },
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
