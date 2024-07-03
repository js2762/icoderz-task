import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icoderz_task/views/home/home_view.dart';

import '../../controllers/auth_controller.dart';
import '../../routes/app_pages.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(
        const Duration(milliseconds: 500),
            () {},
      );

      bool isAutologin = await authController.checkAutoLogin();
      if (isAutologin) {
        Get.offAll(()=> const HomeView());
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
