import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'dialog_util.dart';
import 'object_util.dart';

class ErrorUtil {
  static ErrorUtil instance = ErrorUtil();

  static String? getError(error, trace) {
    String? errorMsg;
    if (error is DioException) {
      if (kDebugMode) {
        print(
          'Error api: ${error.requestOptions.method} ${error.requestOptions.path}',
        );
        print('Error request headers: ${error.requestOptions.headers}');
        print('Error request data: ${error.requestOptions.data}');
        print('Error response: ${error.response?.data}');
        print('Error stauts: ${error.response?.statusCode}');
      }

      if (error.response?.statusCode == 500 ||
          error.response?.statusCode == 501 ||
          error.response?.statusCode == 502 ||
          error.response?.statusCode == 404 ||
          error.response?.statusCode == 503) {
        return 'Xin vui lòng thử lại sau';
      }
      // if (error.response?.statusCode == 401) {
      //   return 'Phiên đăng nhập hết hạn';
      // }

      if (error.response?.statusCode == 429) {
        return 'Bạn đang thao tác nhanh quá';
      }

      if (error.response?.data is String) {
        // errorMsg =
        // '${error.requestOptions.path}\n${error.response?.data?.toString() ?? ''}';
        try {
          final parsed = jsonDecode(error.response?.data); // cần import 'dart:convert';
          if (parsed is Map<String, dynamic>) {
            print('Message: ${parsed['message']}');
            errorMsg = parsed['message'];
          } else {
            print('Dữ liệu không hợp lệ: $parsed');
          }
        } catch (e) {
          print('Không parse được JSON: $e');
        }
      } else {
        if (error.response?.data != null &&
            error.response?.data['message'] != null) {
          errorMsg = error.response?.data['message'];
          if (errorMsg == 'INVALID_TOKEN') {}
        } else {
          if (error.response?.data == null) {
            errorMsg = 'SERVER_NOT_RESPONDING';
          } else {
            errorMsg = '${error.requestOptions.path}\n$error';
          }
        }
      }
    } else {
      errorMsg = error.toString();
    }

    return errorMsg;
  }

  static FutureOr<void> catchError(error, trace) {
    if (kDebugMode) {
      print(error);
      print(trace);
    }
    String? msg = ErrorUtil.getError(error, trace);
    if (ObjectUtil.isNotEmpty(msg)) {
      DialogUtil.showErrorMessage(msg!.tr);
    } else {
      DialogUtil.showErrorMessage(error.toString());
    }

    return Future.value(null);
  }
}
