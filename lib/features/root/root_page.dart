import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wichpath_ai/navigations/app_pages.dart';
import 'package:wichpath_ai/style/app_colors.dart';
import '../../commons/widget/animatedBottomNavigationBar/animated_bottom_navigation_bar.dart';
import '../../commons/widget/indexed_transition_switcher.dart';
import '../../constants/asset_constants.dart';
import '../../style/app_text_style.dart';
import 'root_controller.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async => true,
        child: Obx(
          () => Scaffold(
            body: IndexedTransitionSwitcher(
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return FadeThroughTransition(
                  fillColor: Colors.transparent,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              index: controller.currentTab.value,
              children: controller.children,
            ),
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              itemCount: controller.children.length,
              tabBuilder:
                  (int index, bool isActive) =>
                      _buildBottomNavBar(context, isActive)[index],
              activeIndex: controller.currentTab.value,
              splashColor: AppColors.primaryColor,
              splashSpeedInMilliseconds: 300,
              notchSmoothness: NotchSmoothness.defaultEdge,
              gapLocation: GapLocation.none,
              onTap: controller.switchTab,
              backgroundColor: AppColors.backgroundColor,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBottomNavBar(BuildContext context, bool isActive) {
    return [
      _buildBottomNavigationBarItem(
        context,
        'Trang chủ'.tr,
        FontAwesomeIcons.house,
        0,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'Yêu thích'.tr,
        FontAwesomeIcons.faceAngry,

        1,
        isActive,
      ),
      // _buildBottomNavigationBarItem(
      //   context,
      //   'Tin nhắn'.tr,
      //   isActive ? AssetConstants.icMessageFilled : AssetConstants.icMessage,
      //   2,
      //   isActive,
      // ),
      _buildBottomNavigationBarItem(
        context,
        'Hồ sơ'.tr,
        FontAwesomeIcons.faceAngry,

        3,
        isActive,
      ),
    ];
  }

  Widget _buildBottomNavigationBarItem(
    BuildContext context,
    String title,
    IconData iconPath,
    int index,
    bool isActive,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        FaIcon(
          iconPath,
          size: 18,
          color: isActive ? AppColors.primaryColor : AppColors.neutral400,
        ),
        Text(
          title,
          style: AppTextStyles.semibold11().copyWith(
            color: isActive ? AppColors.primaryColor : AppColors.neutral400,
          ),
        ),
      ],
    );
  }
}
