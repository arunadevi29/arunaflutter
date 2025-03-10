import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../../../../CommenFiles/translateService.dart';
import '../../../../widgets/CameraScreen.dart';
import '../../FacilityAddListItems/view/Facility_add_List_items.dart';
import '../../FacilityCardListview/view/Facilities_Card_Items.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class Facilitydetails extends StatelessWidget {
  var FieldSite;

  var Latitude;
  var Longitude;
  var Proximity;
  var SiteHead;
  var MobileNo;

  Facilitydetails({
    this.FieldSite,
    this.Latitude,
    this.Longitude,
    this.Proximity,
    this.SiteHead,
    this.MobileNo,
  });

  @override
  SampleItem? selectedItem;
  String selectedCategory = '';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "GH",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                        DropdownMenuItem(
                            value: "ka",
                            child: Text(
                              'Kannada',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                      ],
                      onChanged: (value) {
                        controller.setLocale(value);
                      }),
                ),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {
                    selectedItem = item;
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    PopupMenuItem<SampleItem>(
                      value: SampleItem.itemOne,
                      child: Text(
                        TranslationService.translate("Edit"),
                      ),
                    ),
                    PopupMenuItem<SampleItem>(
                      value: SampleItem.itemTwo,
                      child: Text(TranslationService.translate("Disable")),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            ),
          ],

          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            //tooltip: 'Setting Icon',
            onPressed: () {
              // Get.toNamed('/FacilityAddListItems');
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FacilitiesListView()),
              );
            },
          ), //IconButton
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                        // Enabling the Image Frame
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20)),
                            height: 200,
                            width: 350,

                            // Uploading the Image from Assets
                            child: Image.asset(
                              'assets/images/h1.png',

                              // Resizing the Image to the Frame Size
                              fit: BoxFit.cover,
                            ))),
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
                                  TranslationService.translate(
                                      "Field Site   :"),
                                  //users[index].Name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "  $FieldSite",
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
                                  TranslationService.translate("Latitude  :"),

                                  // users[index].Work,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "  $Latitude",
                                  //users[index].Name,
                                  style: TextStyle(
                                      fontSize: 18,
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
                                  TranslationService.translate("Longitude  :"),

                                  // users[index].Timing,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "  $Longitude",
                                  //users[index].Name,
                                  style: TextStyle(
                                      fontSize: 18,
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
                                  TranslationService.translate("Proximity  :"),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "       $Proximity",
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
                                  TranslationService.translate(
                                    "Site Head   :",
                                  ),

                                  // users[index].Timing,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  TranslationService.translate(
                                    " $SiteHead",
                                  ),

                                  // users[index].Timing,
                                  style: TextStyle(
                                      fontSize: 18,
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
                                  TranslationService.translate(
                                    "Mobile No. :",
                                  ),

                                  // users[index].Timing,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  TranslationService.translate(
                                    " $MobileNo",
                                  ),

                                  // users[index].Timing,
                                  style: TextStyle(
                                      fontSize: 18,
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
  late final String FieldSite;
  late final String Latitude;

  late final String Longitude;
  late final String Proximity;
  late final String SiteHead;
  late final String MobileNo;

  Userlist(
    this.FieldSite,
    this.Latitude,
    this.Longitude,
    this.Proximity,
    this.SiteHead,
    this.MobileNo,
  );
}

List users = [
  Userlist(
      "FieldSite  : GH",
      "Latitude  : 12.9385265",
      "Longitude : 77.707028",
      "Proximity : 200 meters",
      "SiteHead  : Ramesh P",
      "MobileNo  : 8988899941"),
];
