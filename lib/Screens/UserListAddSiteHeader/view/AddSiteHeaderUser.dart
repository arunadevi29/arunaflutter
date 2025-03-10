import 'dart:convert';

import 'package:attendanceapp/CommenFiles/translateService.dart';
import 'package:attendanceapp/Screens/SiteHeader/AddSiteHead/controller/AddSiteHeadController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../../CommenFiles/getXcontroller.dart';
import '../../../widgets/AppBarSample.dart';

import '../../SiteHeader/AddSiteHead/model/SinglehospitalModel.dart';
import '../../SiteHeader/AddSiteHead/model/Siteheadmodel.dart';
import '../../SiteHeader/AddSiteHead/view/AdminAddSiteHeadScreen.dart';
import '../../UserDetailsScreen/view/UserDetailsScreen.dart';
import '../../sample.dart';
import 'package:http/http.dart' as http;

enum SampleItem { itemOne, itemTwo, itemThree }

class Addsiteheaderuser extends StatefulWidget {
  const Addsiteheaderuser({super.key});

  @override
  State<Addsiteheaderuser> createState() => _AddsiteheaderuserState();
}

class _AddsiteheaderuserState extends State<Addsiteheaderuser> {
  int selectedIndex = -1;
  SampleItem? selectedItem;

  @override
  void initState() {
    super.initState();
    addSiteHeadController.siteheadgetApi();
    fetchData();
  }

