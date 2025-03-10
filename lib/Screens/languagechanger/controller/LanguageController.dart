import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  var locale = Locale(StorageService.getLanguage()).obs;

  void changeLanguage(String languageCode) {
    locale.value = Locale(languageCode);
    StorageService.setLanguage(languageCode);
    Get.updateLocale(locale.value);
  }
}

class StorageService {
  static SharedPreferences? _prefs;

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save Language Preference
  static Future<void> setLanguage(String languageCode) async {
    if (_prefs != null) {
      await _prefs!.setString("language", languageCode);
    }
  }

  /// Get Saved Language
  static String getLanguage() {
    return _prefs?.getString("language") ?? "en"; // Default: English
  }
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'hello': 'Hello, World!',
          'language': 'Language',
        },
        'ka': {
          'hello': 'ಹಲೋ, ವರ್ಲ್ಡ್!',
          'language': 'ಭಾಷೆ',
        },
      };
}
