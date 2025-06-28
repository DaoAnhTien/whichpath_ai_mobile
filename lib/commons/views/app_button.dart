import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wichpath_ai/style/app_colors.dart';
import 'package:wichpath_ai/style/app_text_style.dart';

enum AppButtonType {
  primary,
  outline,
  text,
  social,
  cancel,
  remove,
  gray,
  normal,
}

class AppButton extends StatelessWidget {
  final String title;
  final String? icon;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isEnable;
  final Color? colorText;
  final Color? outlineColor;

  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.isEnable = true,
    this.type = AppButtonType.primary,
    this.colorText,
    this.outlineColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppButtonType.primary:
        return TextButton(
          onPressed: isEnable ? onPressed : null,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            fixedSize: WidgetStatePropertyAll(Size(context.width, 50)),
            backgroundColor: WidgetStatePropertyAll(
              isEnable ? AppColors.primaryColor : AppColors.neutral200,
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.semibold17().copyWith(
              color: isEnable ? AppColors.neutral50 : AppColors.neutral400,
            ),
          ),
        );
      case AppButtonType.outline:
        return OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            side: WidgetStatePropertyAll(
              BorderSide(
                color: outlineColor ?? AppColors.primaryColor,
                width: 1,
              ), // Viền
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            fixedSize: WidgetStatePropertyAll(Size(context.width, 50)),
            backgroundColor: WidgetStatePropertyAll(AppColors.clear),
          ),
          child: Text(title, style: AppTextStyles.regular17()),
        );
      case AppButtonType.text:
        return TextButton(
          onPressed: () {},
          style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll(Size(context.width, 50)),
          ),
          child: Text(title, style: AppTextStyles.regular17()),
        );
      case AppButtonType.social:
        return TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            fixedSize: WidgetStatePropertyAll(Size(context.width, 50)),
            backgroundColor: WidgetStatePropertyAll(AppColors.neutral100),
          ),
          child: Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Image.asset(icon!) : SizedBox(),
              Text(
                title,
                style: AppTextStyles.semibold17().copyWith(
                  color: AppColors.neutral800,
                ),
              ),
            ],
          ),
        );
      case AppButtonType.cancel:
        return TextButton(
          onPressed: isEnable ? onPressed : null,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            fixedSize: WidgetStatePropertyAll(Size(context.width, 50)),
            backgroundColor: WidgetStatePropertyAll(
              isEnable ? AppColors.neutral200 : AppColors.neutral200,
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.semibold17().copyWith(
              color: isEnable ? AppColors.neutral800 : AppColors.neutral400,
            ),
          ),
        );
      case AppButtonType.remove:
        return TextButton(
          onPressed: isEnable ? onPressed : null,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            fixedSize: WidgetStatePropertyAll(Size(context.width, 50)),
            backgroundColor: WidgetStatePropertyAll(
              isEnable ? AppColors.red : AppColors.neutral200,
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.semibold17().copyWith(
              color: isEnable ? AppColors.neutral50 : AppColors.neutral400,
            ),
          ),
        );
      case AppButtonType.gray:
        return TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            fixedSize: WidgetStatePropertyAll(Size(context.width, 50)),
            backgroundColor:
                colorText != Colors.red
                    ? WidgetStatePropertyAll(AppColors.neutral200)
                    : null,
          ),
          child: Text(
            title,
            style: AppTextStyles.semibold17().copyWith(color: colorText),
          ),
        );
      case AppButtonType.normal:
        return TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            fixedSize: WidgetStatePropertyAll(Size(context.width, 50)),
            backgroundColor: WidgetStatePropertyAll(AppColors.neutral200),
          ),
          child: Text(
            title,
            style: AppTextStyles.semibold17().copyWith(
              color: AppColors.neutral400,
            ),
          ),
        );
    }
  }
}
