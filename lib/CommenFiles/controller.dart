import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  String selectedLanguage = 'en';
  bool islang = false;
  bool islangonchange = false;

  void changeLanguage(String langCode) async {
    await TranslationService.loadLanguage(langCode);

    selectedLanguage = langCode;
  }

  setLocale(String? value) {
    if (value == null) return;
    if (value == "en") {
      changeLanguage('en');
    } else if (value == "ka") {
      changeLanguage('ka');
    } else {
      return;
    }
  }
}
