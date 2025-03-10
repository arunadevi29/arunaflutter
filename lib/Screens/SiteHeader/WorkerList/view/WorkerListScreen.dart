import 'dart:convert';

import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:attendanceapp/Screens/AddWorkType/controller/AddWorkTypeController.dart';
import 'package:attendanceapp/Screens/Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import 'package:attendanceapp/Screens/SiteHeader/WorkerList/controller/WorkerListController.dart';
import 'package:attendanceapp/Screens/SiteHeader/WorkerList/model/worklistmodel.dart';
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

    fetchworkData();
    super.initState();
  }

  void fetchworkData({String? query}) async {
    setState(() => workerListController.Loading = true);
    try {
      final data = await workerListController.worklistapi(query: query);
      setState(() {
        workerListController.workData = data;
        workerListController.Loading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => workerListController.Loading = false);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationService.translate("Worker")),

        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                  size: 35,
                  color: Color(0xff0066FF),
                ),
                //tooltip: 'Setting Icon',
                onPressed: () {
                  Get.toNamed('/Siteheadaddsiteworkerscreen');
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => Adminaddsiteheadscreen()),
                  // );
                },
              ),
            ],
          ),
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: workerListController.searchController,
              decoration: InputDecoration(
                labelText: TranslationService.translate("Search"),
                border: OutlineInputBorder(),
                suffixIcon:
                    workerListController.searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              workerListController.searchController.clear();
                              fetchworkData();
                            },
                          )
                        : null,
              ),
              onChanged: (query) => fetchworkData(query: query),
            ),
          ),
          workerListController.Loading
              ? Center(child: CircularProgressIndicator())
              :
              // Expanded(
              //   child: ListView(
              //     children:
              //     workerListController.siteheadData.entries.map((entry) {
              //       return Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.all(8.0),
              //               child: Text(
              //                 entry.key,
              //                 style: TextStyle(
              //                     fontSize: 18, fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //             ...entry.value.map((site) =>
              //                 ListTile(
              //                     leading: CircleAvatar(
              //                       radius: 30,
              //                       backgroundImage: AssetImage(
              //                         "assets/images/boy.png",
              //                       ),
              //                     ),
              //
              //                     // Image.asset(
              //                     //   _foundUsers[index]["image"],
              //                     //   fit: BoxFit.fill,
              //                     //   width: 90,
              //                     //   height: 100,
              //                     // ),
              //                     // Image.asset("assets/images/2.png",
              //                     //     width: 50, height: 50, fit: BoxFit.cover),
              //                     //Image.network("YOUR_IMAGE_BASE_URL/${hospital.image}",
              //
              //                     title: Text("${site.workType}"),
              //                     subtitle: Text("${site.work}"),
              //                     isThreeLine: true,
              //                     trailing: Padding(
              //                         padding: const EdgeInsets.only(
              //                             top: 10, left: 13),
              //                         child: PopupMenuButton<SampleItem>(
              //                             initialValue: selectedItem,
              //                             onSelected: (SampleItem item) {
              //                               setState(() {
              //                                 selectedItem = item;
              //                               });
              //                             },
              //                             itemBuilder: (BuildContext context) =>
              //                             <PopupMenuEntry<SampleItem>>[
              //                               PopupMenuItem<SampleItem>(
              //                                 value: SampleItem.itemOne,
              //                                 child: Row(
              //                                   children: [
              //                                     TextButton(
              //                                         onPressed: () {
              //                                           workerListController.edit(
              //                                               context,
              //                                               site.id,
              //                                               site.firstName,
              //                                               site.lastName,
              //                                               site.mobileNumber,
              //                                               site.workType,
              //                                               site.work,
              //                                               site.image);
              //                                           workerListController
              //                                               .cleaner();
              //                                         },
              //                                         child: Text(
              //                                           TranslationService
              //                                               .translate(
              //                                               "Edit"),
              //                                           style: TextStyle(
              //                                               fontSize: 18,
              //                                               color:
              //                                               Colors.black,
              //                                               fontWeight:
              //                                               FontWeight
              //                                                   .normal),
              //                                         ))
              //                                   ],
              //                                 ),
              //                               ),
              //                               PopupMenuItem<SampleItem>(
              //                                 value: SampleItem.itemTwo,
              //                                 child: Row(
              //                                   children: [
              //                                     TextButton(
              //                                         onPressed: () {
              //                                           setState(() {
              //                                             // hospitals.removeAt(index);
              //                                           });
              //                                         },
              //                                         child: Text(
              //                                           TranslationService
              //                                               .translate(
              //                                               "Remove"),
              //                                           style: TextStyle(
              //                                               fontSize: 18,
              //                                               color:
              //                                               Colors.black,
              //                                               fontWeight:
              //                                               FontWeight
              //                                                   .normal),
              //                                         ))
              //                                   ],
              //                                 ),
              //                               ),
              //                               PopupMenuItem<SampleItem>(
              //                                 value: SampleItem.itemTwo,
              //                                 child: Row(
              //                                   children: [
              //                                     TextButton(
              //                                         onPressed: () {
              //                                           setState(() {});
              //                                         },
              //                                         child: Text(
              //                                           TranslationService
              //                                               .translate(
              //                                               "Disable"),
              //                                           style: TextStyle(
              //                                               fontSize: 18,
              //                                               color:
              //                                               Colors.black,
              //                                               fontWeight:
              //                                               FontWeight
              //                                                   .normal),
              //                                         ))
              //                                   ],
              //                                 ),
              //                               ),
              //                             ]))))
              //           ]);
              //     }).toList(),
              //   ),
              // ),
              Expanded(
                  child: ListView(
                    children:
                        workerListController.workData.entries.map((entry) {
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
                            bool isDisabled = workerListController.disabledItems
                                .contains(site.id);

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
                                        "${site.workType}"),
                                    style: TextStyle(
                                        color: isDisabled
                                            ? Colors.grey
                                            : Colors.black),
                                  ),
                                  subtitle: Text("${site.work}"),
                                  isThreeLine: true,
                                  trailing: PopupMenuButton<String>(
                                    onSelected: (String value) {
                                      setState(() {
                                        if (value == "Disable") {
                                          workerListController.disabledItems
                                              .add(site.id); // Disable the item
                                        } else if (value == "Enable") {
                                          workerListController.disabledItems
                                              .remove(
                                                  site.id); // Enable the item
                                        }
                                      });
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      PopupMenuItem(
                                          value: "Edit",
                                          child: InkWell(
                                              onTap: () {
                                                workerListController.edit(
                                                    context,
                                                    site.id,
                                                    site.firstName,
                                                    site.lastName,
                                                    site.mobileNumber,
                                                    site.workType,
                                                    site.work,
                                                    site.image);
                                                workerListController.cleaner();
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
