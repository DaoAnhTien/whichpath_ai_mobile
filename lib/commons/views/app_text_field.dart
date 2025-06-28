import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wichpath_ai/style/app_colors.dart';
import 'package:wichpath_ai/style/app_text_style.dart';

class TitleDefaultTextField extends StatelessWidget {
  final String? title;
  final TextAlign? textAlign;
  final int? maxLines;
  final int? maxLength;
  final int? fixedLines;
  final bool? softWrap;
  final EdgeInsetsGeometry? outsidePadding;
  final EdgeInsetsGeometry? innerPadding;
  final TextEditingController? controller;
  final String? errorMsg;
  final String? hintText;
  final Color? hintColor;
  final bool? isAutoFocus;
  final double? width;
  final double? height;
  final String? borderRadiusEdge;
  final FocusNode focusNode;
  final bool? isIgnorePointer;
  final ValueChanged<String>? onChanged;
  final double? blurRadius;
  final double? radius;
  final Function? onSubmitted;
  final TextInputType? textInputType;
  final bool? enabled;
  final bool? obscureText;
  final double? letterSpacing;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? preIcon;
  final Widget? postIcon;
  final List<String>? autoFillHints;
  final Function? onTab;
  final bool? enableFocusBorder;
  final bool? filled;
  final Color? fillColor;
  final Widget? suffix;
  final GestureTapCallback? onTabSuffix;

  const TitleDefaultTextField({
    super.key,
    this.title,
    this.textAlign = TextAlign.left,
    this.hintText = '',
    this.errorMsg,
    this.hintColor,
    this.maxLines = 1,
    this.maxLength,
    this.fixedLines,
    this.softWrap = true,
    this.isAutoFocus = false,
    this.controller,
    this.textInputType = TextInputType.text,
    this.width = double.infinity,
    this.height,
    this.borderRadiusEdge = '',
    required this.focusNode,
    this.isIgnorePointer = false,
    this.onChanged,
    this.onSubmitted,
    this.radius = 12,
    this.blurRadius = 0,
    this.enabled = true,
    this.letterSpacing,
    this.inputFormatter,
    this.obscureText = false,
    this.preIcon,
    this.postIcon,
    this.innerPadding = const EdgeInsets.only(
      top: 8,
      bottom: 8,
      left: 20,
      right: 20,
    ),
    this.outsidePadding = const EdgeInsets.only(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
    ),
    this.autoFillHints,
    this.onTab,
    this.enableFocusBorder = true,
    this.filled = true,
    this.fillColor,
    this.suffix,
    this.onTabSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outsidePadding!,
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '',
              style: AppTextStyles.semibold15().copyWith(
                color: AppColors.neutral400,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              autofillHints: autoFillHints,
              focusNode: focusNode,
              cursorColor: AppColors.primaryColor,
              autofocus: isAutoFocus!,
              textAlign: textAlign!,
              controller: controller,
              onChanged: onChanged,
              keyboardType: textInputType,
              maxLength: maxLength,
              maxLines: maxLines,
              inputFormatters: inputFormatter,
              obscureText: obscureText!,
              decoration: InputDecoration(
                // labelStyle: Style().hintStyle,
                hintText: hintText,
                hintStyle: AppTextStyles.semibold15().copyWith(
                  color: AppColors.neutral300,
                ),
                filled: filled,
                fillColor: AppColors.neutral100,
                errorText: errorMsg,
                errorStyle: TextStyle(height: 0, color: AppColors.primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius!),
                  borderSide:
                      !focusNode.hasFocus
                          ? BorderSide(width: 0, style: BorderStyle.none)
                          : BorderSide(
                            color: AppColors.primaryColor,
                            width: 2.0,
                          ),
                ),
                focusedBorder:
                    (enableFocusBorder ?? false)
                        ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(radius!),
                        )
                        : null,
                errorBorder:
                    errorMsg != null
                        ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.theme.primaryColorDark,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(radius!),
                        )
                        : null,
                contentPadding: innerPadding,
                suffixIcon:
                    suffix != null
                        ? GestureDetector(
                          // behavior: HitTestBehavior.translucent,
                          onTap: onTabSuffix,
                          // behavior: HitTestBehavior.translucent,
                          child: suffix,
                        )
                        : null,
              ),
              style: AppTextStyles.semibold15(),
            ),
          ],
        ),
      ),
    );
  }
}
