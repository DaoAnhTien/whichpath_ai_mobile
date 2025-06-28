import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wichpath_ai/features/home_page/home_page.dart';
import 'package:wichpath_ai/features/profile/profile.dart';

class RootController extends GetxController {
  final RxInt currentTab = 0.obs;

  final List<Widget> children = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void switchTab(int index) {
    currentTab.value = index;
  }

  Widget get currentPage => children[currentTab.value];
}
