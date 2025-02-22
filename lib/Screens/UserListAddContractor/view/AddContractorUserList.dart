import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/getXcontroller.dart';
import '../../../widgets/AppBarSample.dart';

import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import '../../SiteHeadDashboard/view/SiteheadDashboard.dart';
import '../../SiteHeader/AddContractor/view/SiteHeadAddContractorScreen.dart';
import '../../UserDetailsScreen/view/UserDetailsScreen.dart';

class Addcontractoruserlist extends StatefulWidget {
  const Addcontractoruserlist({super.key});

  @override
  State<Addcontractoruserlist> createState() => _AddcontractoruserlistState();
}

class _AddcontractoruserlistState extends State<Addcontractoruserlist> {
  int selectedIndex = -1;
  SampleItem? selectedItem;

  @override
  initState() {
    // at the beginning, all users are shown
    userListAddContractorController.foundUsers =
        userListAddContractorController.allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  // void _runFilter(String enteredKeyword) {
  //   List<Map<String, dynamic>> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //     results = _allUsers;
  //   } else {
  //     results = _allUsers
  //         .where((user) =>
  //             user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }
  //
  //   // Refresh the UI
  //   setState(() {
  //     _foundUsers = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Site Contractor"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 35,
                color: Color(0xff0066FF),
              ),
              //tooltip: 'Setting Icon',
              onPressed: () {
                Get.toNamed('/Siteheadaddcontractorscreen');
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (context) => Siteheadaddcontractorscreen()),
                // );
              },
            ),
          ), //IconButt,
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () {
            //Get.toNamed('/Siteheaddashboard');
            Get.toNamed('/SiteheadUser');
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => Userdetailsscreen()),
            // );
          },
        ), //IconButt,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            userListAddContractorController.foundUsers.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                    itemCount:
                        userListAddContractorController.foundUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleChildScrollView(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage(
                              userListAddContractorController.foundUsers[index]
                                  ["image"],
                            ),
                          ),
                          // Image.asset(
                          //   _foundUsers[index]["image"],
                          //   fit: BoxFit.fill,
                          //   width: 90,
                          //   height: 100,
                          // ),
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      userListAddContractorController
                                          .foundUsers[index]["name"],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 13),
                                    child: PopupMenuButton<SampleItem>(
                                      initialValue: selectedItem,
                                      onSelected: (SampleItem item) {
                                        setState(() {
                                          selectedItem = item;
                                        });
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<SampleItem>>[
                                        PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemOne,
                                          child: Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    userListAddContractorController
                                                        .editItem(
                                                            index, context);
                                                    // showAlertDialog(context);
                                                  },
                                                  child: Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemTwo,
                                          child: Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      userListAddContractorController
                                                          .foundUsers
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  child: Text(
                                                    "Remove",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemTwo,
                                          child: Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    "Disable",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    userListAddContractorController
                                        .foundUsers[index]["des"],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       userListAddContractorController
                              //           .foundUsers[index]["Site Head"],
                              //       style: TextStyle(
                              //           fontSize: 15,
                              //           color: Colors.black,
                              //           fontWeight: FontWeight.normal),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       userListAddContractorController
                              //           .foundUsers[index]["Report User"],
                              //       style: TextStyle(
                              //           fontSize: 15,
                              //           color: Colors.black,
                              //           fontWeight: FontWeight.normal),
                              //     ),
                              //     SizedBox(
                              //       width: 10,
                              //     ),
                              //   ],
                              // ),
                              Divider()
                            ],
                          ),
                        ),
                      );
                    },
                  ))
                : const Text(
                    'No results found Please try with diffrent search',
                    style: TextStyle(fontSize: 24),
                  ),
          ],
        ),
      ),
    );
  }
}

class Reportsmodel {
  late String Hospital;
  late String Image;
  late String Security;
  late String SiteHead;
  late String ReportUser;

  Reportsmodel(
      {required this.Hospital,
      required this.Security,
      required this.Image,
      required this.SiteHead,
      required this.ReportUser});
}
