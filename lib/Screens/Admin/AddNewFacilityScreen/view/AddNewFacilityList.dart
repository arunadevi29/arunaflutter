// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../../CommenFiles/getXcontroller.dart';
// import '../../../../CommenFiles/translateService.dart';
//
// import '../../AddNewFieldScreen/view/AddNewFieldList.dart';
// import '../../FacilityCardListview/view/Facilities_Card_Items.dart';
// import 'AddNewFacilityScreen.dart';
//
// enum SampleItem { itemOne, itemTwo, itemThree }
//
// class Addnewfacilitylist extends StatefulWidget {
//   const Addnewfacilitylist({super.key});
//
//   @override
//   State<Addnewfacilitylist> createState() => _AddnewfacilitylistState();
// }
//
// class _AddnewfacilitylistState extends State<Addnewfacilitylist> {
//   @override
//   SampleItem? selectedItem;
//
//   @override
//   initState() {
//     facilityCardListviewController..fieldstategetApi();
//     fetchData();
//     super.initState();
//   }
//
//   void fetchData({String? query}) async {
//     setState(() => facilityCardListviewController.Loading = true);
//     try {
//       final data =
//           await facilityCardListviewController.fieldstategetApi(query: query);
//       setState(() {
//         facilityCardListviewController.fieldstateData = data;
//         facilityCardListviewController.Loading = false;
//       });
//     } catch (e) {
//       print("Error: $e");
//       setState(() => facilityCardListviewController.Loading = false);
//     }
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Text(
//               TranslationService.translate('Facility'),
//               // "Facility",
//               style: TextStyle(
//                   fontSize: 25,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: DropdownButton(
//                 underline: SizedBox(),
//                 icon: Icon(
//                   Icons.language,
//                   color: Colors.blue,
//                   size: 35,
//                 ),
//                 items: const [
//                   DropdownMenuItem(
//                       value: "en",
//                       child: Text(
//                         'English',
//                         style: TextStyle(color: Colors.black, fontSize: 18),
//                       )),
//                   DropdownMenuItem(
//                       value: "ka",
//                       child: Text(
//                         'Kannada',
//                         style: TextStyle(color: Colors.black, fontSize: 18),
//                       )),
//                 ],
//                 onChanged: (value) {
//                   controller.setLocale(value);
//                 }),
//           )
//         ],
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             size: 25,
//           ),
//           //tooltip: 'Setting Icon',
//           onPressed: () {
//             // Get.toNamed('/Siteheaddashboard');
//             Get.toNamed('/Admindashboard');
//             // Navigator.of(context).push(
//             //   MaterialPageRoute(builder: (context) => Admin_Dashboard()),
//             // );
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//                 //controller: facilityCardDetailsController.searchController,
//                 decoration: InputDecoration(
//                   labelText: TranslationService.translate("Search"),
//                   border: OutlineInputBorder(),
//                   suffixIcon: facilityCardListviewController
//                           .searchController.text.isNotEmpty
//                       ? IconButton(
//                           icon: Icon(Icons.search),
//                           onPressed: () {
//                             facilityCardListviewController.searchController
//                                 .clear();
//                           },
//                         )
//                       : null,
//                 ),
//                 onChanged: (query) =>
//                     addnewfacilitycontroller.searchFacility(query)),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => Addnewfacilityscreen()));
//                   },
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.add,
//                         size: 50,
//                         color: Colors.blue,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         TranslationService.translate('Add Facility'),
//                         // "Add Facility",
//                         style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           // Expanded(
//           //     child: GridView.builder(
//           //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           //     crossAxisCount: 2,
//           //     childAspectRatio: 0.78,
//           //
//           //     crossAxisSpacing: 10,
//           //     mainAxisSpacing: 10,
//           //     // crossAxisCount: 2, // Number of columns
//           //     // crossAxisSpacing: 10, // Spacing between columns
//           //     // mainAxisSpacing: 10, // Spacing between rows
//           //     // childAspectRatio: 1, // Aspect ratio of grid items
//           //   ),
//           //   itemCount: addnewfacilitycontroller.filteredList.length,
//           //   itemBuilder: (context, index) {
//           //     var item = addnewfacilitycontroller.filteredList[index];
//           //     return GestureDetector(
//           //       onTap: () {
//           //         Navigator.of(context).push(MaterialPageRoute(
//           //             builder: (context) => Addnewfieldlist()));
//           //       },
//           //       child: Card(
//           //         elevation: 5,
//           //         shape: RoundedRectangleBorder(
//           //           borderRadius: BorderRadius.circular(15),
//           //         ),
//           //         color: Colors.blue,
//           //         child: Padding(
//           //           padding: EdgeInsets.all(8.0),
//           //           child: Column(
//           //             mainAxisAlignment: MainAxisAlignment.start,
//           //             children: [
//           //               Column(
//           //                 children: [
//           //                   Row(
//           //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //                     children: [
//           //                       Expanded(
//           //                         child: Text(
//           //                           addnewfacilitycontroller.facilityList[index]
//           //                               ["FieldName"],
//           //                           style: TextStyle(
//           //                               fontSize: 16,
//           //                               fontWeight: FontWeight.bold,
//           //                               color: Colors.white),
//           //                           textAlign: TextAlign.center,
//           //                         ),
//           //                       ),
//           //                       PopupMenuButton<SampleItem>(
//           //                         initialValue: selectedItem,
//           //                         onSelected: (SampleItem item) {
//           //                           setState(() {
//           //                             selectedItem = item;
//           //                           });
//           //                         },
//           //                         itemBuilder: (BuildContext context) =>
//           //                             <PopupMenuEntry<SampleItem>>[
//           //                           PopupMenuItem<SampleItem>(
//           //                             value: SampleItem.itemOne,
//           //                             child: Row(
//           //                               children: [
//           //                                 TextButton(
//           //                                     onPressed: () {
//           //                                       facilityCardDetailsController
//           //                                           .editFacility(
//           //                                               addnewfacilitycontroller
//           //                                                       .facilityList[
//           //                                                   index]['id'],
//           //                                               addnewfacilitycontroller
//           //                                                       .facilityList[
//           //                                                   index]['filedname'],
//           //                                               addnewfacilitycontroller
//           //                                                       .facilityList[
//           //                                                   index]['filedname'],
//           //                                               addnewfacilitycontroller
//           //                                                       .facilityList[
//           //                                                   index]['filedname']);
//           //                                     },
//           //                                     child: Text(
//           //                                       "Edit",
//           //                                       style: TextStyle(
//           //                                           fontSize: 18,
//           //                                           color: Colors.black,
//           //                                           fontWeight:
//           //                                               FontWeight.normal),
//           //                                     ))
//           //                               ],
//           //                             ),
//           //                           ),
//           //                           PopupMenuItem<SampleItem>(
//           //                             value: SampleItem.itemTwo,
//           //                             child: Row(
//           //                               children: [
//           //                                 TextButton(
//           //                                     onPressed: () {
//           //                                       // setState(() {
//           //                                       //   facilityCardDetailsController
//           //                                       //       .deleteWork(
//           //                                       //       site.id);
//           //                                       // });
//           //                                     },
//           //                                     child: Text(
//           //                                       "Remove",
//           //                                       style: TextStyle(
//           //                                           fontSize: 18,
//           //                                           color: Colors.black,
//           //                                           fontWeight:
//           //                                               FontWeight.normal),
//           //                                     ))
//           //                               ],
//           //                             ),
//           //                           ),
//           //                           PopupMenuItem<SampleItem>(
//           //                             value: SampleItem.itemTwo,
//           //                             child: Row(
//           //                               children: [
//           //                                 TextButton(
//           //                                     onPressed: () {
//           //                                       setState(() {
//           //                                         // facilityCardDetailsController
//           //                                         //     .isDisabled
//           //                                         //     ? null // Disable button if item is in disabled list
//           //                                         //     : () =>
//           //                                         //     facilityCardDetailsController
//           //                                         //         .disableItem(
//           //                                         //       site.id,
//           //                                         //     );
//           //                                       });
//           //                                     },
//           //                                     child: Text(
//           //                                       "Disable",
//           //                                       style: TextStyle(
//           //                                           fontSize: 18,
//           //                                           color: Colors.black,
//           //                                           fontWeight:
//           //                                               FontWeight.normal),
//           //                                     ))
//           //                               ],
//           //                             ),
//           //                           ),
//           //                         ],
//           //                       )
//           //                     ],
//           //                   ),
//           //                 ],
//           //               ),
//           //               SizedBox(height: 5),
//           //               Image.asset("assets/images/hopital1.png"),
//           //               // Text(
//           //               //   addnewfacilitycontroller.fieldList[index]
//           //               //       ["FieldImage"],
//           //               //   style: TextStyle(
//           //               //       fontSize: 12, color: Colors.white70),
//           //               //   textAlign: TextAlign.center,
//           //               // ),
//           //               Padding(
//           //                 padding: const EdgeInsets.all(8.0),
//           //                 child: Row(
//           //                   children: [
//           //                     Text(
//           //                         "${addnewfacilitycontroller.facilityList[index].length} Count"),
//           //                   ],
//           //                 ),
//           //               )
//           //             ],
//           //           ),
//           //         ),
//           //       ),
//           //     );
//           //   },
//           // )),
//
//           Expanded(
//             child: SizedBox(
//               // height: 2000,
//               height: MediaQuery.of(context).size.height * 2,
//               child: GridView.count(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.78,
//                 padding: EdgeInsets.all(18.0),
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: addnewfacilitycontroller.visible
//                     ? facilityCardDetailsController.facilityData.entries
//                         .expand(
//                           (entry) => entry.value.map(
//                             (site) => GestureDetector(
//                               onTap: () {
//                                 Get.toNamed('/FacilitiesListView');
//                               },
//                               // Get.toNamed("/");
//                               child: Card(
//                                   elevation: 5,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   color: Colors.blue,
//                                   child: ListTile(
//                                     title: Column(
//                                       // mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           // Push items apart
//                                           children: [
//                                             Expanded(
//                                               // Prevent overflow of long text
//                                               child: Text(
//                                                 site.fieldName,
//                                                 style: TextStyle(
//                                                     fontSize: 18,
//                                                     color: Colors.black,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                             PopupMenuButton<SampleItem>(
//                                               initialValue: selectedItem,
//                                               onSelected: (SampleItem item) {
//                                                 setState(() {
//                                                   selectedItem = item;
//                                                 });
//                                               },
//                                               itemBuilder: (BuildContext
//                                                       context) =>
//                                                   <PopupMenuEntry<SampleItem>>[
//                                                 PopupMenuItem<SampleItem>(
//                                                   value: SampleItem.itemOne,
//                                                   child: Row(
//                                                     children: [
//                                                       TextButton(
//                                                           onPressed: () {
//                                                             facilityCardDetailsController
//                                                                 .editFacility(
//                                                                     context,
//                                                                     site.id,
//                                                                     site.fieldName,
//                                                                     site.fieldImage);
//                                                             // facilityCardDetailsController
//                                                             //     .editItem(
//                                                             //         context);
//                                                           },
//                                                           child: Text(
//                                                             "Edit",
//                                                             style: TextStyle(
//                                                                 fontSize: 18,
//                                                                 color: Colors
//                                                                     .black,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal),
//                                                           ))
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 PopupMenuItem<SampleItem>(
//                                                   value: SampleItem.itemTwo,
//                                                   child: Row(
//                                                     children: [
//                                                       TextButton(
//                                                           onPressed: () {
//                                                             setState(() {
//                                                               facilityCardDetailsController
//                                                                   .deleteWork(
//                                                                       site.id);
//                                                             });
//                                                           },
//                                                           child: Text(
//                                                             "Remove",
//                                                             style: TextStyle(
//                                                                 fontSize: 18,
//                                                                 color: Colors
//                                                                     .black,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal),
//                                                           ))
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 PopupMenuItem<SampleItem>(
//                                                   value: SampleItem.itemTwo,
//                                                   child: Row(
//                                                     children: [
//                                                       TextButton(
//                                                           onPressed: () {
//                                                             setState(() {
//                                                               facilityCardDetailsController
//                                                                       .isDisabled
//                                                                   ? null // Disable button if item is in disabled list
//                                                                   : () =>
//                                                                       facilityCardDetailsController
//                                                                           .disableItem(
//                                                                         site.id,
//                                                                       );
//                                                             });
//                                                           },
//                                                           child: Text(
//                                                             "Disable",
//                                                             style: TextStyle(
//                                                                 fontSize: 18,
//                                                                 color: Colors
//                                                                     .black,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .normal),
//                                                           ))
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                         Image.asset(
//                                           "assets/images/hopital1.png",
//                                           // height: 100,
//                                           // width: 120,
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         // Row(
//                                         //   children: [
//                                         //     Text(" Count: ${site.count}"),
//                                         //   ],
//                                         // ),
//                                       ],
//                                     ),
//                                   )
//                                   // Column(
//                                   //   crossAxisAlignment:
//                                   //       CrossAxisAlignment.center,
//                                   //   children: [
//                                   //     Column(
//                                   //       children: [
//                                   //         Text(
//                                   //           site.fieldName,
//                                   //           // ✅ Now correctly accessing fieldName
//                                   //           style: TextStyle(
//                                   //               fontSize: 16,
//                                   //               fontWeight: FontWeight.bold),
//                                   //         ),
//                                   //         if (site.count != null)
//                                   //           Text("Count: ${site.count}"),
//                                   //         // ✅ Accessing count properly
//                                   //       ],
//                                   //     ),
//                                   //     Image.asset(
//                                   //       "assets/images/hopital1.png",
//                                   //       height: 80,
//                                   //       width: double.infinity,
//                                   //       fit: BoxFit.cover,
//                                   //     ),
//                                   //   ],
//                                   // ),
//                                   ),
//                             ),
//                           ),
//                         )
//                         .toList()
//                     : List.empty(),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:attendanceapp/Screens/example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../CommenFiles/translateService.dart';
import '../../../../widgets/AppBarSample.dart';
import '../../AddNewFieldScreen/view/AddNewFieldList.dart';
import '../../FacilityCardDetails/view/Addfacility.dart';
import '../model/facilitymodeldata.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class Addnewfacilitylist extends StatefulWidget {
  @override
  _AddnewfacilitylistState createState() => _AddnewfacilitylistState();
}

class _AddnewfacilitylistState extends State<Addnewfacilitylist> {
  // @override
  // initState() {
  //   facilityCardDetailsController.facilitygetApi();
  //   fetchData();
  //   super.initState();
  // }

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

  @override
  void initState() {
    super.initState();
    addnewfacilitycontroller.fetchFacilities().then((facilities) {
      setState(() {
        addnewfacilitycontroller.allFacilities = facilities;
        addnewfacilitycontroller.filteredFacilities =
            facilities; // Initially show all facilities
      });
    });
  }

  void filterFacilities(String query) {
    setState(() {
      addnewfacilitycontroller.filteredFacilities = addnewfacilitycontroller
          .allFacilities
          .where((facility) =>
              facility.fieldName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  SampleItem? selectedItem;

  @override
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
      body:
          // FutureBuilder<List<FacilityModels>>(
          //   future: addnewfacilitycontroller.fetchFacilities(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //           child: CircularProgressIndicator()); // Loading Indicator
          //     } else if (snapshot.hasError) {
          //       return Center(
          //           child: Text('Error: ${snapshot.error}')); // Error Message
          //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //       return Center(
          //           child: Text('No data available')); // Empty Data Message
          //     }
          //
          //     final facilities = snapshot.data!;
          //     return GestureDetector(
          //       onTap: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => Addnewfieldlist()));
          //       },
          //       child: ListView.builder(
          //         itemCount: facilities.length,
          //         itemBuilder: (context, index) {
          //           final facility = facilities[index];
          //
          //           return Card(
          //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //             child: ListTile(
          //               leading: Image.network(
          //                 facility.fieldImage,
          //                 width: 50,
          //                 height: 50,
          //                 fit: BoxFit.cover,
          //                 errorBuilder: (context, error, stackTrace) =>
          //                     Icon(Icons.image_not_supported),
          //               ),
          //               title: Text(facility.fieldName),
          //               subtitle: Text("Entries: ${facility.entryCount}"),
          //               trailing: IconButton(
          //                 onPressed: () {
          //                   Navigator.of(context).push(
          //                     MaterialPageRoute(
          //                         builder: (context) => AddFacilityScreen()),
          //                   );
          //                 },
          //                 icon: Icon(Icons.add),
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
          FutureBuilder<List<FacilityModels>>(
        future: addnewfacilitycontroller.fetchFacilities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("")); // Loading Indicator
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Error Message
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text('No data available')); // Empty Data Message
          }

          final facilities = snapshot.data!;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: addnewfacilitycontroller.searchController,
                  decoration: InputDecoration(
                    labelText: TranslationService.translate("Search"),
                    border: OutlineInputBorder(),
                    suffixIcon: addnewfacilitycontroller
                            .searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              addnewfacilitycontroller.searchController.clear();
                              // fetchData();
                            },
                          )
                        : null,
                  ),
                  onChanged: filterFacilities,
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
                            builder: (context) => Addfacility()));
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

              // **GridView (2 columns)**
              Expanded(
                flex: 2, // Adjust weight
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.78,
                    mainAxisSpacing: 10,
                    // Square items
                  ),
                  itemCount: addnewfacilitycontroller.filteredFacilities.length,
                  itemBuilder: (context, index) {
                    final facility = facilities[index];
                    bool isDisabled = addnewfacilitycontroller.disabledItems
                        .contains(facility.id);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addnewfieldlist()),
                        );
                      },
                      child: Card(
                        color: Colors.blue,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(facility.fieldName,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  PopupMenuButton<String>(
                                    onSelected: (String value) {
                                      setState(() {
                                        if (value == "Disable") {
                                          addnewfacilitycontroller.disabledItems
                                              .add(facility.id); // Disable item
                                        } else if (value == "Enable") {
                                          addnewfacilitycontroller.disabledItems
                                              .remove(
                                                  facility.id); // Enable item
                                        }
                                      });
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      PopupMenuItem(
                                          value: "Edit",
                                          child: InkWell(
                                              onTap: () {
                                                // addnewfacilitycontroller
                                                //     .editFacility(
                                                //   context,
                                                //   facility.id,
                                                //   facility.fieldName,
                                                //   facility.fieldImage,
                                                //   //                                                             site.fieldImage);
                                                //   //workerListController.cleaner()
                                                // );
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
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/hopital1.png"),
                            ),
                            // Image.network(
                            //   facility.fieldImage,
                            //   width: 80,
                            //   height: 80,
                            //   fit: BoxFit.cover,
                            //   errorBuilder: (context, error, stackTrace) =>
                            //       Icon(Icons.image_not_supported, size: 50),
                            // ),
                            SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Count: ${facility.entryCount}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
