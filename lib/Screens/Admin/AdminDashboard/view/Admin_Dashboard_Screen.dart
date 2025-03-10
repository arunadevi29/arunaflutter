import 'package:attendanceapp/Screens/Admin/AdminDashboard/controller/AdminDashboardController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../CommenFiles/translateService.dart';
import '../../../PieChartScreen/view/PieChartScreen.dart';
import '../../../PunchScreenField/PunchScreen/view/PunchScreen.dart';
import '../../../SettingsScreen/view/SettingsScreen.dart';

import '../../../ShiftTime/ShiftTimeScreen/view/ShiftTimeViewScreen.dart';
import '../../../ShiftTime/ShiftTimeScreen/view/Shift_Time_From_screen.dart';
import '../../../UserDetailsScreen/view/UserDetailsScreen.dart';

import '../../../Work/view/Work_Type_Screen.dart';
import '../../AddNewFacilityScreen/view/AddNewFacilityList.dart';
import '../../AddNewFacilityScreen/view/AddNewFacilityScreen.dart';
import '../../FacilityCardDetails/view/Facilities_Screen.dart';

class Admin_Dashboard extends StatefulWidget {
  const Admin_Dashboard({super.key});

  @override
  State<Admin_Dashboard> createState() => _Admin_DashboardState();
}

