import 'package:attendanceapp/Screens/Admin/FacilityCardDetails/controller/FacilityCardDetailsController.dart';
import 'package:attendanceapp/Screens/Admin/FacilityCardListview/controller/FacilityCardListviewController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../CommenFiles/translateService.dart';
import '../../../../demo.dart';
import '../../../../widgets/AppBarSample.dart';
import '../../AdminDashboard/view/Admin_Dashboard_Screen.dart';
import '../../FacilityCardListview/view/Facilities_Card_Items.dart';
import '../model/FacilitylistModel.dart';
import 'Addfacility.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class FacilitiesScreen extends StatefulWidget {
  FacilitiesScreen({super.key});

  // final Facilitiesfieldscreencontroller usercontroller =
  //     Get.put(Facilitiesfieldscreencontroller());

  @override
  State<FacilitiesScreen> createState() => _FacilitiesScreenState();
}

class _FacilitiesScreenState extends State<FacilitiesScreen> {
  @override
  initState() {
    facilityCardDetailsController.facilitygetApi();
    fetchData();
    super.initState();
  }

  void fetchData({String? query}) async {
    setState(() => facilityCardDetailsController.Loading = true);
    try {
      final data =
          await facilityCardDetailsController.facilitygetApi(query: query);
      setState(() {
        facilityCardDetailsController.facilityData = data;
        facilityCardDetailsController.Loading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => facilityCardDetailsController.Loading = false);
    }
  }

  SampleItem? selectedItem;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                TranslationService.translate('Facility'),
                // "Facility",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
            ),
            //tooltip: 'Setting Icon',
            onPressed: () {
              // Get.toNamed('/Siteheaddashboard');
              Get.toNamed('/Admindashboard');
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => Admin_Dashboard()),
              // );
            },
          ),
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: facilityCardDetailsController.searchController,
              decoration: InputDecoration(
                labelText: TranslationService.translate("Search"),
                border: OutlineInputBorder(),
                suffixIcon: facilityCardDetailsController
                        .searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          facilityCardDetailsController.searchController
                              .clear();
                          fetchData();
                        },
                      )
                    : null,
              ),
              onChanged: (query) => fetchData(query: query),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Addfacility()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 50,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        TranslationService.translate('Add Facility'),
                        // "Add Facility",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          facilityCardDetailsController.Loading
              ? Center(child: CircularProgressIndicator())
              :
              // Expanded(
              //         child: SizedBox(
              //           // height: 2000,
              //           height: MediaQuery.of(context).size.height * 2,
              //           child: GridView.count(
              //             scrollDirection: Axis.vertical,
              //             shrinkWrap: true,
              //             crossAxisCount: 2,
              //             childAspectRatio: 0.78,
              //             padding: EdgeInsets.all(18.0),
              //             crossAxisSpacing: 10,
              //             mainAxisSpacing: 10,
              //             children: facilityCardDetailsController
              //                 .facilityData.entries
              //                 .expand(
              //                   (entry) => entry.value.map(
              //                     (site) => GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                             context,
              //                             MaterialPageRoute(
              //                                 builder: (context) =>
              //                                     FacilitiesListView()));
              //                       },
              //                       // Get.toNamed("/");
              //                       child: Card(
              //                           elevation: 5,
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius: BorderRadius.circular(15),
              //                           ),
              //                           color: Colors.blue,
              //                           child: ListTile(
              //                             title: Column(
              //                               // mainAxisSize: MainAxisSize.max,
              //                               children: [
              //                                 Row(
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment.spaceBetween,
              //                                   // Push items apart
              //                                   children: [
              //                                     Expanded(
              //                                       // Prevent overflow of long text
              //                                       child: Text(
              //                                         site.fieldName,
              //                                         style: TextStyle(
              //                                             fontSize: 18,
              //                                             color: Colors.black,
              //                                             fontWeight:
              //                                                 FontWeight.bold),
              //                                       ),
              //                                     ),
              //                                     PopupMenuButton<SampleItem>(
              //                                       initialValue: selectedItem,
              //                                       onSelected: (SampleItem item) {
              //                                         setState(() {
              //                                           selectedItem = item;
              //                                         });
              //                                       },
              //                                       itemBuilder:
              //                                           (BuildContext context) =>
              //                                               <PopupMenuEntry<
              //                                                   SampleItem>>[
              //                                         PopupMenuItem<SampleItem>(
              //                                           value: SampleItem.itemOne,
              //                                           child: Row(
              //                                             children: [
              //                                               TextButton(
              //                                                   onPressed: () {
              //                                                     facilityCardDetailsController
              //                                                         .editFacility(
              //                                                             context,
              //                                                             site.id,
              //                                                             site.fieldName,
              //                                                             site.fieldImage);
              //                                                     facilityCardDetailsController
              //                                                         .cleaner();
              //
              //                                                     // facilityCardDetailsController
              //                                                     //     .editItem(
              //                                                     //         context);
              //                                                   },
              //                                                   child: Text(
              //                                                     "Edit",
              //                                                     style: TextStyle(
              //                                                         fontSize: 18,
              //                                                         color: Colors
              //                                                             .black,
              //                                                         fontWeight:
              //                                                             FontWeight
              //                                                                 .normal),
              //                                                   ))
              //                                             ],
              //                                           ),
              //                                         ),
              //                                         PopupMenuItem<SampleItem>(
              //                                           value: SampleItem.itemTwo,
              //                                           child: Row(
              //                                             children: [
              //                                               TextButton(
              //                                                   onPressed: () {
              //                                                     setState(() {
              //                                                       facilityCardDetailsController
              //                                                           .deleteWork(
              //                                                               site.id);
              //                                                     });
              //                                                   },
              //                                                   child: Text(
              //                                                     "Remove",
              //                                                     style: TextStyle(
              //                                                         fontSize: 18,
              //                                                         color: Colors
              //                                                             .black,
              //                                                         fontWeight:
              //                                                             FontWeight
              //                                                                 .normal),
              //                                                   ))
              //                                             ],
              //                                           ),
              //                                         ),
              //                                         PopupMenuItem<SampleItem>(
              //                                           value: SampleItem.itemTwo,
              //                                           child: Row(
              //                                             children: [
              //                                               TextButton(
              //                                                   onPressed: () {
              //                                                     setState(() {
              //                                                       facilityCardDetailsController
              //                                                               .isDisabled
              //                                                           ? null // Disable button if item is in disabled list
              //                                                           : () =>
              //                                                               facilityCardDetailsController
              //                                                                   .disableItem(
              //                                                                 site.id,
              //                                                               );
              //                                                     });
              //                                                   },
              //                                                   child: Text(
              //                                                     "Disable",
              //                                                     style: TextStyle(
              //                                                         fontSize: 18,
              //                                                         color: Colors
              //                                                             .black,
              //                                                         fontWeight:
              //                                                             FontWeight
              //                                                                 .normal),
              //                                                   ))
              //                                             ],
              //                                           ),
              //                                         ),
              //                                       ],
              //                                     )
              //                                   ],
              //                                 ),
              //                                 Image.asset(
              //                                   "assets/images/hopital1.png",
              //                                   // height: 100,
              //                                   // width: 120,
              //                                 ),
              //                                 SizedBox(
              //                                   height: 20,
              //                                 ),
              //                                 Row(
              //                                   children: [
              //                                     // Text(
              //                                     //     "Count:${site.fieldName.length}"),
              //                                     Text(
              //                                       "Count: ${site.fieldName.length}",
              //                                       style: TextStyle(
              //                                           fontSize: 16,
              //                                           fontWeight:
              //                                               FontWeight.bold),
              //                                     ),
              //                                   ],
              //                                 ),
              //                               ],
              //                             ),
              //                           )
              //                           // Column(
              //                           //   crossAxisAlignment:
              //                           //       CrossAxisAlignment.center,
              //                           //   children: [
              //                           //     Column(
              //                           //       children: [
              //                           //         Text(
              //                           //           site.fieldName,
              //                           //           // ✅ Now correctly accessing fieldName
              //                           //           style: TextStyle(
              //                           //               fontSize: 16,
              //                           //               fontWeight: FontWeight.bold),
              //                           //         ),
              //                           //         if (site.count != null)
              //                           //           Text("Count: ${site.count}"),
              //                           //         // ✅ Accessing count properly
              //                           //       ],
              //                           //     ),
              //                           //     Image.asset(
              //                           //       "assets/images/hopital1.png",
              //                           //       height: 80,
              //                           //       width: double.infinity,
              //                           //       fit: BoxFit.cover,
              //                           //     ),
              //                           //   ],
              //                           // ),
              //                           ),
              //                     ),
              //                   ),
              //                 )
              //                 .toList(),
              //           ),
              //         ),
              //       )
              Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 0.78,
                      padding: EdgeInsets.all(18.0),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: facilityCardDetailsController
                          .facilityData.entries
                          .expand((entry) => entry.value.map((site) {
                                bool isDisabled = facilityCardDetailsController
                                    .disabledItems
                                    .contains(site.id);

                                return Opacity(
                                  opacity: isDisabled ? 0.5 : 1.0,
                                  // Reduce opacity if disabled
                                  child: IgnorePointer(
                                    ignoring:
                                        isDisabled, // Disable interactions
                                    child: GestureDetector(
                                      onTap: isDisabled
                                          ? null // Prevent navigation if disabled
                                          : () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FacilitiesListView()));
                                            },
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        color: isDisabled
                                            ? Colors.grey
                                            : Colors.blue,
                                        // Grey out if disabled
                                        child: ListTile(
                                          title: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      site.fieldName.toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  PopupMenuButton<String>(
                                                    onSelected: (String value) {
                                                      setState(() {
                                                        if (value ==
                                                            "Disable") {
                                                          facilityCardDetailsController
                                                              .disabledItems
                                                              .add(site.id
                                                                  as int); // Disable item
                                                        } else if (value ==
                                                            "Enable") {
                                                          facilityCardDetailsController
                                                              .disabledItems
                                                              .remove(site
                                                                  .id); // Enable item
                                                        }
                                                      });
                                                    },
                                                    itemBuilder: (BuildContext
                                                            context) =>
                                                        [
                                                      PopupMenuItem(
                                                          value: "Edit",
                                                          child: InkWell(
                                                              onTap: () {
                                                                facilityCardDetailsController
                                                                    .editFacility(
                                                                  context,
                                                                  site.id
                                                                      as int,
                                                                  site.fieldName
                                                                      .toString(),
                                                                  site.fieldImage
                                                                      .toString(),
                                                                  //                                                             site.fieldImage);
                                                                  //workerListController.cleaner()
                                                                );
                                                              },
                                                              child: Text(
                                                                  "Edit"))),
                                                      PopupMenuItem(
                                                          value: "Remove",
                                                          child:
                                                              Text("Remove")),
                                                      PopupMenuItem(
                                                        value: isDisabled
                                                            ? "Enable"
                                                            : "Disable",
                                                        child: Text(isDisabled
                                                            ? "Enable"
                                                            : "Disable"),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Image.asset(
                                                  "assets/images/hopital1.png"),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Count: ${site.entryCount}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }))
                          .toList(),
                    ),
                  ),
                )
        ]));
  }

  CircleAvatar buildCircleAvatar_ing(circlemenu) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(circlemenu)),
        ));
  }

  Container buildContainer_menu(menuname) {
    return Container(
      height: 30,
      width: 120,
      // color: Colors.white,
      child: Center(
        child: Text(
          menuname,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}

/*SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: facilityCardListviewController.index + 1,
              //itemCount: facilityCardDetailsController.facility.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 0.78,
                    padding: EdgeInsets.all(18.0),
                    crossAxisCount: 2,
                    children: [
                      // for (int i = 1; i < 5; i++)
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/FacilitiesListView');
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => FacilitiesListView(
                          //               containers: [],
                          //             )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffEAEAEB),
                              borderRadius: BorderRadius.circular(20)),
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hospital",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 16),
                                  //   child: Container(
                                  //       width: 42,
                                  //       height: 42,
                                  //       decoration: BoxDecoration(
                                  //         shape: BoxShape.circle,
                                  //         color: Colors.white,
                                  //       ),
                                  //       child: Padding(
                                  //         padding: const EdgeInsets.all(8.0),
                                  //         child: Image.asset(
                                  //           "assets/images/first.png",
                                  //           height: 40,
                                  //           width: 40,
                                  //         ),
                                  //       )),
                                  // ),
                                  PopupMenuButton<SampleItem>(
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
                                                  userListAddReportController
                                                      .editItem(index, context);
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
                                                    userListAddReportController
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
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset("assets/images/hopital1.png"),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "3 Hospital",
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
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.toNamed('/FacilitiesListView');
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) => FacilitiesListView(
                      //     //               containers: [],
                      //     //             )));
                      //   },
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color: Color(0xffEAEAEB),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     padding:
                      //         EdgeInsets.only(left: 20, right: 10, top: 10),
                      //     margin:
                      //         EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               "Autdiotorium",
                      //               style: TextStyle(
                      //                   color: Colors.black,
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 18),
                      //             ),
                      //             // Padding(
                      //             //   padding: const EdgeInsets.only(left: 16),
                      //             //   child: Container(
                      //             //       width: 42,
                      //             //       height: 42,
                      //             //       decoration: BoxDecoration(
                      //             //         shape: BoxShape.circle,
                      //             //         color: Colors.white,
                      //             //       ),
                      //             //       child: Padding(
                      //             //         padding: const EdgeInsets.all(8.0),
                      //             //         child: Image.asset(
                      //             //           "assets/images/first.png",
                      //             //           height: 40,
                      //             //           width: 40,
                      //             //         ),
                      //             //       )),
                      //             // ),
                      //             PopupMenuButton<SampleItem>(
                      //               initialValue: selectedItem,
                      //               onSelected: (SampleItem item) {
                      //                 setState(() {
                      //                   selectedItem = item;
                      //                 });
                      //               },
                      //               itemBuilder: (BuildContext context) =>
                      //                   <PopupMenuEntry<SampleItem>>[
                      //                 PopupMenuItem<SampleItem>(
                      //                   value: SampleItem.itemOne,
                      //                   child: Row(
                      //                     children: [
                      //                       TextButton(
                      //                           onPressed: () {
                      //                             userListAddReportController
                      //                                 .editItem(index, context);
                      //                             // showAlertDialog(context);
                      //                           },
                      //                           child: Text(
                      //                             "Edit",
                      //                             style: TextStyle(
                      //                                 fontSize: 18,
                      //                                 color: Colors.black,
                      //                                 fontWeight:
                      //                                     FontWeight.normal),
                      //                           ))
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 PopupMenuItem<SampleItem>(
                      //                   value: SampleItem.itemTwo,
                      //                   child: Row(
                      //                     children: [
                      //                       TextButton(
                      //                           onPressed: () {
                      //                             setState(() {
                      //                               userListAddReportController
                      //                                   .foundUsers
                      //                                   .removeAt(index);
                      //                             });
                      //                           },
                      //                           child: Text(
                      //                             "Remove",
                      //                             style: TextStyle(
                      //                                 fontSize: 18,
                      //                                 color: Colors.black,
                      //                                 fontWeight:
                      //                                     FontWeight.normal),
                      //                           ))
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 PopupMenuItem<SampleItem>(
                      //                   value: SampleItem.itemTwo,
                      //                   child: Row(
                      //                     children: [
                      //                       TextButton(
                      //                           onPressed: () {
                      //                             setState(() {});
                      //                           },
                      //                           child: Text(
                      //                             "Disable",
                      //                             style: TextStyle(
                      //                                 fontSize: 18,
                      //                                 color: Colors.black,
                      //                                 fontWeight:
                      //                                     FontWeight.normal),
                      //                           ))
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //         SizedBox(
                      //           height: 20,
                      //         ),
                      //         Image.asset(
                      //           "assets/images/Autdiotorium.png",
                      //           height: 100,
                      //           width: 150,
                      //         ),
                      //         Padding(
                      //           padding:
                      //               const EdgeInsets.only(top: 10, left: 1),
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 "3 Autdiotorium",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontWeight: FontWeight.normal,
                      //                     fontSize: 18),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.toNamed('/FacilitiesListView');
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) => FacilitiesListView(
                      //     //               containers: [],
                      //     //             )));
                      //   },
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color: Color(0xffEAEAEB),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     padding:
                      //         EdgeInsets.only(left: 15, right: 15, top: 10),
                      //     margin:
                      //         EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               "College",
                      //               style: TextStyle(
                      //                   color: Colors.black,
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 18),
                      //             ),
                      //             // Padding(
                      //             //   padding: const EdgeInsets.only(left: 16),
                      //             //   child: Container(
                      //             //       width: 42,
                      //             //       height: 42,
                      //             //       decoration: BoxDecoration(
                      //             //         shape: BoxShape.circle,
                      //             //         color: Colors.white,
                      //             //       ),
                      //             //       child: Padding(
                      //             //         padding: const EdgeInsets.all(8.0),
                      //             //         child: Image.asset(
                      //             //           "assets/images/first.png",
                      //             //           height: 40,
                      //             //           width: 40,
                      //             //         ),
                      //             //       )),
                      //             // ),
                                  PopupMenuButton<SampleItem>(
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
                                                  userListAddReportController
                                                      .editItem(index, context);
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
                                                    userListAddReportController
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
                                  )
                                ],
                              ),
                      //         SizedBox(
                      //           height: 10,
                      //         ),
                      //         Image.asset("assets/images/college.png"),
                      //         Padding(
                      //           padding:
                      //               const EdgeInsets.only(top: 10, left: 1),
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 "3 Hospital",
                      //                 style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontWeight: FontWeight.normal,
                      //                     fontSize: 18),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/FacilitiesListView');
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => FacilitiesListView(
                          //               containers: [],
                          //             )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffEAEAEB),
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.only(left: 2, right: 10, top: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  // Icon(
                                  //   Icons.add,
                                  //   size: 100,
                                  //   color: Colors.blue,
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Text(
                                  //   TranslationService.translate(
                                  //       'Add Facility'),
                                  //   // "Add Facility",
                                  //   style: TextStyle(
                                  //       color: Colors.blue,
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 18),
                                  // ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      facilityCardDetailsController.addField(
                                          "Lab", "img_1.jpg");
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           DynamicFormScreen()),
                                      // );
                                    },
                                    child: Text("Add Field"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )*/
class Reportsmodel {
  late String Image;
  late String Name;
  late String title;

  Reportsmodel({
    required this.Image,
    required this.Name,
    required this.title,
  });
}

// class Product {
//   final int id;
//   final String image;
//   final String name;
//   final String icon;
//   final String title;
//
//   Product(
//     this.image,
//     this.name,
//     this.icon,
//     this.title,
//     this.id,
//   );
//
//   List<Product> product = [
//     Product(
//         image: "assets/image/",
//         name: "Facilityies",
//         icon: Icon(Icons.abc),
//         title: "",
//         id: 1)
//   ];
// }
//   Column(children: [
// SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: ,
//       children: [
//         Row(
//           children: [
//
//               Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   padding:
//                       EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         "assets/images/$i.png",
//                         height: 40,
//                         width: 40,
//                       ),
//                       Text(
//                         "Hospital",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ))
//           ],
//         ),
//         Row(
//           children: [
//             for (int i = 1; i < 2; i++)
//               Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   padding:
//                       EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         "assets/images/$i.png",
//                         height: 40,
//                         width: 40,
//                       ),
//                       Text(
//                         "Hospital",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ))
//           ],
//         ),
//       ],
//     )

//         Padding(
//   padding: const EdgeInsets.only(top: 60, left: 10),
//   child: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Column(
//       children: [
//         Row(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 80,
//                   width: 200,
//                   // You can set width of container here
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1.0, color: Colors.black),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 const FacilitiesListView()),
//                       );
//                     },
//                     child: Padding(
//                       // Following padding to give space around the icon and text
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Row(
//                         // mainAxisSize: MainAxisSize.min,
//                         // mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: 60,
//                             height: 60,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     width: 1, color: Colors.black)),
//                             child: Image.asset(
//                               'assets/images/hospitalimg.png',
//                             ),
//                           ),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Text(
//                             "Hospital",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: 80,
//                   width: 200,
//                   // You can set width of container here
//                   decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     // Following padding to give space around the icon and text
//                     padding: const EdgeInsets.only(left: 5),
//                     child: Row(
//                       // mainAxisSize: MainAxisSize.min,
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 1, color: Colors.black)),
//                           child: Image.asset(
//                             'assets/images/Autdiotorium.png',
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Autdiotorium",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: 10,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 80,
//                   width: 200,
//                   // You can set width of container here
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1.0, color: Colors.black),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     // Following padding to give space around the icon and text
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Row(
//                       // mainAxisSize: MainAxisSize.min,
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 1, color: Colors.black)),
//                           child: Image.asset(
//                             'assets/images/hospitalimg.png',
//                           ),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           "College",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: 80,
//                   width: 200,
//                   // You can set width of container here
//                   decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     // Following padding to give space around the icon and text
//                     padding: const EdgeInsets.only(left: 5),
//                     child: Row(
//                       // mainAxisSize: MainAxisSize.min,
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 1, color: Colors.black)),
//                           child: Image.asset(
//                             'assets/images/Autdiotorium.png',
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "School",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: 10,
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// )
