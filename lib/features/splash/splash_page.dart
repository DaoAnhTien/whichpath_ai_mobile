import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wichpath_ai/style/app_text_style.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (splashController) {
          return Container(
            child: Center(
              child: Text("Loading", style: AppTextStyles.bold20()),
            ),
          );
        },
      ),
    );
  }
}
