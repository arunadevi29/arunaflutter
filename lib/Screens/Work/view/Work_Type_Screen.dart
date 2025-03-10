import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/getXcontroller.dart';
import '../../../demo.dart';
import '../../AddWorkType/view/AddWorkTypescreen.dart';
import '../../Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class WorkTypeScreen extends StatefulWidget {
  const WorkTypeScreen({super.key});

  @override
  State<WorkTypeScreen> createState() => _WorkTypeScreenState();
}

class _WorkTypeScreenState extends State<WorkTypeScreen> {
  @override
  SampleItem? selectedItem;

  @override
  void initState() {
    super.initState();
    addWorkTypeController.workgetapi();
    fetchData();
  }

  void fetchData({String? query}) async {
    setState(() => addWorkTypeController.Loading = true);
    try {
      final data = await addWorkTypeController.workgetapi(query: query);
      setState(() {
        addWorkTypeController.workData = data;
        addWorkTypeController.Loading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => addWorkTypeController.Loading = false);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              children: [
                Text(
                  TranslationService.translate("Work Type"),
                  // "Work Type",
                  style: TextStyle(
                      fontSize: 20,
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
          )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
          //tooltip: 'Setting Icon',
          onPressed: () {
            //Get.toNamed('/Siteheaddashboard');
            Get.toNamed('/Admindashboard');
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => Admin_Dashboard()),
            // );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: addWorkTypeController.searchController,
              decoration: InputDecoration(
                labelText: TranslationService.translate("Search"),
                border: OutlineInputBorder(),
                suffixIcon:
                    addWorkTypeController.searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              addWorkTypeController.searchController.clear();
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
                        builder: (context) => AddWorkTypeScreen()));
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
                        TranslationService.translate('Add Work Type'),
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
          addWorkTypeController.Loading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(18.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        childAspectRatio: 0.78, // Aspect ratio of grid items
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: addWorkTypeController.workData.entries
                          .expand((entry) => entry.value)
                          .length,
                      // Total number of items
                      itemBuilder: (context, index) {
                        var sites = addWorkTypeController.workData.entries
                            .expand((entry) => entry.value)
                            .toList(); // Flatten the list
                        var site = sites[index]; // Get the specific item

                        return GestureDetector(
                          onTap: () {
                            //Get.toNamed('/FacilitiesListView');
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Color(0xffEAEAEB),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${site.workType}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      PopupMenuButton<String>(
                                        onSelected: (value) {
                                          if (value == "edit") {
                                            addWorkTypeController.editFacility(
                                                context,
                                                site.id,
                                                site.workType);
                                          } else if (value == "remove") {
                                            setState(() {
                                              addWorkTypeController
                                                  .deleteWork(site.id);
                                            });
                                          } else if (value == "disable") {
                                            setState(() {
                                              // facilityCardDetailsController
                                              //     .disableItem(site.id);
                                            });
                                          }
                                        },
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: "edit",
                                            child: Text("Edit"),
                                          ),
                                          PopupMenuItem(
                                            value: "remove",
                                            child: Text("Remove"),
                                          ),
                                          PopupMenuItem(
                                            value: "disable",
                                            child: Text("Disable"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Image.asset("assets/images/security.png"),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        '${addWorkTypeController.workData.entries.expand((entry) => entry.value).length} Shift',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
// Expanded(
//         child: ListView(
//           children:
//               addWorkTypeController.workData.entries.map((entry) {
//             return Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       entry.key,
//                       style: TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   ...entry.value.map((site) => Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ListTile(
//                             leading: CircleAvatar(
//                               radius: 30,
//                               backgroundImage: AssetImage(
//                                 "assets/images/boy.png",
//                               ),
//                             ),
//                             title: Text(
//                               TranslationService.translate(
//                                   "${site.id} ${site.workType}"),
//                             ),
//
//                             // subtitle: Text("${site.field}"
//                             //     "\n${site.fieldSiteName}"),
//                             // isThreeLine: true,
//                             trailing: Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 10, left: 13),
//                                 child: PopupMenuButton<SampleItem>(
//                                     initialValue: selectedItem,
//                                     onSelected: (SampleItem item) {
//                                       setState(() {
//                                         selectedItem = item;
//                                       });
//                                     },
//                                     itemBuilder: (BuildContext
//                                             context) =>
//                                         <PopupMenuEntry<SampleItem>>[
//                                           PopupMenuItem<SampleItem>(
//                                             value: SampleItem.itemOne,
//                                             child: Row(
//                                               children: [
//                                                 TextButton(
//                                                     onPressed: () {
//                                                       // userListSiteHeaderController
//                                                       //     .editsitehead(
//                                                       //     context,
//                                                       //     site.id,
//                                                       //     site.firstName,
//                                                       //
//                                                       // );
//                                                     },
//                                                     child: Text(
//                                                       TranslationService
//                                                           .translate(
//                                                               "Edit"),
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
//                                                         // hospitals.removeAt(index);
//                                                       });
//                                                     },
//                                                     child: Text(
//                                                       TranslationService
//                                                           .translate(
//                                                               "Remove"),
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
//                                                       setState(() {});
//                                                     },
//                                                     child: Text(
//                                                       TranslationService
//                                                           .translate(
//                                                               "Disable"),
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
//                                           )
//                                         ]))),
//                       ))
//                 ]);
//           }).toList(),
//         ),
//       ),
// Column(
//   children: [
//     ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemCount: 1,
//         // itemCount: _strings.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: GridView(
//               physics: ScrollPhysics(),
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               gridDelegate:
//                   const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisExtent: 190,
//                       crossAxisSpacing: 5.0,
//                       mainAxisSpacing: 5.0),
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => FacilitiesListView(
//                     //           containers: [],
//                     //         )));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Color(0xffEAEAEB),
//                         borderRadius: BorderRadius.circular(20)),
//                     // height: 90,
//                     // width: 150,
//                     padding:
//                         EdgeInsets.only(left: 15, right: 15, top: 10),
//                     margin:
//                         EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Text(
//                                 "House\nKeeping",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18),
//                               ),
//                             ),
//                             // Container(
//                             //     width: 42,
//                             //     height: 42,
//                             //     decoration: BoxDecoration(
//                             //       shape: BoxShape.circle,
//                             //       color: Colors.white,
//                             //     ),
//                             //     child: Padding(
//                             //       padding: const EdgeInsets.all(8.0),
//                             //       child: Image.asset(
//                             //         "assets/images/w1.png",
//                             //       ),
//                             //     )),
//                             PopupMenuButton<SampleItem>(
//                               initialValue: selectedItem,
//                               onSelected: (SampleItem item) {
//                                 setState(() {
//                                   selectedItem = item;
//                                 });
//                               },
//                               itemBuilder: (BuildContext context) =>
//                                   <PopupMenuEntry<SampleItem>>[
//                                 PopupMenuItem<SampleItem>(
//                                   value: SampleItem.itemOne,
//                                   child: Row(
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {
//                                             // userListAddReportController
//                                             //     .editItem(index, context);
//                                             // showAlertDialog(context);
//                                           },
//                                           child: Text(
//                                             "Edit",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                     FontWeight.normal),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 PopupMenuItem<SampleItem>(
//                                   value: SampleItem.itemTwo,
//                                   child: Row(
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               userListAddReportController
//                                                   .foundUsers
//                                                   .removeAt(index);
//                                             });
//                                           },
//                                           child: Text(
//                                             "Remove",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                     FontWeight.normal),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 PopupMenuItem<SampleItem>(
//                                   value: SampleItem.itemTwo,
//                                   child: Row(
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {
//                                             setState(() {});
//                                           },
//                                           child: Text(
//                                             "Disable",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                     FontWeight.normal),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.only(top: 50, left: 1),
//                           child: Row(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "3 Shifts",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: 18),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => FacilitiesListView(
//                     //           containers: [],
//                     //         )));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Color(0xffEAEAEB),
//                         borderRadius: BorderRadius.circular(20)),
//                     height: 90,
//                     width: 150,
//                     padding:
//                         EdgeInsets.only(left: 15, right: 15, top: 10),
//                     margin:
//                         EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Gardener",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18),
//                             ),
//                             // Container(
//                             //     width: 42,
//                             //     height: 42,
//                             //     decoration: BoxDecoration(
//                             //       shape: BoxShape.circle,
//                             //       color: Colors.white,
//                             //     ),
//                             //     child: Padding(
//                             //       padding: const EdgeInsets.all(8.0),
//                             //       child: Image.asset(
//                             //         "assets/images/w2.png",
//                             //       ),
//                             //     )),
//                             PopupMenuButton<SampleItem>(
//                               initialValue: selectedItem,
//                               onSelected: (SampleItem item) {
//                                 setState(() {
//                                   selectedItem = item;
//                                 });
//                               },
//                               itemBuilder: (BuildContext context) =>
//                                   <PopupMenuEntry<SampleItem>>[
//                                 PopupMenuItem<SampleItem>(
//                                   value: SampleItem.itemOne,
//                                   child: Row(
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {
//                                             // userListAddReportController
//                                             //     .editItem(index, context);
//                                             // showAlertDialog(context);
//                                           },
//                                           child: Text(
//                                             "Edit",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                     FontWeight.normal),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 PopupMenuItem<SampleItem>(
//                                   value: SampleItem.itemTwo,
//                                   child: Row(
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               userListAddReportController
//                                                   .foundUsers
//                                                   .removeAt(index);
//                                             });
//                                           },
//                                           child: Text(
//                                             "Remove",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                     FontWeight.normal),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 PopupMenuItem<SampleItem>(
//                                   value: SampleItem.itemTwo,
//                                   child: Row(
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {
//                                             setState(() {});
//                                           },
//                                           child: Text(
//                                             "Disable",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                     FontWeight.normal),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.only(top: 60, left: 1),
//                           child: Row(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "3 Shifts",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: 18),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => FacilitiesListView(
//                     //           containers: [],
//                     //         )));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Color(0xffEAEAEB),
//                         borderRadius: BorderRadius.circular(20)),
//                     height: 90,
//                     width: 150,
//                     padding:
//                         EdgeInsets.only(left: 15, right: 15, top: 10),
//                     margin:
//                         EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Security",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18),
//                             ),
//                             PopupMenuButton<SampleItem>(
//                               initialValue: selectedItem,
//                               onSelected: (SampleItem item) {
//                                 setState(() {
//                                   selectedItem = item;
//                                 });
//                               },
//                               itemBuilder: (BuildContext context) =>
//                                   <PopupMenuEntry<SampleItem>>[
//                                 PopupMenuItem<SampleItem>(
//                                   value: SampleItem.itemOne,
//                                   child: Row(
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {
//                                             // userListAddReportController
//                                             //     .editItem(index, context);
//                                             // showAlertDialog(context);
//                                           },
//                                           child: Text(
//                                             "Edit",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                     FontWeight.normal),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 PopupMenuItem<SampleItem>(
//                                   value: SampleItem.itemTwo,
//                                   child: Row(
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               userListAddReportController
//                                                   .foundUsers
//                                                   .removeAt(index);
//                                             });
//                                           },
//                                           child: Text(
//                                             "Remove",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                     FontWeight.normal),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 PopupMenuItem<SampleItem>(
//                                   value: SampleItem.itemTwo,
//                                   child: Row(
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {
//                                             setState(() {});
//                                           },
//                                           child: Text(
//                                             "Disable",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                     FontWeight.normal),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             )
//                             // Container(
//                             //     width: 42,
//                             //     height: 42,
//                             //     decoration: BoxDecoration(
//                             //       shape: BoxShape.circle,
//                             //       color: Colors.white,
//                             //     ),
//                             //     child: Padding(
//                             //       padding: const EdgeInsets.all(8.0),
//                             //       child: Image.asset(
//                             //         "assets/images/location.png",
//                             //       ),
//                             //     )),
//                           ],
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.only(top: 60, left: 1),
//                           child: Row(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "3 Shifts",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: 18),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Colors.blue[100],
//                       borderRadius: BorderRadius.circular(20)),
//                   height: 90,
//                   width: 150,
//                   padding: EdgeInsets.only(left: 15, right: 15, top: 10),
//                   margin:
//                       EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                   child: Column(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Get.toNamed('/AddWorkTypeScreen');
//                           // Navigator.of(context).push(
//                           //   MaterialPageRoute(
//                           //       builder: (context) => AddWorkTypeScreen()),
//                           // );
//                           // if (_index < Hospital.length - 1) {
//                           //   _index++;
//                           // }
//                         },
//                         child: Icon(
//                           Icons.add,
//                           size: 80,
//                           color: Colors.blue,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             TranslationService.translate('Add Work'),
//                             // "Add Work Type",
//                             style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                           Text(
//                             TranslationService.translate('Type'),
//                             // "Add Work Type",
//                             style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         })
//     // Text("data")
//   ],
// ),
