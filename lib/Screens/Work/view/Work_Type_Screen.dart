import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../CommenFiles/getXcontroller.dart';
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              children: [
                Text(
                  "Work Type",
                  style: TextStyle(
                      fontSize: 20,
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
              onPressed: () {
                // showSearch(
                //     context: context, delegate: CustomSearchDelegate());
              },
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
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: facilityCardListviewController.index + 1,
              // itemCount: _strings.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 190,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0),
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => FacilitiesListView(
                          //           containers: [],
                          //         )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffEAEAEB),
                              borderRadius: BorderRadius.circular(20)),
                          // height: 90,
                          // width: 150,
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "House\nKeeping",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  // Container(
                                  //     width: 42,
                                  //     height: 42,
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: Colors.white,
                                  //     ),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Image.asset(
                                  //         "assets/images/w1.png",
                                  //       ),
                                  //     )),
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 50, left: 1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "3 Shifts",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => FacilitiesListView(
                          //           containers: [],
                          //         )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffEAEAEB),
                              borderRadius: BorderRadius.circular(20)),
                          height: 90,
                          width: 150,
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
                                    "Gardener",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  // Container(
                                  //     width: 42,
                                  //     height: 42,
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: Colors.white,
                                  //     ),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Image.asset(
                                  //         "assets/images/w2.png",
                                  //       ),
                                  //     )),
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 60, left: 1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "3 Shifts",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => FacilitiesListView(
                          //           containers: [],
                          //         )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffEAEAEB),
                              borderRadius: BorderRadius.circular(20)),
                          height: 90,
                          width: 150,
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
                                    "Security",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
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
                                  // Container(
                                  //     width: 42,
                                  //     height: 42,
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: Colors.white,
                                  //     ),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Image.asset(
                                  //         "assets/images/location.png",
                                  //       ),
                                  //     )),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 60, left: 1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "3 Shifts",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20)),
                        height: 90,
                        width: 150,
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/AddWorkTypeScreen');
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //       builder: (context) => AddWorkTypeScreen()),
                                // );
                                // if (_index < Hospital.length - 1) {
                                //   _index++;
                                // }
                              },
                              child: Icon(
                                Icons.add,
                                size: 80,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Add Work Type",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
