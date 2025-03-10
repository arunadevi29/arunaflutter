import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../CommenFiles/translateService.dart';
import '../../FacilityAddListItems/view/Facility_add_List_items.dart';
import '../../FacilityCardDetails/view/Facilities_Screen.dart';
import '../../FacilityDetails/View/FacilityDetails.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class FacilitiesListView extends StatefulWidget {
  // final List<Widget> Autdiotorium;
  // final List<Widget> School;
  // final List<Widget> College;

  FacilitiesListView({
    super.key,
  });

  @override
  State<FacilitiesListView> createState() => _FacilitiesListViewState();
}

class _FacilitiesListViewState extends State<FacilitiesListView> {
  SampleItem? selectedItem;

  @override
  initState() {
    facilityCardListviewController..fieldstategetApi();
    fetchData();
    super.initState();
  }

  void fetchData({String? query}) async {
    setState(() => facilityCardListviewController.Loading = true);
    try {
      final data =
          await facilityCardListviewController.fieldstategetApi(query: query);
      setState(() {
        facilityCardListviewController.fieldstateData = data;
        facilityCardListviewController.Loading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => facilityCardListviewController.Loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              children: [
                Text(
                  TranslationService.translate('Field State'),
                  // "Facility",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
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
          ),
          // IconButton(
          //   icon: const Icon(
          //     Icons.add,
          //     size: 40,
          //     color: Color(0xff0066FF),
          //   ),
          //   //tooltip: 'Setting Icon',
          //   onPressed: () {
          //     Get.toNamed('/FacilityAddListItems');
          //
          //     // Navigator.of(context).push(
          //     //   MaterialPageRoute(
          //     //       builder: (context) => ShiftTimeFromScreen()),
          //     // );
          //   },
          // ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FacilitiesScreen()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: facilityCardListviewController.searchController,
              decoration: InputDecoration(
                labelText: TranslationService.translate("Search"),
                border: OutlineInputBorder(),
                suffixIcon: facilityCardListviewController
                        .searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          facilityCardListviewController.searchController
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FacilityAddListItems()));
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
                        TranslationService.translate('Add Field State'),
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
          facilityCardListviewController.Loading
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
              //             childAspectRatio: 0.95,
              //             padding: EdgeInsets.all(18.0),
              //             crossAxisSpacing: 10,
              //             mainAxisSpacing: 10,
              //             children: facilityCardListviewController
              //                 .fieldstateData.entries
              //                 .expand(
              //                   (entry) => entry.value.map(
              //                     (site) => GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                             context,
              //                             MaterialPageRoute(
              //                                 builder: (context) => Facilitydetails(
              //                                       FieldSite:
              //                                           facilityAddListItemsController
              //                                               .FieldSiteNameController
              //                                               .text
              //                                               .toString(),
              //                                       // ContractorName:
              //                                       //     ContractorNameController.text.toString(),
              //                                       Latitude:
              //                                           facilityAddListItemsController
              //                                               .lat
              //                                               .toString(),
              //                                       Longitude:
              //                                           facilityAddListItemsController
              //                                               .long
              //                                               .toString(),
              //                                       Proximity:
              //                                           facilityAddListItemsController
              //                                               .distance
              //                                               .toString(),
              //                                       SiteHead:
              //                                           facilityCardListviewController
              //                                               .Siteheadname,
              //                                       MobileNo:
              //                                           facilityAddListItemsController
              //                                               .MobileNumberController
              //                                               .text
              //                                               .toString(),
              //                                     )));
              //                       },
              //                       child: Card(
              //                           elevation: 5,
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius: BorderRadius.circular(15),
              //                           ),
              //                           color: Colors.blue,
              //                           child: ListTile(
              //                             title: Column(
              //                                 // mainAxisSize: MainAxisSize.max,
              //                                 children: [
              //                                   Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment
              //                                             .spaceBetween,
              //                                     // Push items apart
              //                                     children: [
              //                                       Expanded(
              //                                         // Prevent overflow of long text
              //                                         child: Text(
              //                                           site.fieldName,
              //                                           style: TextStyle(
              //                                               fontSize: 18,
              //                                               color: Colors.white,
              //                                               fontWeight:
              //                                                   FontWeight.bold),
              //                                         ),
              //                                       ),
              //                                       PopupMenuButton<SampleItem>(
              //                                         initialValue: selectedItem,
              //                                         onSelected:
              //                                             (SampleItem item) {
              //                                           setState(() {
              //                                             selectedItem = item;
              //                                           });
              //                                         },
              //                                         itemBuilder:
              //                                             (BuildContext context) =>
              //                                                 <PopupMenuEntry<
              //                                                     SampleItem>>[
              //                                           PopupMenuItem<SampleItem>(
              //                                             value: SampleItem.itemOne,
              //                                             child: Row(
              //                                               children: [
              //                                                 TextButton(
              //                                                     onPressed: () {
              //                                                       facilityCardListviewController.editFieldstate(
              //                                                           context,
              //                                                           site.id,
              //                                                           site.fieldName,
              //                                                           site.latitude,
              //                                                           site.longitude,
              //                                                           site.proximity,
              //                                                           site.headName,
              //                                                           site.mobileNumber,
              //                                                           site.fieldImage);
              //                                                       // facilityCardListviewController
              //                                                       //     .fieldstateUpdateapi(
              //                                                       //         id);
              //                                                     },
              //                                                     child: Text(
              //                                                       "Edit",
              //                                                       style: TextStyle(
              //                                                           fontSize:
              //                                                               18,
              //                                                           color: Colors
              //                                                               .black,
              //                                                           fontWeight:
              //                                                               FontWeight
              //                                                                   .normal),
              //                                                     ))
              //                                               ],
              //                                             ),
              //                                           ),
              //                                           PopupMenuItem<SampleItem>(
              //                                             value: SampleItem.itemTwo,
              //                                             child: Row(
              //                                               children: [
              //                                                 TextButton(
              //                                                     onPressed: () {
              //                                                       setState(() {
              //                                                         // userListAddContractorController
              //                                                         //     .foundUsers
              //                                                         //     .removeAt(index);
              //                                                       });
              //                                                     },
              //                                                     child: Text(
              //                                                       "Remove",
              //                                                       style: TextStyle(
              //                                                           fontSize:
              //                                                               18,
              //                                                           color: Colors
              //                                                               .black,
              //                                                           fontWeight:
              //                                                               FontWeight
              //                                                                   .normal),
              //                                                     ))
              //                                               ],
              //                                             ),
              //                                           ),
              //                                           PopupMenuItem<SampleItem>(
              //                                             value: SampleItem.itemTwo,
              //                                             child: Row(
              //                                               children: [
              //                                                 TextButton(
              //                                                     onPressed: () {
              //                                                       setState(() {
              //                                                         // facilityCardDetailsController
              //                                                         //     .isDisabled
              //                                                         //     ? null // Disable button if item is in disabled list
              //                                                         //     : () =>
              //                                                         //     facilityCardDetailsController
              //                                                         //         .disableItem(
              //                                                         //       site.id,
              //                                                         //     );
              //                                                       });
              //                                                     },
              //                                                     child: Text(
              //                                                       "Disable",
              //                                                       style: TextStyle(
              //                                                           fontSize:
              //                                                               18,
              //                                                           color: Colors
              //                                                               .black,
              //                                                           fontWeight:
              //                                                               FontWeight
              //                                                                   .normal),
              //                                                     ))
              //                                               ],
              //                                             ),
              //                                           ),
              //                                         ],
              //                                       )
              //                                     ],
              //                                   ),
              //                                   SizedBox(
              //                                     height: 20,
              //                                   ),
              //                                   Image.asset(
              //                                     "assets/images/h2.png",
              //
              //                                     // height: 100,
              //                                     // width: 120,
              //                                   ),
              //                                   SizedBox(
              //                                     height: 20,
              //                                   ),
              //                                   //   Row(
              //                                   //     children: [
              //                                   //       Text(" Count: ${site.count}"),
              //                                   //     ],
              //                                   //   ),
              //                                   // ],
              //                                 ]),
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
                      children: facilityCardListviewController
                          .fieldstateData.entries
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
                                                      builder:
                                                          (context) =>
                                                              Facilitydetails(
                                                                FieldSite: facilityAddListItemsController
                                                                    .FieldSiteNameController
                                                                    .text
                                                                    .toString(),
                                                                // ContractorName:
                                                                //     ContractorNameController.text.toString(),
                                                                Latitude:
                                                                    facilityAddListItemsController
                                                                        .lat
                                                                        .toString(),
                                                                Longitude:
                                                                    facilityAddListItemsController
                                                                        .long
                                                                        .toString(),
                                                                Proximity:
                                                                    facilityAddListItemsController
                                                                        .distance
                                                                        .toString(),
                                                                SiteHead:
                                                                    facilityCardListviewController
                                                                        .Siteheadname,
                                                                MobileNo: facilityAddListItemsController
                                                                    .MobileNumberController
                                                                    .text
                                                                    .toString(),
                                                              )));
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
                                                      site.fieldName,
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
                                                              .add(site
                                                                  .id); // Disable item
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
                                                                facilityCardListviewController
                                                                    .Cleaner();
                                                                facilityCardListviewController.editFieldstate(
                                                                    context,
                                                                    site.id
                                                                        .toString(),
                                                                    site.fieldName,
                                                                    site.latitude,
                                                                    site.longitude,
                                                                    site.proximity,
                                                                    site.headName,
                                                                    site.mobileNumber,
                                                                    site.fieldImage);
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
                                              // Row(
                                              //   children: [
                                              //     Text(
                                              //       "Count: ${site.fieldId}",
                                              //       style: TextStyle(
                                              //           fontSize: 16,
                                              //           fontWeight:
                                              //               FontWeight.bold),
                                              //     ),
                                              //   ],
                                              // ),
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
        ],
      ),
    );
  }
}

