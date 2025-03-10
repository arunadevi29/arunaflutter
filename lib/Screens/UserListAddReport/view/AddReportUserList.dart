import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:attendanceapp/Screens/SiteHeadDashboard/view/SiteheadDashboard.dart';
import 'package:attendanceapp/Screens/SiteHeader/AddReportManager/controller/AddReportController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/getXcontroller.dart';
import '../../../widgets/AppBarSample.dart';

import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import '../../SiteHeader/AddReportManager/view/AdminAddReportManagerScreen.dart';
import '../../SiteHeader/AddSiteHead/model/SinglehospitalModel.dart';
import '../../UserDetailsScreen/view/UserDetailsScreen.dart';

class Addreportuserlist extends StatefulWidget {
  const Addreportuserlist({super.key});

  @override
  State<Addreportuserlist> createState() => _AddreportuserlistState();
}

class _AddreportuserlistState extends State<Addreportuserlist> {
  int selectedIndex = -1;
  SampleItem? selectedItem;

  @override
  initState() {
    // at the beginning, all users are shown
    fetchworkData();
    super.initState();
  }

  void fetchworkData({String? query}) async {
    setState(() => addReportController.isLoading = true);
    try {
      final data = await addReportController.reportmanagergetapi(query: query);
      setState(() {
        addReportController.reportmanagerData = data;
        addReportController.isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => addReportController.isLoading = false);
    }
  }

  Set<int> disabledItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),

