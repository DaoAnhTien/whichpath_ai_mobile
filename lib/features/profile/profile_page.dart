import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wichpath_ai/commons/views/app_button.dart';
import 'package:wichpath_ai/navigations/app_pages.dart';
import 'package:wichpath_ai/style/app_colors.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [AppButton(title: "Vis cua toi", onPressed: () {})],
          ),
        ),
      ),
    );
  }
}
