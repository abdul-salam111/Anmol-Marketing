import 'package:flutter/material.dart';
import '../../core/barrel.dart';
import 'splash_controller.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.appDarkThemeBackground,
      body: Center(
        child: Image.asset(
          AppImages.appLogo,
          width: context.screenWidth * 0.5,
          height: context.screenHeight * 0.25,
        ),
      ),
    );
  }
}