                  //tooltip: 'Setting Icon',
                  onPressed: () {
                    //Get.toNamed('/Siteheaddashboard');
                    Get.toNamed('/Userdetailsscreen');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => Userdetailsscreen()),
                    // );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  TranslationService.translate("Report Manager"),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              DropdownButton(
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
              IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 40,
                  color: Color(0xff0066FF),
                ),
                //tooltip: 'Setting Icon',
                onPressed: () {
                  Get.toNamed('/Adminaddreportmanagerscreen');
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => ShiftTimeFromScreen()),
                  // );
                },
              ),
            ],
          )
        ],

        //IconButt,
      ),
      body:
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Column(
          //     children: [
          //       userListAddReportController.foundUsers.isNotEmpty
          //           ? Expanded(
          //               child: ListView.builder(
          //               itemCount: userListAddReportController.foundUsers.length,
          //               itemBuilder: (BuildContext context, int index) {
          //                 return SingleChildScrollView(
          //                   child: ListTile(
          //                     leading: CircleAvatar(
          //                       radius: 45,
          //                       backgroundImage: AssetImage(
          //                         userListAddReportController.foundUsers[index]
          //                             ["image"],
          //                       ),
          //                     ),
          //                     // Image.asset(
          //                     //   _foundUsers[index]["image"],
          //                     //   fit: BoxFit.fill,
          //                     //   width: 90,
          //                     //   height: 100,
          //                     // ),
          //                     title: Column(
          //                       children: [
          //                         Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Padding(
          //                               padding: const EdgeInsets.only(top: 15),
          //                               child: Text(
          //                                 userListAddReportController
          //                                     .foundUsers[index]["name"],
          //                                 style: TextStyle(
          //                                     fontSize: 18,
          //                                     color: Colors.black,
          //                                     fontWeight: FontWeight.bold),
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding: const EdgeInsets.only(
          //                                   top: 10, left: 13),
          //                               child: PopupMenuButton<SampleItem>(
          //                                 initialValue: selectedItem,
          //                                 onSelected: (SampleItem item) {
          //                                   setState(() {
          //                                     selectedItem = item;
          //                                   });
          //                                 },
          //                                 itemBuilder: (BuildContext context) =>
          //                                     <PopupMenuEntry<SampleItem>>[
          //                                   PopupMenuItem<SampleItem>(
          //                                     value: SampleItem.itemOne,
          //                                     child: Row(
          //                                       children: [
          //                                         TextButton(
          //                                             onPressed: () {
          //                                               userListAddReportController
          //                                                   .editItem(
          //                                                       index, context);
          //                                               showAlertDialog(context);
          //                                             },
          //                                             child: Text(
          //                                               "Edit",
          //                                               style: TextStyle(
          //                                                   fontSize: 18,
          //                                                   color: Colors.black,
          //                                                   fontWeight:
          //                                                       FontWeight.normal),
          //                                             ))
          //                                       ],
          //                                     ),
          //                                   ),
          //                                   PopupMenuItem<SampleItem>(
          //                                     value: SampleItem.itemTwo,
          //                                     child: Row(
          //                                       children: [
          //                                         TextButton(
          //                                             onPressed: () {
          //                                               setState(() {
          //                                                 userListAddReportController
          //                                                     .foundUsers
          //                                                     .removeAt(index);
          //                                               });
          //                                             },
          //                                             child: Text(
          //                                               "Remove",
          //                                               style: TextStyle(
          //                                                   fontSize: 18,
          //                                                   color: Colors.black,
          //                                                   fontWeight:
          //                                                       FontWeight.normal),
          //                                             ))
          //                                       ],
          //                                     ),
          //                                   ),
          //                                   PopupMenuItem<SampleItem>(
          //                                     value: SampleItem.itemTwo,
          //                                     child: Row(
          //                                       children: [
          //                                         TextButton(
          //                                             onPressed: () {
          //                                               setState(() {});
          //                                             },
          //                                             child: Text(
          //                                               "Disable",
          //                                               style: TextStyle(
          //                                                   fontSize: 18,
          //                                                   color: Colors.black,
          //                                                   fontWeight:
          //                                                       FontWeight.normal),
          //                                             ))
          //                                       ],
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                         // Row(
          //                         //   children: [
          //                         //     Text(
          //                         //       userListAddReportController
          //                         //           .foundUsers[index]["des"],
          //                         //       style: TextStyle(
          //                         //           fontSize: 14,
          //                         //           color: Colors.black,
          //                         //           fontWeight: FontWeight.normal),
          //                         //     ),
          //                         //   ],
          //                         // ),
          //                         // Row(
          //                         //   children: [
          //                         //     Text(
          //                         //       userListAddReportController
          //                         //           .foundUsers[index]["Site Head"],
          //                         //       style: TextStyle(
          //                         //           fontSize: 15,
          //                         //           color: Colors.black,
          //                         //           fontWeight: FontWeight.normal),
          //                         //     ),
          //                         //   ],
          //                         // ),
          //                         // Row(
          //                         //   children: [
          //                         //     Text(
          //                         //       userListAddReportController
          //                         //           .foundUsers[index]["Report User"],
          //                         //       style: TextStyle(
          //                         //           fontSize: 15,
          //                         //           color: Colors.black,
          //                         //           fontWeight: FontWeight.normal),
          //                         //     ),
          //                         //     SizedBox(
          //                         //       width: 10,
          //                         //     ),
          //                         //   ],
          //                         // ),
          //                         Divider()
          //                       ],
          //                     ),
          //                   ),
          //                 );
          //               },
          //             ))
          //           : const Text(
          //               'No results found Please try with diffrent search',
          //               style: TextStyle(fontSize: 24),
          //             ),
          //     ],
          //   ),
          // ),
          Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: addReportController.searchController,
              decoration: InputDecoration(
                labelText: TranslationService.translate("Search"),
                border: OutlineInputBorder(),
                suffixIcon: addReportController.searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          addReportController.searchController.clear();
                          fetchworkData();
                        },
                      )
                    : null,
              ),
              onChanged: (query) => fetchworkData(query: query),
            ),
          ),
          addReportController.isLoading
              ? Center(child: CircularProgressIndicator())
              :
              // Expanded(
              //         child: ListView(
              //           children: addReportController.reportmanagerData.entries
              //               .map((entry) {
              //             return Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Padding(
              //                     padding: EdgeInsets.all(8.0),
              //                     child: Text(
              //                       entry.key,
              //                       style: TextStyle(
              //                           fontSize: 18, fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                   ...entry.value.map((site) => ListTile(
              //                       leading: CircleAvatar(
              //                         radius: 30,
              //                         backgroundImage: AssetImage(
              //                           "assets/images/boy.png",
              //                         ),
              //                       ),
              //
              //                       // Image.asset(
              //                       //   _foundUsers[index]["image"],
              //                       //   fit: BoxFit.fill,
              //                       //   width: 90,
              //                       //   height: 100,
              //                       // ),
              //                       // Image.asset("assets/images/2.png",
              //                       //     width: 50, height: 50, fit: BoxFit.cover),
              //                       //Image.network("YOUR_IMAGE_BASE_URL/${hospital.image}",
              //
              //                       title:
              //                           Text("${site.firstName} ${site.lastName}"),
              //                       subtitle: Text("${site.mobileNumber}"),
              //                       isThreeLine: true,
              //                       trailing: Padding(
              //                           padding: const EdgeInsets.only(
              //                               top: 10, left: 13),
              //                           child: PopupMenuButton<SampleItem>(
              //                               initialValue: selectedItem,
              //                               onSelected: (SampleItem item) {
              //                                 setState(() {
              //                                   selectedItem = item;
              //                                 });
              //                               },
              //                               itemBuilder: (BuildContext context) =>
              //                                   <PopupMenuEntry<SampleItem>>[
              //                                     PopupMenuItem<SampleItem>(
              //                                       value: SampleItem.itemOne,
              //                                       child: Row(
              //                                         children: [
              //                                           TextButton(
              //                                               onPressed: () {
              //                                                 addReportController
              //                                                     .cleaner();
              //                                                 addReportController
              //                                                     .editrepot(
              //                                                         context,
              //                                                         site.id,
              //                                                         site.firstName,
              //                                                         site.lastName,
              //                                                         site.mobileNumber,
              //                                                         site.image);
              //                                               },
              //                                               child: Text(
              //                                                 TranslationService
              //                                                     .translate(
              //                                                         "Edit"),
              //                                                 style: TextStyle(
              //                                                     fontSize: 18,
              //                                                     color:
              //                                                         Colors.black,
              //                                                     fontWeight:
              //                                                         FontWeight
              //                                                             .normal),
              //                                               ))
              //                                         ],
              //                                       ),
              //                                     ),
              //                                     PopupMenuItem<SampleItem>(
              //                                       value: SampleItem.itemTwo,
              //                                       child: Row(
              //                                         children: [
              //                                           TextButton(
              //                                               onPressed: () {
              //                                                 setState(() {
              //                                                   // hospitals.removeAt(index);
              //                                                 });
              //                                               },
              //                                               child: Text(
              //                                                 TranslationService
              //                                                     .translate(
              //                                                         "Remove"),
              //                                                 style: TextStyle(
              //                                                     fontSize: 18,
              //                                                     color:
              //                                                         Colors.black,
              //                                                     fontWeight:
              //                                                         FontWeight
              //                                                             .normal),
              //                                               ))
              //                                         ],
              //                                       ),
              //                                     ),
              //                                     PopupMenuItem<SampleItem>(
              //                                       value: SampleItem.itemTwo,
              //                                       child: Row(
              //                                         children: [
              //                                           TextButton(
              //                                               onPressed: () {
              //                                                 setState(() {});
              //                                               },
              //                                               child: Text(
              //                                                 TranslationService
              //                                                     .translate(
              //                                                         "Disable"),
              //                                                 style: TextStyle(
              //                                                     fontSize: 18,
              //                                                     color:
              //                                                         Colors.black,
              //                                                     fontWeight:
              //                                                         FontWeight
              //                                                             .normal),
              //                                               ))
              //                                         ],
              //                                       ),
              //                                     ),
              //                                   ]))))
              //                 ]);
              //           }).toList(),
              //         ),
              //       ),
              Expanded(
                  child: ListView(
                    children: addReportController.reportmanagerData.entries
                        .map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              entry.key,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...entry.value.map((site) {
                            bool isDisabled = disabledItems.contains(site.id);

                            return Opacity(
                              opacity: isDisabled ? 0.5 : 1.0,
                              // Reduce visibility when disabled
                              child: IgnorePointer(
                                ignoring: isDisabled, // Disable interactions
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("assets/images/boy.png"),
                                  ),
                                  title: Text(
                                    TranslationService.translate(
                                        "${site.firstName} ${site.lastName}"),
                                    style: TextStyle(
                                        color: isDisabled
                                            ? Colors.grey
                                            : Colors.black),
                                  ),
                                  subtitle: Text("${site.mobileNumber}"),
                                  isThreeLine: true,
                                  trailing: PopupMenuButton<String>(
                                    onSelected: (String value) {
                                      setState(() {
                                        if (value == "Disable") {
                                          disabledItems
                                              .add(site.id); // Disable the item
                                        } else if (value == "Enable") {
                                          disabledItems.remove(
                                              site.id); // Enable the item
                                        }
                                      });
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      PopupMenuItem(
                                          value: "Edit",
                                          child: InkWell(
                                              onTap: () {
                                                addReportController.editrepot(
                                                    context,
                                                    site.id,
                                                    site.firstName,
                                                    site.lastName,
                                                    site.mobileNumber,
                                                    site.image);
                                              },
                                              child: Text("Edit"))),
                                      PopupMenuItem(
                                          value: "Remove",
                                          child: Text("Remove")),
                                      PopupMenuItem(
                                        value:
                                            isDisabled ? "Enable" : "Disable",
                                        child: Text(
                                            isDisabled ? "Enable" : "Disable"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      );
                    }).toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
