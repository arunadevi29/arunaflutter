import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../FacilityAddListItems/view/Facility_add_List_items.dart';
import '../../FacilityCardDetails/view/Facilities_Screen.dart';

class FacilitiesListView extends StatefulWidget {
  final List<Widget> containers;

  // final List<Widget> Autdiotorium;
  // final List<Widget> School;
  // final List<Widget> College;

  FacilitiesListView({
    super.key,
    required this.containers,
  });

  @override
  State<FacilitiesListView> createState() => _FacilitiesListViewState();
}

class _FacilitiesListViewState extends State<FacilitiesListView> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              children: [
                Text(
                  "Facility",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 25,
              ),
              //tooltip: 'Setting Icon',
              onPressed: () {},
            ),
          ],
        ),
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
          ScrollNotificationObserver(
            child: Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: facilityCardListviewController.index + 1,
                  // itemCount: _strings.length,
                  itemBuilder: (context, index) {
                    return GridView.count(
                        shrinkWrap: true,
                        childAspectRatio: 0.85,
                        padding: EdgeInsets.all(25.0),
                        crossAxisCount: 2,
                        children: [
                          // for (int i = 1; i < 5; i++)

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FacilityAddListItems()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffEAEAEB),
                                  borderRadius: BorderRadius.circular(20)),
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "GH",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 75,
                                        ),
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
                                                        userListAddReportController
                                                            .editItem(
                                                                index, context);
                                                        // showAlertDialog(context);
                                                      },
                                                      child: Text(
                                                        "Edit",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
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
                                                                FontWeight
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
                                                            fontWeight:
                                                                FontWeight
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
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffEAEAEB),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      height: 100,
                                      width: 150,
                                      child: Image.asset(
                                        "assets/images/h1.png",
                                        height: 100,
                                        width: 120,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 120),
                                  //   child: Switch(
                                  //       value: facilityCardListviewController
                                  //           .isSwitched,
                                  //       onChanged: (value) {
                                  //         setState(() {
                                  //           facilityCardListviewController
                                  //               .isSwitched = value;
                                  //         });
                                  //       }),
                                  // ),
                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FacilityAddListItems()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffEAEAEB),
                                  borderRadius: BorderRadius.circular(20)),
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Be Well",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 40,
                                        ),
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
                                                        userListAddReportController
                                                            .editItem(
                                                                index, context);
                                                        // showAlertDialog(context);
                                                      },
                                                      child: Text(
                                                        "Edit",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
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
                                                                FontWeight
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      // Switch(
                                      //     value: facilityCardListviewController
                                      //         .isSwitched,
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         facilityCardListviewController
                                      //             .isSwitched = value;
                                      //       });
                                      //     }),
                                    ],
                                  ),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffEAEAEB),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      height: 100,
                                      width: 150,
                                      child: Image.asset(
                                        "assets/images/h2.png",
                                        height: 100,
                                        width: 120,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FacilityAddListItems()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffEAEAEB),
                                  borderRadius: BorderRadius.circular(20)),
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Appolo",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 40,
                                        ),
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
                                                        userListAddReportController
                                                            .editItem(
                                                                index, context);
                                                        // showAlertDialog(context);
                                                      },
                                                      child: Text(
                                                        "Edit",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
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
                                                                FontWeight
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      // Switch(
                                      //     value: facilityCardListviewController
                                      //         .isSwitched,
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         facilityCardListviewController
                                      //             .isSwitched = value;
                                      //       });
                                      //     }),
                                    ],
                                  ),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffEAEAEB),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      height: 100,
                                      width: 150,
                                      child: Image.asset(
                                        "assets/images/h3.png",
                                        height: 100,
                                        width: 120,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) => FacilitiesListView(
                              //             containers: [],
                              //           )),
                              //);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(20)),
                              height: 90,
                              width: 150,
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 5),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // if (facilityCardListviewController.index <
                                      //     facilityCardListviewController
                                      //             .Hospital.length -
                                      //         1) {
                                      //   facilityCardListviewController.index++;
                                      // }
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 80,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Add Hospital",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]);
                  }),
            ),
          ),
          // Column(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //             padding: EdgeInsets.symmetric(horizontal: 65),
          //             backgroundColor: Color(0xff0056f1),
          //             // side: BorderSide(color: Colors.yellow, width: 5),
          //
          //             textStyle: const TextStyle(
          //               fontSize: 20,
          //               fontStyle: FontStyle.normal,
          //             ),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.all(Radius.circular(10))),
          //           ),
          //           onPressed: () {
          //             setState(
          //               () {
          //                 if (_index < FirstList.length - 1) {
          //                   _index++;
          //                 }
          //               },
          //             );
          //           },
          //           child: Text(
          //             'Add',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.normal,
          //                 fontSize: 20),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),

          SizedBox(
            height: 20,
          ),
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
