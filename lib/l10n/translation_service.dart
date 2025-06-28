import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class TranslationService extends Translations {
  static final langs = ['vi', 'en'];

  static final locales = [const Locale('vi'), const Locale('en')];

  static final fallbackLocale = const Locale('vi');

  static final Map<String, Map<String, String>> _translations = {};

  static Future<void> init() async {
    for (var lang in langs) {
      final jsonString = await rootBundle.loadString('assets/lang/$lang.json');
      _translations[lang] = Map<String, String>.from(json.decode(jsonString));
    }
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;
}
