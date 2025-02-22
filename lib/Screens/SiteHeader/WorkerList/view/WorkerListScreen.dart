import 'dart:convert';

import 'package:attendanceapp/Screens/AddWorkType/controller/AddWorkTypeController.dart';
import 'package:attendanceapp/Screens/Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../SiteHeadDashboard/view/SiteheadDashboard.dart';
import '../../../SiteHeader/AddSiteWorker/view/SiteHeadAddSiteWorkerScreen.dart';
import '../../../UserDetailsScreen/view/UserDetailsScreen.dart';
import '../../AddSiteWorker/model/addworkmodel.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class Workerlistscreen extends StatefulWidget {
  const Workerlistscreen({super.key});

  @override
  State<Workerlistscreen> createState() => _WorkerlistscreenState();
}

class _WorkerlistscreenState extends State<Workerlistscreen> {
  int selectedIndex = -1;
  SampleItem? selectedItem;

  @override
  initState() {
    // at the beginning, all users are shown
    workerListController.foundUsers = workerListController.allUsers;
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Site Worker"),
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
                  Get.toNamed('/Siteheadaddsiteworkerscreen');
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => Siteheadaddsiteworkerscreen()),
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
              workerListController.allUsers.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                      itemCount: workerListController.allUsers.length,
                      itemBuilder: (BuildContext context, index) {
                        return SingleChildScrollView(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(
                                // '${workerListController.allUsers[index]['Firstname']}'
                                workerListController.foundUsers[index]["image"],
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
                                        workerListController.foundUsers[index]
                                            ["name"],
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
                                                      // workerListController
                                                      //     .editItem(
                                                      //     index, context);
                                                      // showAlertDialog(context);
                                                    },
                                                    child: Text(
                                                      "Edit",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .normal),
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
                                                        workerListController
                                                            .foundUsers
                                                            .removeAt(index);
                                                      });
                                                    },
                                                    child: Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .normal),
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
                                                          fontWeight: FontWeight
                                                              .normal),
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
                                      workerListController.foundUsers[index]
                                          ["des"],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      workerListController.foundUsers[index]
                                          ["Site Head"],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      workerListController.foundUsers[index]
                                          ["Report User"],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                //Divider()
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
        )
        //
        //     //     Container(
        //     //   child: Column(
        //     //     children: [
        //     //       Padding(
        //     //         padding: const EdgeInsets.all(8.0),
        //     //         child: TextField(
        //     //           controller: workerListController.searchController,
        //     //           // onChanged: (query) =>
        //     //           //     userListSiteHeaderController.filteredItems(query),
        //     //           decoration: InputDecoration(
        //     //             labelText: 'Search',
        //     //             hintText: 'Type something...',
        //     //             prefixIcon: Icon(Icons.search),
        //     //             border: OutlineInputBorder(
        //     //               borderRadius: BorderRadius.circular(8.0),
        //     //             ),
        //     //           ),
        //     //         ),
        //     //       ),
        //     //       Expanded(
        //     //         child: FutureBuilder<List<Security>>(
        //     //             future: addSiteWorkerController.fetchWorkapi(),
        //     //             builder: (context, snapshot) {
        //     //               if (snapshot.connectionState == ConnectionState.waiting) {
        //     //                 return Center(
        //     //                     child: CircularProgressIndicator()); // Loading state
        //     //               } else if (snapshot.hasError) {
        //     //                 return Center(
        //     //                     child:
        //     //                         Text("Error: ${snapshot.error}")); // Error state
        //     //               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //     //                 return Center(
        //     //                     child: Text("No hospitals found")); // No data state
        //     //               } else {
        //     //                 List<Security> securitys = snapshot.data!;
        //     //
        //     //                 return ListView.builder(
        //     //                   itemCount: securitys.length,
        //     //                   itemBuilder: (context, index) {
        //     //                     Security security = securitys[index];
        //     //
        //     //                     return ListTile(
        //     //                       leading: CircleAvatar(
        //     //                         radius: 50,
        //     //                         backgroundImage: AssetImage(
        //     //                           "assets/images/boy.png",
        //     //                         ),
        //     //                       ),
        //     //
        //     //                       // Image.asset(
        //     //                       //   _foundUsers[index]["image"],
        //     //                       //   fit: BoxFit.fill,
        //     //                       //   width: 90,
        //     //                       //   height: 100,
        //     //                       // ),
        //     //                       // Image.asset("assets/images/2.png",
        //     //                       //     width: 50, height: 50, fit: BoxFit.cover),
        //     //                       //Image.network("YOUR_IMAGE_BASE_URL/${hospital.image}",
        //     //
        //     //                       title: Text(
        //     //                           "${security.firstName} ${security.lastName}"),
        //     //                       subtitle: Text("${security.workType}"
        //     //                           "\n${security.work}"),
        //     //                       isThreeLine: true,
        //     //                       trailing: Padding(
        //     //                         padding: const EdgeInsets.only(top: 10, left: 13),
        //     //                         child: PopupMenuButton<SampleItem>(
        //     //                           initialValue: selectedItem,
        //     //                           onSelected: (SampleItem item) {
        //     //                             setState(() {
        //     //                               selectedItem = item;
        //     //                             });
        //     //                           },
        //     //                           itemBuilder: (BuildContext context) =>
        //     //                               <PopupMenuEntry<SampleItem>>[
        //     //                             PopupMenuItem<SampleItem>(
        //     //                               value: SampleItem.itemOne,
        //     //                               child: Row(
        //     //                                 children: [
        //     //                                   TextButton(
        //     //                                       onPressed: () {
        //     //                                         // userListSiteHeaderController
        //     //                                         //     .editItem(index, context);
        //     //                                         // showAlertDialog(context);
        //     //                                       },
        //     //                                       child: Text(
        //     //                                         "Edit",
        //     //                                         style: TextStyle(
        //     //                                             fontSize: 18,
        //     //                                             color: Colors.black,
        //     //                                             fontWeight:
        //     //                                                 FontWeight.normal),
        //     //                                       ))
        //     //                                 ],
        //     //                               ),
        //     //                             ),
        //     //                             PopupMenuItem<SampleItem>(
        //     //                               value: SampleItem.itemTwo,
        //     //                               child: Row(
        //     //                                 children: [
        //     //                                   TextButton(
        //     //                                       onPressed: () {
        //     //                                         setState(() {
        //     //                                           securitys.removeAt(index);
        //     //                                         });
        //     //                                       },
        //     //                                       child: Text(
        //     //                                         "Remove",
        //     //                                         style: TextStyle(
        //     //                                             fontSize: 18,
        //     //                                             color: Colors.black,
        //     //                                             fontWeight:
        //     //                                                 FontWeight.normal),
        //     //                                       ))
        //     //                                 ],
        //     //                               ),
        //     //                             ),
        //     //                             PopupMenuItem<SampleItem>(
        //     //                               value: SampleItem.itemTwo,
        //     //                               child: Row(
        //     //                                 children: [
        //     //                                   TextButton(
        //     //                                       onPressed: () {
        //     //                                         setState(() {});
        //     //                                       },
        //     //                                       child: Text(
        //     //                                         "Disable",
        //     //                                         style: TextStyle(
        //     //                                             fontSize: 18,
        //     //                                             color: Colors.black,
        //     //                                             fontWeight:
        //     //                                                 FontWeight.normal),
        //     //                                       ))
        //     //                                 ],
        //     //                               ),
        //     //                             ),
        //     //                           ],
        //     //                         ),
        //     //                       ),
        //     //                     );
        //     //                   },
        //     //                 );
        //     //
        //     //
        //     //               }
        //     //
        //     //             }),
        //     //       ),
        //     //     ],
        //     //   ),
        //     // ),
        //     //     Column(
        //     //   children: [
        //     //     Expanded(
        //     //       child: ListView.builder(
        //     //         itemCount: addSiteWorkerController.workerdata.length,
        //     //         itemBuilder: (context, index) {
        //     //           return ListTile(
        //     //             title:
        //     //                 Text(addSiteWorkerController.workerdata[index].firstName),
        //     //           );
        //     //         },
        //     //       ),
        //     //     ),
        //     //   ],
        //     // ),
        //   );
        // }
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
