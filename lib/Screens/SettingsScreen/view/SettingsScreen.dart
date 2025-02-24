import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:attendanceapp/Screens/SiteHeadDashboard/view/SiteheadDashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/translateService.dart';
import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import '../../LoginScreen/view/LoginScreen.dart';

class Settingsscreen extends StatefulWidget {
  const Settingsscreen({super.key});

  @override
  State<Settingsscreen> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Settingsscreen> {
  @override
  bool isLoggedIn = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () {
            //Get.toNamed('/Admindashboard');
            Get.toNamed('/Siteheaddashboard');
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => Admin_Dashboard()),
            // );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
                underline: SizedBox(),
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                  size: 35,
                ),
                items: const [
                  DropdownMenuItem(
                      value: "en",
                      child: Text(
                        'English',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                  DropdownMenuItem(
                      value: "ka",
                      child: Text(
                        'Kannada',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ))
                ],
                onChanged: (value) {
                  controller.setLocale(value);
                }),
          )
        ],
        //IconButton

        title: Text(
          TranslationService.translate('Settings'),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 70.2,
        toolbarOpacity: 0.8,
        elevation: 0.00,
        backgroundColor: Colors.blue[400],
      ), //AppBar
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        size: 35,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        TranslationService.translate('Language'),
                        // "Language",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 85),
                  child: Row(
                    children: [
                      Text(
                        TranslationService.translate('English'),
                        // "English",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          size: 35,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          child: Text(
                            TranslationService.translate('Logout'),
                            //'Logout',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          onPressed: !isLoggedIn ? null : () => Loginscreen(),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