class _Admin_DashboardState extends State<Admin_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      TranslationService.translate('Hello!'),
                      // "Hello!".tr,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    TranslationService.translate('Admin'),
                    // "Admin".tr,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(),

              // IconButton(
              //   icon: const Icon(
              //     Icons.settings,
              //     size: 30,
              //   ),
              //   //tooltip: 'Setting Icon',
              //   onPressed: () {
              //     Get.toNamed('/Settingsscreen');
              //     // Navigator.of(context).push(
              //     //   MaterialPageRoute(
              //     //       builder: (context) => const Settingsscreen()),
              //     // );
              //   },
              // ),
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/men_img.png',
              ),
            ),
          ),
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
        ),
        // bottomNavigationBar: BottomAppBar(
        //   notchMargin: 15,
        //   shape: CircularNotchedRectangle(),
        //   color: Colors.blue,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Column(
        //             children: [
        //               InkWell(
        //                   onTap: () {
        //                     Get.toNamed("/Admindashboard");
        //                     // Navigator.of(context).push(
        //                     //   MaterialPageRoute(
        //                     //       builder: (context) =>
        //                     //           const Admin_Dashboard()),
        //                     // );
        //                   },
        //                   child: ImageIcon(
        //                       AssetImage(
        //                         'assets/images/Home.png',
        //                       ),
        //                       color: Colors.white)),
        //               Text(
        //                 "Home",
        //                 style: TextStyle(fontSize: 18, color: Colors.white),
        //               )
        //               // Text("data")
        //             ],
        //           ),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Container(
        //             height: 30,
        //             width: 30,
        //             child: InkWell(
        //                 onTap: () {
        //                   Get.toNamed("/Piechartscreen");
        //                   // Navigator.of(context).push(
        //                   //   MaterialPageRoute(
        //                   //       builder: (context) => const Piechartscreen()),
        //                   // );
        //                 },
        //                 child: ImageIcon(
        //                     AssetImage(
        //                       'assets/images/Reports.png',
        //                     ),
        //                     color: Colors.white)),
        //           ),
        //           Text(
        //             "Reports",
        //             style: TextStyle(fontSize: 18, color: Colors.white),
        //           )
        //           // Text("data")
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Container(
        //             height: 30,
        //             width: 30,
        //             child: InkWell(
        //                 onTap: () {
        //                   Get.toNamed("/WorkTypeScreen");
        //                   // Navigator.of(context).push(
        //                   //   MaterialPageRoute(
        //                   //       builder: (context) => const WorkTypeScreen()),
        //                   // );
        //                 },
        //                 child: ImageIcon(
        //                     AssetImage(
        //                       'assets/images/w1.png',
        //                     ),
        //                     color: Colors.white)),
        //           ),
        //           Text(
        //             "Work",
        //             style: TextStyle(fontSize: 18, color: Colors.white),
        //           )
        //           // Text("data")
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Container(
        //             height: 30,
        //             width: 30,
        //             child: InkWell(
        //                 onTap: () {
        //                   Get.toNamed('/Shifttimeviewscreen');
        //                   // Navigator.of(context).push(
        //                   //   MaterialPageRoute(
        //                   //       builder: (context) => Shifttimeviewscreen()),
        //                   // );
        //                 },
        //                 child: ImageIcon(
        //                     AssetImage(
        //                       'assets/images/s1.png',
        //                     ),
        //                     color: Colors.white)),
        //           ),
        //           Text(
        //             "Shift",
        //             style: TextStyle(fontSize: 18, color: Colors.white),
        //           )
        //           // Text("data")
        //         ],
        //       ),
        //       // Column(
        //       //   children: [
        //       //     Container(
        //       //       height: 30,
        //       //       width: 30,
        //       //       child: InkWell(
        //       //           onTap: () {
        //       //             Navigator.of(context).push(
        //       //               MaterialPageRoute(
        //       //                   builder: (context) => const Punchscreen()),
        //       //             );
        //       //           },
        //       //           child: ImageIcon(
        //       //               AssetImage(
        //       //                 'assets/images/punch.png',
        //       //               ),
        //       //               color: Colors.white)),
        //       //     ),
        //       //     Text(
        //       //       "Punch",
        //       //       style: TextStyle(fontSize: 18, color: Colors.white),
        //       //     )
        //       //     // Text("data")
        //       //   ],
        //       // ),
        //     ],
        //   ),
        // ),

        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => FacilitiesScreen()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 190,
                            width: 155,
                            decoration: BoxDecoration(
                                color: Color(0xffEAEAEB),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          TranslationService.translate(
                                              'Facilities'),
                                          // "Facilities".tr,
                                          style: adminDashboardcontroller
                                                  .langsize
                                              ? TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)
                                              : TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17)),
                                      Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/images/location.png",
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    "assets/images/facilitymap.png",
                                    height: 100,
                                    width: 120,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        TranslationService.translate(
                                            '3 Fields'),
                                        // "3 Fields".tr,
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => WorkTypeScreen()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 190,
                            width: 155,
                            decoration: BoxDecoration(
                                color: Color(0xff0066FF),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 2, top: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          TranslationService.translate(
                                              'Work Type'),
                                          // "Work Type".tr,
                                          style: adminDashboardcontroller
                                                  .langsize
                                              ? TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)
                                              : TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                      Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/images/workblueimg.png",
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    "assets/images/w8.png",
                                    height: 100,
                                    width: 120,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        TranslationService.translate(
                                            '3 Fields'),
                                        // "3 Fields".tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/Shifttimeviewscreen');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => Shifttimeviewscreen(
                    //
                    //           )),
                    // );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 200,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Color(0xffD6E4FD),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10, top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TranslationService.translate('Shift'),
                                    // "Shift".tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
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
                                          "assets/images/shifticon.png",
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Image.asset(
                              "assets/images/s4.png",
                              height: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text(
                                  //   TranslationService.translate(
                                  //       '3 Shift Timings'),
                                  //   // "3 Shift Timings".tr,
                                  //   style: TextStyle(
                                  //       color: Colors.black,
                                  //       fontWeight: FontWeight.normal,
                                  //       fontSize: 18),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/Userdetailsscreen');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => Userdetailsscreen()),
                    // );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 200,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Color(0xff0F2950),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10, top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TranslationService.translate('User'),
                                    // "User".tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
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
                                          "assets/images/contact.png",
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Image.asset(
                              "assets/images/usermember.png",
                              height: 100,
                              width: 350,
                              fit: BoxFit.fitHeight,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TranslationService.translate('3 Users'),
                                    // "3 Users",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      child: Text(
                        TranslationService.translate('VIEW REPORT'),
                        // 'VIEW REPORT',
                        style: TextStyle(
                            color: Color(0xff0066FF),
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        //backgroundColor: Colors.white,
                        // side: BorderSide(color: Colors.yellow, width: 5),

                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 3.0,
                            color: Color(0xff0066FF),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed('/Piechartscreen');
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => const Piechartscreen()),
                        // );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }

//   Widget buildNavBarItem(IconData icon, String label, int index) {
//     return InkWell(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             icon,
//             color: _currentIndex == index ? Colors.black : Colors.blue,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: _currentIndex == index ? Colors.blue : Colors.black,
//             ),
//           )
//         ],
//       ),
//     );
//   }
}
