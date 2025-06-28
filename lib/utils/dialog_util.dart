import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import '../commons/views/_icon_toast_widget.dart';

class DialogUtil {
  static DialogUtil instance = DialogUtil();

  DialogUtil();

  static showSuccessMessage(
    String description, {
    VoidCallback? onDismiss,
    bool isTop = true,
    int duration = 5,
  }) {
    showToastWidget(
      IconToastWidget.success(msg: description),
      context: Get.overlayContext,
      position: isTop ? StyledToastPosition.top : StyledToastPosition.bottom,
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideToTop,
      startOffset: const Offset(0.0, -3.0),
      reverseEndOffset: const Offset(0.0, -3.0),
      duration: Duration(seconds: duration),
      animDuration: const Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn,
      onDismiss: onDismiss,
    );
  }

  static showErrorMessage(
    String description, {
    VoidCallback? onDismiss,
    bool isTop = true,
    int duration = 5,
  }) {
    showToastWidget(
      IconToastWidget.fail(msg: description),
      context: Get.overlayContext,
      position: isTop ? StyledToastPosition.top : StyledToastPosition.bottom,
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideToTop,
      startOffset: const Offset(0.0, -3.0),
      reverseEndOffset: const Offset(0.0, -3.0),
      duration: Duration(seconds: duration),
      animDuration: const Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn,
      onDismiss: onDismiss,
    );
  }
}
