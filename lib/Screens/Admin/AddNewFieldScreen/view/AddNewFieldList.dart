// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../../CommenFiles/getXcontroller.dart';
// import '../../../../CommenFiles/translateService.dart';
// import '../../AddNewFacilityScreen/view/AddNewFacilityList.dart';
// import '../../FacilityAddListItems/view/Facility_add_List_items.dart';
// import 'AddNewFieldScreen.dart';
//
// enum SampleItem { itemOne, itemTwo, itemThree }
//
// class Addnewfieldlist extends StatefulWidget {
//   const Addnewfieldlist({super.key});
//
//   @override
//   State<Addnewfieldlist> createState() => _AddnewfieldlistState();
// }
//
// class _AddnewfieldlistState extends State<Addnewfieldlist> {
//   @override
//   SampleItem? selectedItem;
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Text(
//               TranslationService.translate('Field State'),
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
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (Context) => Addnewfacilitylist()));
//             // Get.toNamed('/Siteheaddashboard');
//             //Get.toNamed('/Admindashboard');
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
//               //controller: facilityCardDetailsController.searchController,
//               decoration: InputDecoration(
//                 labelText: TranslationService.translate("Search"),
//                 border: OutlineInputBorder(),
//                 suffixIcon: facilityCardDetailsController
//                         .searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: () {
//                           facilityCardDetailsController.searchController
//                               .clear();
//                         },
//                       )
//                     : null,
//               ),
//               onChanged: (query) => addNewFieldController.searchFacility(query),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => FacilityAddListItems()));
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
//                         TranslationService.translate('Add Field State'),
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
//           Expanded(
//               child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.78,
//
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               // crossAxisCount: 2, // Number of columns
//               // crossAxisSpacing: 10, // Spacing between columns
//               // mainAxisSpacing: 10, // Spacing between rows
//               // childAspectRatio: 1, // Aspect ratio of grid items
//             ),
//             itemCount: facilityCardListviewController.fieldStateList.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   // Navigator.of(context).push(MaterialPageRoute(
//                   //     builder: (context) => Addnewfieldlist()));
//                 },
//                 child: Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   color: Colors.blue,
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     facilityCardListviewController
//                                         .fieldStateList[index]["FieldName"],
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                                 PopupMenuButton<SampleItem>(
//                                   initialValue: selectedItem,
//                                   onSelected: (SampleItem item) {
//                                     setState(() {
//                                       selectedItem = item;
//                                     });
//                                   },
//                                   itemBuilder: (BuildContext context) =>
//                                       <PopupMenuEntry<SampleItem>>[
//                                     PopupMenuItem<SampleItem>(
//                                       value: SampleItem.itemOne,
//                                       child: Row(
//                                         children: [
//                                           TextButton(
//                                               onPressed: () {
//                                                 // facilityCardDetailsController
//                                                 //     .editFacility(
//                                                 //     context,
//                                                 //     site.id,
//                                                 //     site.fieldName,
//                                                 //     site.fieldImage);
//                                                 // facilityCardDetailsController
//                                                 //     .editItem(
//                                                 //         context);
//                                               },
//                                               child: Text(
//                                                 "Edit",
//                                                 style: TextStyle(
//                                                     fontSize: 18,
//                                                     color: Colors.black,
//                                                     fontWeight:
//                                                         FontWeight.normal),
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
//                                                 // setState(() {
//                                                 //   facilityCardDetailsController
//                                                 //       .deleteWork(
//                                                 //       site.id);
//                                                 // });
//                                               },
//                                               child: Text(
//                                                 "Remove",
//                                                 style: TextStyle(
//                                                     fontSize: 18,
//                                                     color: Colors.black,
//                                                     fontWeight:
//                                                         FontWeight.normal),
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
//                                                   // facilityCardDetailsController
//                                                   //     .isDisabled
//                                                   //     ? null // Disable button if item is in disabled list
//                                                   //     : () =>
//                                                   //     facilityCardDetailsController
//                                                   //         .disableItem(
//                                                   //       site.id,
//                                                   //     );
//                                                 });
//                                               },
//                                               child: Text(
//                                                 "Disable",
//                                                 style: TextStyle(
//                                                     fontSize: 18,
//                                                     color: Colors.black,
//                                                     fontWeight:
//                                                         FontWeight.normal),
//                                               ))
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Image.asset("assets/images/hopital1.png"),
//                         // Text(
//                         //   addnewfacilitycontroller.fieldList[index]
//                         //       ["FieldImage"],
//                         //   style: TextStyle(
//                         //       fontSize: 12, color: Colors.white70),
//                         //   textAlign: TextAlign.center,
//                         // ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                   "${facilityCardListviewController.fieldStateList[index].length} Count"),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../model/FieldStateModelData.dart';

class Addnewfieldlist extends StatefulWidget {
  @override
  _AddnewfieldlistState createState() => _AddnewfieldlistState();
}

class _AddnewfieldlistState extends State<Addnewfieldlist> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Facilities')),
      body: FutureBuilder<List<Fieldstatemodeldata>>(
        future: addNewFieldController.fetchFieldStateapi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Loading Indicator
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Error Message
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text('No facilities available')); // Empty Data Message
          }

          final facilities = snapshot.data!;
          return ListView.builder(
            itemCount: facilities.length,
            itemBuilder: (context, index) {
              final facility = facilities[index];

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Image.network(
                    facility.fieldImage,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.image_not_supported),
                  ),
                  title: Text(facility.fieldName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Head: ${facility.headName}"),
                      Text("Mobile: ${facility.mobileNumber}"),
                      Text("Proximity: ${facility.proximity} km"),
                    ],
                  ),
                  trailing: Icon(Icons.location_on, color: Colors.red),
                ),
              );
            },
          );
        },
      ),
    );
  }
}