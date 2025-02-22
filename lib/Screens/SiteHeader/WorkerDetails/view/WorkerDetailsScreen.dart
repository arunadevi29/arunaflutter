import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../SiteHeader/AddSiteWorker/view/SiteHeadAddSiteWorkerScreen.dart';
import '../../WorkerList/view/WorkerListScreen.dart';

class Workerdetailsscreen extends StatelessWidget {
  var Contractor;
  var Firstname;
  var Lastname;
  var WorkType;
  var Shift;

  var Timing;
  var Worker;

  Workerdetailsscreen({
    this.Contractor,
    this.Firstname,
    this.Lastname,
    this.WorkType,
    this.Shift,
    this.Timing,
    this.Worker,
  });

  @override
  String selectedCategory = '';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Column(
                children: [
                  Text(
                    "Worker Details",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(),
              // IconButton(
              //   icon: const Icon(
              //     Icons.search,
              //     size: 25,
              //   ),
              //   //tooltip: 'Setting Icon',
              //   onPressed: () {
              //     // showSearch(
              //     //     context: context, delegate: CustomSearchDelegate());
              //   },
              // ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
            ),
            //tooltip: 'Setting Icon',
            onPressed: () {
              Get.toNamed('/Siteheadaddsiteworkerscreen');
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //       builder: (context) => Siteheadaddsiteworkerscreen()),
              // );
            },
          ),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/men_img.png',
                      height: 160,
                      width: 160,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: ListTile(
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Contractor   :  $Contractor",
                                  //users[index].Name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Firstname     :  $Firstname",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Lastname     :   $Lastname",
                                  // users[index].Work,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Work Type    :  $WorkType",
                                  // users[index].Timing,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Shift              :  $Shift",
                                  // users[index].Timing,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "Timing             : $Timing",
                            //       // users[index].Timing,
                            //       style: TextStyle(
                            //           fontSize: 17,
                            //           color: Colors.black,
                            //           fontWeight: FontWeight.w500),
                            //     ),
                            //     SizedBox(
                            //       width: 10,
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 8,
                            // ),
                            Row(
                              children: [
                                Text(
                                  "Worker          :  $Worker",
                                  // users[index].Timing,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class Userlist {
  late final String Contractor;
  late final String Firstname;

  late final String Lastname;
  late final String WorkType;
  late final String Shift;
  late final String Timing;
  late final String Worker;

  Userlist(
    this.Contractor,
    this.Firstname,
    this.Lastname,
    this.WorkType,
    this.Shift,
    this.Timing,
    this.Worker,
  );
}

List users = [
  Userlist(
      "Contractor      :  Kumar R",
      "Firstname       :  Dhilip Kumar",
      "Lastname        : Raja",
      "Work Type           : Security",
      "Shift           : First Shift",
      "Timing          : Shift - 1",
      'Worker          : rajavel'),
];
