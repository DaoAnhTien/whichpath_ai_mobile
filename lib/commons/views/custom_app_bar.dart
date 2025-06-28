import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constants/asset_constants.dart';
import '../../style/app_colors.dart';
import '../../style/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? actionButton;
  final Color? titleColor;
  final Color? backgroundColor;
  final VoidCallback? onTitleClick;
  final VoidCallback? onBackPress;
  final Widget? titleWidget;
  final bool? enableBack;
  final bool? centerTitle;
  final double height;
  final String? icon;
  final LinearGradient? gradient;

  CustomAppBar({
    Key? key,
    this.title,
    this.icon,
    this.actionButton,
    this.titleColor,
    this.backgroundColor,
    this.onTitleClick,
    this.onBackPress,
    this.titleWidget,
    this.gradient,
    this.enableBack = true,
    this.centerTitle = true,
    this.height = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      toolbarHeight: height,
      backgroundColor: AppColors.backgroundColor,
      elevation: 0.0,
      centerTitle: centerTitle!,
      flexibleSpace: Container(
        width: 393,
        height: 148,
        alignment: Alignment.topLeft, // giống align-items: flex-start
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFF4B3F), // tương đương #FF4B3F
              Color(0xFFFF764D), // tương đương #FF764D
            ],
          ),
        ),
      ),
      leading:
          enableBack!
              ? IconButton(
                icon: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAF9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      size: 16,
                      color: AppColors.neutral800,
                    ),
                  ),
                ),
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(Get.context!);

                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                  if (onBackPress == null) {
                    Get.back();
                  } else {
                    onBackPress!();
                  }
                },
              )
              : null,
      title:
          title != null
              ? Text(
                title ?? '',
                textAlign: centerTitle! ? TextAlign.center : TextAlign.left,
                style: AppTextStyles.semibold17().copyWith(
                  color: AppColors.neutral50,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
              : titleWidget ?? const SizedBox(),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 16),
          child: actionButton ?? const SizedBox(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
