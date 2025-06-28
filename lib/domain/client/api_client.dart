import 'dart:async';

import 'package:dio/dio.dart';
import 'package:wichpath_ai/domain/client/event_service.dart';

import 'package:wichpath_ai/utils/app_util.dart';

import 'base_client.dart';

class ApiClient extends BaseClient {
  final client = BaseClient.instance.dio;
}
