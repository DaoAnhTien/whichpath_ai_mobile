import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wichpath_ai/di_container.dart';
import 'package:wichpath_ai/domain/client/local_client.dart';
import 'package:wichpath_ai/utils/object_util.dart';

class BaseClient {
  static const _apiHostReal = 'https://be.whichpath.ai';
  static BaseClient? _instance;
  Dio? _dio;

  BaseClient();

  static get instance {
    _instance ??= BaseClient._internal();
    return _instance;
  }

  get apiHostReal => _apiHostReal;

  get dio => _dio;

  BaseClient._internal() {
    _dio = Dio();
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['accept'] = 'application/json';
          if (kDebugMode) {
            print(
              'Call api: ${options.method} ${options.path} ${options.data}',
            );
          }
          final token = sl<LocalClient>().accessToken;
          if (ObjectUtil.isNotEmpty(token)) {
            options.headers['Authorization'] = 'Bearer $token';
            print(token);
          }
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          // Convert text response to JSON if needed
          if (response.data is String) {
            try {
              response.data = jsonDecode(response.data as String);
            } catch (e) {
              // If parsing fails, keep the original data
              if (kDebugMode) {
                print('Failed to parse response as JSON: $e');
              }
            }
          }

          // Original response handling logic...
          if (kDebugMode) {
            print(
              'API STATUS CODE ${response.statusCode} ${response.statusMessage}',
            );
            print("Response ${response.data}");
          }

          if (response.data is Map<String, dynamic> &&
              response.data['status'] == 0) {
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                type: DioExceptionType.badResponse,
                error: response.data['message'],
              ),
            );
          }

          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e); //continue
        },
      ),
    );
  }
}
