import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/getXcontroller.dart';
import '../../AddUser/view/AddUserScreen.dart';

class SiteheadUser extends StatefulWidget {
  const SiteheadUser({super.key});

  @override
  State<SiteheadUser> createState() => _SiteheadUserState();
}

class _SiteheadUserState extends State<SiteheadUser> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationService.translate("User")),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
                underline: SizedBox(),
                icon: Icon(
                  Icons.language,
                  color: Colors.blue,
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
                      )),
                ],
                onChanged: (value) {
                  controller.setLocale(value);
                }),
          )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () {
            Get.toNamed('/Siteheaddashboard');
            //Get.toNamed('/Admindashboard');

            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => Admin_Dashboard()),
            // );
          },
        ),

        //IconButton
      ),
      body: Column(
        children: [
          GridView.count(
              shrinkWrap: true,
              // childAspectRatio: 0.98,
              crossAxisCount: 2,
              children: [
                // for (int i = 1; i < 5; i++)

                GestureDetector(
                  onTap: () {
                    Get.toNamed('/Addcontractoruserlist');
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Get.toNamed('/Addsiteheaderuser');()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffEAEAEB),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  TranslationService.translate("Contractor"),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Spacer(),
                                Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/images/u2.png",
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  TranslationService.translate("8 Contractors"),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Get.toNamed('/Workerlistscreen');
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Workerlistscreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffEAEAEB),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  TranslationService.translate("Site\nWorker"),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Spacer(),
                                Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/images/u4.png",
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 70, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  TranslationService.translate(
                                      "20 Site Workers"),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ])
        ],
      ),
    );
  }
}
