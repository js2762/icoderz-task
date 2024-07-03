import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icoderz_task/controllers/auth_controller.dart';
import 'package:icoderz_task/controllers/profile_controller.dart';
import 'package:icoderz_task/data/app_images.dart';
import 'package:icoderz_task/views/authentication/login_view.dart';
import 'package:icoderz_task/widgets/custom_button.dart';

import '../../controllers/entry_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final entryController = Get.find<EntryController>();
  final authController = Get.find<AuthController>();
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    profileController.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileController.user?.profileImage == null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          radius: 50,
                          child: Image.asset(AppImages.businessImage),
                        ),
                      ),
                    )
                  : Container(
                alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20)
                   ),
                    child: Image.network(
                      profileController.user!.profileImage.toString(),
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
              Text(
                "Email: ${profileController.user?.email}",
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
              ),
              Text(
                "Current Balance: ${entryController.currentBalance.toString()}",
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
              ),
              CustomButton(
                bgColor: Colors.blue,
                onPressed: () {
                  authController.logOut();
                  Get.offAll(() => const LoginView());
                },
                childWidget: const Text(
                  "LogOut",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
