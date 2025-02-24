import 'package:attendanceapp/Screens/LoginScreen/view/LoginScreen.dart';

import 'package:attendanceapp/Screens/SplashScreen/SplashScreen.dart';
import 'package:attendanceapp/sample.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'CommenFiles/getXcontroller.dart';
import 'CommenFiles/router.dart';
import 'CommenFiles/translateService.dart';
import 'Screens/LoginScreen/Controller/LoginScreenController.dart';

import 'package:flutter_localization/flutter_localization.dart';

// void main() async {
//   runApp(const MyApp());
//   await GetStorage.init();
//
//   // Get.put(LogInController());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.loadLanguage('en'); // Load default language
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginscreen(),
      initialBinding: HomeBinding(),
      getPages: routes,
      initialRoute: '/Splashscreen',
    );
  }
}
