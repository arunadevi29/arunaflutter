import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Locale get locale => Get.deviceLocale ?? Locale('en', 'ka');
  static final fallbackLocale = Locale('en', 'ka');
  static Map<String, String> _localizedStrings = {};

  /// Load JSON translation file dynamically
  static Future<void> loadLanguage(String languageCode) async {
    String jsonString =
        await rootBundle.loadString('assets/lang/$languageCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    // Update GetX translations dynamically
    Get.updateLocale(Locale(languageCode));
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {}, // Empty initially, will be loaded from JSON
        'ka': {},
      };

  /// Get translated text
  static String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}
