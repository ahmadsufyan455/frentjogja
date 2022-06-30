import 'package:flutter/material.dart';
import 'package:frent_jogja/models/user.dart';
import 'package:frent_jogja/modules/dashboard/profile/profile_controller.dart';
import 'package:frent_jogja/widget/profile_input.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/styles.dart';
import '../../../widget/button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  static const routeName = '/edit_profile';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final UserModel data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Ubah Profil',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 34.0),
              const CircleAvatar(
                backgroundImage: AssetImage('$image/frent-logo.png'),
                radius: 60.0,
              ),
              const SizedBox(height: 24.0),
              ProfileInput(
                controller: controller.nameEditController..text = data.name,
                label: 'Nama',
                isEnable: true,
              ),
              const SizedBox(height: 16.0),
              ProfileInput(
                controller: controller.idNumberEditController
                  ..text = data.idNumber.toString(),
                label: 'NIK',
                isEnable: true,
              ),
              const SizedBox(height: 16.0),
              ProfileInput(
                controller: controller.phoneNumberEditController
                  ..text = data.phoneNumber.toString(),
                label: 'No Whatsapp',
                isEnable: true,
              ),
              const SizedBox(height: 16.0),
              ProfileInput(
                controller: controller.emailEditController..text = data.email,
                label: 'Email',
                isEnable: true,
              ),
              const SizedBox(height: 34.0),
              CustomButton(
                text: 'Simpan',
                onPressed: () {
                  controller.updateProfile();
                  Future.delayed(const Duration(seconds: 1), () {
                    Get.back();
                  });
                },
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