  void fetchData({String? query}) async {
    setState(() => addSiteHeadController.Loading = true);
    try {
      final data = await addSiteHeadController.siteheadgetApi(query: query);
      setState(() {
        addSiteHeadController.siteheadData = data;
        addSiteHeadController.Loading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => addSiteHeadController.Loading = false);
    }
  }

  Set<int> disabledItems = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(TranslationService.translate("Site Header")),
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
                    Get.toNamed('/Adminaddsiteheadscreen');
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
              // Get.toNamed('/Siteheaddashboard');
              Get.toNamed('/Userdetailsscreen');
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
                controller: addSiteHeadController.searchController,
                decoration: InputDecoration(
                  labelText: TranslationService.translate("Search"),
                  border: OutlineInputBorder(),
                  suffixIcon:
                      addSiteHeadController.searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                addSiteHeadController.searchController.clear();
                                fetchData();
                              },
                            )
                          : null,
                ),
                onChanged: (query) => fetchData(query: query),
              ),
            ),
            addSiteHeadController.Loading
                ? Center(child: CircularProgressIndicator())
                :
                // Expanded(
                //         child: ListView(
                //           children: addSiteHeadController.siteheadData.entries
                //               .map((entry) {
                //             return Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Padding(
                //                     padding: EdgeInsets.all(8.0),
                //                     child: Text(
                //                       entry.key,
                //                       style: TextStyle(
                //                           fontSize: 18,
                //                           fontWeight: FontWeight.bold),
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
                //                       title: Text(
                //                         TranslationService.translate(
                //                             "${site.firstName} ${site.lastName}"),
                //                       ),
                //                       subtitle: Text("${site.field}"
                //                           "\n${site.fieldSiteName}"),
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
                //                                                 // userListSiteHeaderController
                //                                                 //     .editsitehead(
                //                                                 //         context,si);
                //                                                 userListSiteHeaderController
                //                                                     .editsitehead(
                //                                                         context,
                //                                                         site.id,
                //                                                         site.firstName,
                //                                                         site.lastName,
                //                                                         site.mobileNumber,
                //                                                         site.fieldSiteName,
                //                                                         site.field,
                //                                                         site.image);
                //                                               },
                //                                               child: Text(
                //                                                 TranslationService
                //                                                     .translate(
                //                                                         "Edit"),
                //                                                 style: TextStyle(
                //                                                     fontSize: 18,
                //                                                     color: Colors
                //                                                         .black,
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
                //                                                     color: Colors
                //                                                         .black,
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
                //                                                     color: Colors
                //                                                         .black,
                //                                                     fontWeight:
                //                                                         FontWeight
                //                                                             .normal),
                //                                               ))
                //                                         ],
                //                                       ),
                //                                     )
                //                                   ]))))
                //                 ]);
                //           }).toList(),
                //         ),
                //       ),
                Expanded(
                    child: ListView(
                      children: addSiteHeadController.siteheadData.entries
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
                                    subtitle: Text(
                                        "${site.field}\n${site.fieldSiteName}"),
                                    isThreeLine: true,
                                    trailing: PopupMenuButton<String>(
                                      onSelected: (String value) {
                                        setState(() {
                                          if (value == "Disable") {
                                            disabledItems.add(
                                                site.id); // Disable the item
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
                                                  userListSiteHeaderController
                                                      .editsitehead(
                                                          context,
                                                          site.id,
                                                          site.firstName,
                                                          site.lastName,
                                                          site.mobileNumber,
                                                          site.fieldSiteName,
                                                          site.field,
                                                          site.image);
                                                },
                                                child: Text("Edit"))),
                                        PopupMenuItem(
                                            value: "Remove",
                                            child: Text("Remove")),
                                        PopupMenuItem(
                                          value:
                                              isDisabled ? "Enable" : "Disable",
                                          child: Text(isDisabled
                                              ? "Enable"
                                              : "Disable"),
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
      ),
    );
  }

// void onDisable(int index) {
//   final item = addSiteHeadController.siteheadData[index];
//   setState(() {
//     item?.removeAt(index);
//   });
// }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Site Header"),
//       actions: [
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.add,
//                   size: 35,
//                   color: Color(0xff0066FF),
//                 ),
//                 //tooltip: 'Setting Icon',
//                 onPressed: () {
//                   Get.toNamed('/Adminaddsiteheadscreen');
//                   // Navigator.of(context).push(
//                   //   MaterialPageRoute(
//                   //       builder: (context) => Adminaddsiteheadscreen()),
//                   // );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//       leading: IconButton(
//         icon: const Icon(
//           Icons.arrow_back_ios,
//           size: 25,
//         ),
//         //tooltip: 'Setting Icon',
//         onPressed: () {
//           // Get.toNamed('/Siteheaddashboard');
//           Get.toNamed('/Userdetailsscreen');
//           // Navigator.of(context).push(
//           //   MaterialPageRoute(builder: (context) => Userdetailsscreen()),
//           // );
//         },
//       ), //IconButt,
//     ),
//     body: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             controller: addSiteHeadController.searchController,
//             onTap: () {
//               // Navigator.of(context).push(
//               //   MaterialPageRoute(builder: (context) => SiteheadSearchPage()),
//               // );
//             },
//             decoration: InputDecoration(
//               labelText: 'Search',
//               hintText: 'Type something...',
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: FutureBuilder<Map<String, List<SiteheadModel>>>(
//             future: addSiteHeadController.siteheadgetApi(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(child: Text('No sitehead data found.'));
//               }
//
//               Map<String, List<SiteheadModel>> siteheads = snapshot.data!;
//               return ListView(
//                 children: siteheads.entries.map((entry) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Text(entry.key,
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold)),
//                       ),
//                       ...entry.value.map((sitehead) => ListTile(
//                             leading: CircleAvatar(
//                               radius: 30,
//                               backgroundImage: AssetImage(
//                                 "assets/images/boy.png",
//                               ),
//                             ),
//
//                             // Image.asset(
//                             //   _foundUsers[index]["image"],
//                             //   fit: BoxFit.fill,
//                             //   width: 90,
//                             //   height: 100,
//                             // ),
//                             // Image.asset("assets/images/2.png",
//                             //     width: 50, height: 50, fit: BoxFit.cover),
//                             //Image.network("YOUR_IMAGE_BASE_URL/${hospital.image}",
//
//                             title: Text(
//                                 "${sitehead.firstName} ${sitehead.lastName}"),
//                             subtitle: Text("${sitehead.field}"
//                                 "\n${sitehead.fieldSiteName}"),
//                             isThreeLine: true,
//                             trailing: Padding(
//                               padding:
//                                   const EdgeInsets.only(top: 10, left: 13),
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
//                                               // userListSiteHeaderController
//                                               //     .editItem(index, context);
//                                               // showAlertDialog(context);
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
//                                                 // hospitals.removeAt(index);
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
//                             ),
//                           )),
//                       // ListTile(
//                       //   title: Text(
//                       //       "${sitehead.firstName} ${sitehead.lastName}"),
//                       //   subtitle: Text(
//                       //       "Field: ${sitehead.field} - Site: ${sitehead.fieldSiteName}"),
//                       // )),
//                       Divider()
//                     ],
//                   );
//                 }).toList(),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
