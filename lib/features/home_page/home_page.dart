import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wichpath_ai/style/app_colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(backgroundColor: AppColors.backgroundColor),
    );
  }

  Widget banner(BuildContext context) {
    return Container();
  }
}
