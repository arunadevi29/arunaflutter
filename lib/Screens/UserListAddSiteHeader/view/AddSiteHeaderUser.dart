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

class Addsiteheaderuser extends StatefulWidget {
  const Addsiteheaderuser({super.key});

  @override
  State<Addsiteheaderuser> createState() => _AddsiteheaderuserState();
}

class _AddsiteheaderuserState extends State<Addsiteheaderuser> {
  int selectedIndex = -1;
  SampleItem? selectedItem;

  @override
  initState() {
    // at the beginning, all users are shown

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Site Header"),
        actions: [
          Row(
            children: [
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
                    Get.toNamed('/Adminaddsiteheadscreen');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => Adminaddsiteheadscreen()),
                    // );
                  },
                ),
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
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: userListSiteHeaderController.searchController,
                // onChanged: (query) =>
                //     userListSiteHeaderController.filteredItems(query),
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Type something...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder<List<Hospital>>(
                    future: addSiteHeadController.fetchHospitals(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Loading state
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                "Error: ${snapshot.error}")); // Error state
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                            child: Text("No hospitals found")); // No data state
                      } else {
                        List<Hospital> hospitals = snapshot.data!;

                        return ListView.builder(
                          itemCount: hospitals.length,
                          itemBuilder: (context, index) {
                            Hospital hospital = hospitals[index];

                            return ListTile(
                              leading: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                  "assets/images/2.png",
                                ),
                              ),

                              // Image.asset(
                              //   _foundUsers[index]["image"],
                              //   fit: BoxFit.fill,
                              //   width: 90,
                              //   height: 100,
                              // ),
                              // Image.asset("assets/images/2.png",
                              //     width: 50, height: 50, fit: BoxFit.cover),
                              //Image.network("YOUR_IMAGE_BASE_URL/${hospital.image}",

                              title: Text(
                                  "${hospital.firstName} ${hospital.lastName}"),
                              subtitle: Text("${hospital.fieldSiteName}"
                                  // "\n${hospital.mobileNumber}"
                                  ),
                              isThreeLine: true,
                              trailing: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 13),
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
                                                // userListSiteHeaderController
                                                //     .editItem(index, context);
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
                                                  hospitals.removeAt(index);
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
                              ),
                            );
                          },
                        );
                      }
                      //         // Padding(
                      //         //   padding: const EdgeInsets.all(10),
                      //         //   child: Column(
                      //         //     children: [
                      //         //       userListSiteHeaderController.foundUsers.isNotEmpty
                      //         //           ? Expanded(
                      //         //               child:
                      //         //               ListView.builder(
                      //         //               itemCount: userListSiteHeaderController.foundUsers.length,
                      //         //               itemBuilder: (BuildContext context, int index) {
                      //         //                 return SingleChildScrollView(
                      //         //                   child: ListTile(
                      //         //                     leading: CircleAvatar(
                      //         //                       radius: 45,
                      //         //                       backgroundImage: AssetImage(
                      //         //                         userListSiteHeaderController.foundUsers[index]
                      //         //                             ["image"],
                      //         //                       ),
                      //         //                     ),
                      //         //                     // Image.asset(
                      //         //                     //   _foundUsers[index]["image"],
                      //         //                     //   fit: BoxFit.fill,
                      //         //                     //   width: 90,
                      //         //                     //   height: 100,
                      //         //                     // ),
                      //         //                     title: Column(
                      //         //                       children: [
                      //         //                         Row(
                      //         //                           mainAxisAlignment:
                      //         //                               MainAxisAlignment.spaceBetween,
                      //         //                           children: [
                      //         //                             Padding(
                      //         //                               padding: const EdgeInsets.only(top: 15),
                      //         //                               child: Text(
                      //         //                                 userListSiteHeaderController
                      //         //                                     .foundUsers[index]["name"],
                      //         //                                 style: TextStyle(
                      //         //                                     fontSize: 18,
                      //         //                                     color: Colors.black,
                      //         //                                     fontWeight: FontWeight.bold),
                      //         //                               ),
                      //         //                             ),
                      //         //                             Padding(
                      //         //                               padding: const EdgeInsets.only(
                      //         //                                   top: 10, left: 13),
                      //         //                               child: PopupMenuButton<SampleItem>(
                      //         //                                 initialValue: selectedItem,
                      //         //                                 onSelected: (SampleItem item) {
                      //         //                                   setState(() {
                      //         //                                     selectedItem = item;
                      //         //                                   });
                      //         //                                 },
                      //         //                                 itemBuilder: (BuildContext context) =>
                      //         //                                     <PopupMenuEntry<SampleItem>>[
                      //         //                                   PopupMenuItem<SampleItem>(
                      //         //                                     value: SampleItem.itemOne,
                      //         //                                     child: Row(
                      //         //                                       children: [
                      //         //                                         TextButton(
                      //         //                                             onPressed: () {
                      //         //                                               userListSiteHeaderController
                      //         //                                                   .editItem(
                      //         //                                                       index, context);
                      //         //                                               // showAlertDialog(context);
                      //         //                                             },
                      //         //                                             child: Text(
                      //         //                                               "Edit",
                      //         //                                               style: TextStyle(
                      //         //                                                   fontSize: 18,
                      //         //                                                   color: Colors.black,
                      //         //                                                   fontWeight:
                      //         //                                                       FontWeight.normal),
                      //         //                                             ))
                      //         //                                       ],
                      //         //                                     ),
                      //         //                                   ),
                      //         //                                   PopupMenuItem<SampleItem>(
                      //         //                                     value: SampleItem.itemTwo,
                      //         //                                     child: Row(
                      //         //                                       children: [
                      //         //                                         TextButton(
                      //         //                                             onPressed: () {
                      //         //                                               setState(() {
                      //         //                                                 userListSiteHeaderController
                      //         //                                                     .foundUsers
                      //         //                                                     .removeAt(index);
                      //         //                                               });
                      //         //                                             },
                      //         //                                             child: Text(
                      //         //                                               "Remove",
                      //         //                                               style: TextStyle(
                      //         //                                                   fontSize: 18,
                      //         //                                                   color: Colors.black,
                      //         //                                                   fontWeight:
                      //         //                                                       FontWeight.normal),
                      //         //                                             ))
                      //         //                                       ],
                      //         //                                     ),
                      //         //                                   ),
                      //         //                                   PopupMenuItem<SampleItem>(
                      //         //                                     value: SampleItem.itemTwo,
                      //         //                                     child: Row(
                      //         //                                       children: [
                      //         //                                         TextButton(
                      //         //                                             onPressed: () {
                      //         //                                               setState(() {});
                      //         //                                             },
                      //         //                                             child: Text(
                      //         //                                               "Disable",
                      //         //                                               style: TextStyle(
                      //         //                                                   fontSize: 18,
                      //         //                                                   color: Colors.black,
                      //         //                                                   fontWeight:
                      //         //                                                       FontWeight.normal),
                      //         //                                             ))
                      //         //                                       ],
                      //         //                                     ),
                      //         //                                   ),
                      //         //                                 ],
                      //         //                               ),
                      //         //                             )
                      //         //                           ],
                      //         //                         ),
                      //         //                         Row(
                      //         //                           children: [
                      //         //                             Text(
                      //         //                               userListSiteHeaderController
                      //         //                                   .foundUsers[index]["des"],
                      //         //                               style: TextStyle(
                      //         //                                   fontSize: 14,
                      //         //                                   color: Colors.black,
                      //         //                                   fontWeight: FontWeight.normal),
                      //         //                             ),
                      //         //                           ],
                      //         //                         ),
                      //         //                         // Row(
                      //         //                         //   children: [
                      //         //                         //     Text(
                      //         //                         //       userListSiteHeaderController
                      //         //                         //           .foundUsers[index]["Site Head"],
                      //         //                         //       style: TextStyle(
                      //         //                         //           fontSize: 15,
                      //         //                         //           color: Colors.black,
                      //         //                         //           fontWeight: FontWeight.normal),
                      //         //                         //     ),
                      //         //                         //   ],
                      //         //                         // ),
                      //         //                         // Row(
                      //         //                         //   children: [
                      //         //                         //     Text(
                      //         //                         //       userListSiteHeaderController
                      //         //                         //           .foundUsers[index]["Report User"],
                      //         //                         //       style: TextStyle(
                      //         //                         //           fontSize: 15,
                      //         //                         //           color: Colors.black,
                      //         //                         //           fontWeight: FontWeight.normal),
                      //         //                         //     ),
                      //         //                         //     SizedBox(
                      //         //                         //       width: 10,
                      //         //                         //     ),
                      //         //                         //   ],
                      //         //                         // ),
                      //         //                         Divider()
                      //         //                       ],
                      //         //                     ),
                      //         //                   ),
                      //         //                 );
                      //         //               },
                      //         //             ))
                      //         //           : const Text(
                      //         //               'No results found Please try with diffrent search',
                      //         //               style: TextStyle(fontSize: 24),
                      //         //             ),
                      //         //     ],
                      //         //   ),
                      //         // ),
                      //       }),
                      // ),
                    }))

            // Expanded(
            //   child: FutureBuilder<List<Hospital>>(
            //     future: addSiteHeadController.fetchHospitals(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(
            //             child: CircularProgressIndicator()); // Show loader
            //       } else if (snapshot.hasError) {
            //         return Center(child: Text("Error: ${snapshot.error}"));
            //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //         return Center(child: Text("No users found"));
            //       } else {
            //         List<Hospital> hospitals = snapshot.data!;
            //
            //         return ListView.builder(
            //           itemCount: hospitals.length,
            //           itemBuilder: (context, index) {
            //             Hospital hospital = hospitals[index];
            //
            //             return ListTile(
            //               title: Text("${hospital.firstName}"),
            //               subtitle: Text("${hospital.lastName}"),
            //             );
            //           },
            //         );
            //       }
            //     },
            //   ),
            // )
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
