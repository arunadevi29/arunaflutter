import 'package:attendanceapp/CommenFiles/translateService.dart';
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
    addContractorController.contractorgetapi();
    fetchData();
    super.initState();
  }

  void fetchData({String? query}) async {
    setState(() => addContractorController.isLoading = true);
    try {
      final data = await addContractorController.contractorgetapi(query: query);
      setState(() {
        addContractorController.ContractorData = data;
        addContractorController.isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => addContractorController.isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationService.translate("Contractor")),
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
          IconButton(
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
              controller: addContractorController.searchController,
              decoration: InputDecoration(
                labelText: TranslationService.translate("Search"),
                border: OutlineInputBorder(),
                suffixIcon:
                    addContractorController.searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              addContractorController.searchController.clear();
                              fetchData();
                            },
                          )
                        : null,
              ),
              onChanged: (query) => fetchData(query: query),
            ),
          ),
          addContractorController.isLoading
              ? Center(child: CircularProgressIndicator())
              :
              // Expanded(
              //         child: ListView(
              //           children: addContractorController.ContractorData.entries
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
              //                       title: Text(
              //                         TranslationService.translate(
              //                             "${site.firstName} ${site.lastName}"),
              //                       ),
              //                       subtitle: Text("${site.mobileNumber}"
              //                           //"\n${site.image}"
              //                           ),
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
              //                                                 addContractorController
              //                                                     .editcontractor(
              //                                                         context,
              //                                                         site.id,
              //                                                         site
              //                                                             .firstName,
              //                                                         site.lastName,
              //                                                         site
              //                                                             .mobileNumber,
              //                                                         site.image
              //                                                             .toString());
              //                                                 addContractorController
              //                                                     .cleaner();
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
              //                                     )
              //                                   ]))))
              //                 ]);
              //           }).toList(),
              //         ),
              //       ),
              Expanded(
                  child: ListView(
                    children: addContractorController.ContractorData.entries
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
                            bool isDisabled = userListAddContractorController
                                .disabledItems
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
                                          userListAddContractorController
                                              .disabledItems
                                              .add(site.id); // Disable the item
                                        } else if (value == "Enable") {
                                          userListAddContractorController
                                              .disabledItems
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
                                                userListAddContractorController
                                                    .editcontractor(
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
// Padding(
//   padding: const EdgeInsets.all(10),
//   child: Column(
//     children: [
//       userListAddContractorController.foundUsers.isNotEmpty
//           ? Expanded(
//               child: ListView.builder(
//               itemCount:
//                   userListAddContractorController.foundUsers.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return SingleChildScrollView(
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       radius: 45,
//                       backgroundImage: AssetImage(
//                         userListAddContractorController.foundUsers[index]
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
//                                 userListAddContractorController
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
//                                               userListAddContractorController
//                                                   .editItem(
//                                                       index, context);
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
//                                                 userListAddContractorController
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
//                         Row(
//                           children: [
//                             Text(
//                               userListAddContractorController
//                                   .foundUsers[index]["des"],
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.normal),
//                             ),
//                           ],
//                         ),
//                         // Row(
//                         //   children: [
//                         //     Text(
//                         //       userListAddContractorController
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
//                         //       userListAddContractorController
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