// class Product {
//   final String Hospital;
//   final String Autdiotorium;
//   final String School;
//   final String College;
//
//   Product(this.Hospital, this.Autdiotorium, this.School, this.College,
//       {required String Hospital},);
// }
// GridView.builder(
// itemCount: _index + 1,
// itemBuilder: (BuildContext context, int index) {},
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2),
// )
// Column(
//   children: [
//     ScrollNotificationObserver(
//       child: Expanded(
//         child: ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             itemCount: facilityCardListviewController.index + 1,
//             // itemCount: _strings.length,
//             itemBuilder: (context, index) {
//               return GridView.count(
//                   shrinkWrap: true,
//                   childAspectRatio: 0.85,
//                   padding: EdgeInsets.all(25.0),
//                   crossAxisCount: 2,
//                   children: [
//                     // for (int i = 1; i < 5; i++)
//
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     FacilityAddListItems()));
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Color(0xffEAEAEB),
//                             borderRadius: BorderRadius.circular(20)),
//                         padding:
//                             EdgeInsets.only(left: 15, right: 15, top: 10),
//                         margin: EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 5),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "GH",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 75,
//                                   ),
//                                   child: PopupMenuButton<SampleItem>(
//                                     initialValue: selectedItem,
//                                     onSelected: (SampleItem item) {
//                                       setState(() {
//                                         selectedItem = item;
//                                       });
//                                     },
//                                     itemBuilder: (BuildContext context) =>
//                                         <PopupMenuEntry<SampleItem>>[
//                                       PopupMenuItem<SampleItem>(
//                                         value: SampleItem.itemOne,
//                                         child: Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   // userListAddReportController
//                                                   //     .editItem(
//                                                   //         index, context);
//                                                   // showAlertDialog(context);
//                                                 },
//                                                 child: Text(
//                                                   "Edit",
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight
//                                                               .normal),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                       PopupMenuItem<SampleItem>(
//                                         value: SampleItem.itemTwo,
//                                         child: Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   setState(() {
//                                                     userListAddReportController
//                                                         .foundUsers
//                                                         .removeAt(index);
//                                                   });
//                                                 },
//                                                 child: Text(
//                                                   "Remove",
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight
//                                                               .normal),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                       PopupMenuItem<SampleItem>(
//                                         value: SampleItem.itemTwo,
//                                         child: Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   setState(() {});
//                                                 },
//                                                 child: Text(
//                                                   "Disable",
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight
//                                                               .normal),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Center(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Color(0xffEAEAEB),
//                                     borderRadius:
//                                         BorderRadius.circular(50)),
//                                 height: 100,
//                                 width: 150,
//                                 child: Image.asset(
//                                   "assets/images/h1.png",
//                                   height: 100,
//                                   width: 120,
//                                 ),
//                               ),
//                             ),
//                             // Padding(
//                             //   padding: const EdgeInsets.only(right: 120),
//                             //   child: Switch(
//                             //       value: facilityCardListviewController
//                             //           .isSwitched,
//                             //       onChanged: (value) {
//                             //         setState(() {
//                             //           facilityCardListviewController
//                             //               .isSwitched = value;
//                             //         });
//                             //       }),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     FacilityAddListItems()));
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Color(0xffEAEAEB),
//                             borderRadius: BorderRadius.circular(20)),
//                         padding:
//                             EdgeInsets.only(left: 15, right: 15, top: 10),
//                         margin: EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 5),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Be Well",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 40,
//                                   ),
//                                   child: PopupMenuButton<SampleItem>(
//                                     initialValue: selectedItem,
//                                     onSelected: (SampleItem item) {
//                                       setState(() {
//                                         selectedItem = item;
//                                       });
//                                     },
//                                     itemBuilder: (BuildContext context) =>
//                                         <PopupMenuEntry<SampleItem>>[
//                                       PopupMenuItem<SampleItem>(
//                                         value: SampleItem.itemOne,
//                                         child: Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   // userListAddReportController
//                                                   //     .editItem(
//                                                   //         index, context);
//                                                   // showAlertDialog(context);
//                                                 },
//                                                 child: Text(
//                                                   "Edit",
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight
//                                                               .normal),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                       PopupMenuItem<SampleItem>(
//                                         value: SampleItem.itemTwo,
//                                         child: Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   setState(() {
//                                                     userListAddReportController
//                                                         .foundUsers
//                                                         .removeAt(index);
//                                                   });
//                                                 },
//                                                 child: Text(
//                                                   "Remove",
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight
//                                                               .normal),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                       PopupMenuItem<SampleItem>(
//                                         value: SampleItem.itemTwo,
//                                         child: Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   setState(() {});
//                                                 },
//                                                 child: Text(
//                                                   "Disable",
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight
//                                                               .normal),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                                 // Switch(
//                                 //     value: facilityCardListviewController
//                                 //         .isSwitched,
//                                 //     onChanged: (value) {
//                                 //       setState(() {
//                                 //         facilityCardListviewController
//                                 //             .isSwitched = value;
//                                 //       });
//                                 //     }),
//                               ],
//                             ),
//                             Center(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Color(0xffEAEAEB),
//                                     borderRadius:
//                                         BorderRadius.circular(50)),
//                                 height: 100,
//                                 width: 150,
//                                 child: Image.asset(
//                                   "assets/images/h2.png",
//                                   height: 100,
//                                   width: 120,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     FacilityAddListItems()));
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Color(0xffEAEAEB),
//                             borderRadius: BorderRadius.circular(20)),
//                         padding:
//                             EdgeInsets.only(left: 15, right: 15, top: 10),
//                         margin: EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 5),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Appolo",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 40,
//                                   ),
//                                   child: PopupMenuButton<SampleItem>(
//                                     initialValue: selectedItem,
//                                     onSelected: (SampleItem item) {
//                                       setState(() {
//                                         selectedItem = item;
//                                       });
//                                     },
//                                     itemBuilder: (BuildContext context) =>
//                                         <PopupMenuEntry<SampleItem>>[
//                                       PopupMenuItem<SampleItem>(
//                                         value: SampleItem.itemOne,
//                                         child: Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   // userListAddReportController
//                                                   //     .editItem(
//                                                   //         index, context);
//                                                   // showAlertDialog(context);
//                                                 },
//                                                 child: Text(
//                                                   "Edit",
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight
//                                                               .normal),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                       PopupMenuItem<SampleItem>(
//                                         value: SampleItem.itemTwo,
//                                         child: Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   setState(() {
//                                                     userListAddReportController
//                                                         .foundUsers
//                                                         .removeAt(index);
//                                                   });
//                                                 },
//                                                 child: Text(
//                                                   "Remove",
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight
//                                                               .normal),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                       PopupMenuItem<SampleItem>(
//                                         value: SampleItem.itemTwo,
//                                         child: Row(
//                                           children: [
//                                             TextButton(
//                                                 onPressed: () {
//                                                   setState(() {});
//                                                 },
//                                                 child: Text(
//                                                   "Disable",
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight
//                                                               .normal),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                                 // Switch(
//                                 //     value: facilityCardListviewController
//                                 //         .isSwitched,
//                                 //     onChanged: (value) {
//                                 //       setState(() {
//                                 //         facilityCardListviewController
//                                 //             .isSwitched = value;
//                                 //       });
//                                 //     }),
//                               ],
//                             ),
//                             Center(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Color(0xffEAEAEB),
//                                     borderRadius:
//                                         BorderRadius.circular(50)),
//                                 height: 100,
//                                 width: 150,
//                                 child: Image.asset(
//                                   "assets/images/h3.png",
//                                   height: 100,
//                                   width: 120,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.of(context).push(
//                         //   MaterialPageRoute(
//                         //       builder: (context) => FacilitiesListView(
//                         //             containers: [],
//                         //           )),
//                         //);
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.blue[100],
//                             borderRadius: BorderRadius.circular(20)),
//                         height: 90,
//                         width: 150,
//                         padding:
//                             EdgeInsets.only(left: 15, right: 15, top: 10),
//                         margin: EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 5),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 // if (facilityCardListviewController.index <
//                                 //     facilityCardListviewController
//                                 //             .Hospital.length -
//                                 //         1) {
//                                 //   facilityCardListviewController.index++;
//                                 // }
//                               },
//                               child: Icon(
//                                 Icons.add,
//                                 size: 80,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               TranslationService.translate(
//                                   'Add Hospital'),
//                               // "Add Hospital",
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ]);
//             }),
//       ),
//     ),
//     // Column(
//     //   children: [
//     //     Row(
//     //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //       children: [
//     //         ElevatedButton(
//     //           style: ElevatedButton.styleFrom(
//     //             padding: EdgeInsets.symmetric(horizontal: 65),
//     //             backgroundColor: Color(0xff0056f1),
//     //             // side: BorderSide(color: Colors.yellow, width: 5),
//     //
//     //             textStyle: const TextStyle(
//     //               fontSize: 20,
//     //               fontStyle: FontStyle.normal,
//     //             ),
//     //             shape: RoundedRectangleBorder(
//     //                 borderRadius: BorderRadius.all(Radius.circular(10))),
//     //           ),
//     //           onPressed: () {
//     //             setState(
//     //               () {
//     //                 if (_index < FirstList.length - 1) {
//     //                   _index++;
//     //                 }
//     //               },
//     //             );
//     //           },
//     //           child: Text(
//     //             'Add',
//     //             style: TextStyle(
//     //                 color: Colors.white,
//     //                 fontWeight: FontWeight.normal,
//     //                 fontSize: 20),
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //   ],
//     // ),
//
//     SizedBox(
//       height: 20,
//     ),
//   ],
// ),
