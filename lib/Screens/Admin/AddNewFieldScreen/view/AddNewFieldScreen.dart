// import 'package:attendanceapp/Screens/Admin/AddNewFieldScreen/view/AddNewFieldList.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../../CommenFiles/getXcontroller.dart';
// import '../../../../CommenFiles/translateService.dart';
// import '../../AddNewFacilityScreen/view/AddNewFacilityList.dart';
//
// class Addnewfieldscreen extends StatefulWidget {
//   const Addnewfieldscreen({super.key});
//
//   @override
//   State<Addnewfieldscreen> createState() => _AddnewfieldscreenState();
// }
//
// class _AddnewfieldscreenState extends State<Addnewfieldscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Row(
//             children: [
//               Text(
//                 TranslationService.translate('Add Field State'),
//                 // "Facility",
//                 style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: DropdownButton(
//                   underline: SizedBox(),
//                   icon: Icon(
//                     Icons.language,
//                     color: Colors.blue,
//                     size: 35,
//                   ),
//                   items: const [
//                     DropdownMenuItem(
//                         value: "en",
//                         child: Text(
//                           'English',
//                           style: TextStyle(color: Colors.black, fontSize: 18),
//                         )),
//                     DropdownMenuItem(
//                         value: "ka",
//                         child: Text(
//                           'Kannada',
//                           style: TextStyle(color: Colors.black, fontSize: 18),
//                         )),
//                   ],
//                   onChanged: (value) {
//                     controller.setLocale(value);
//                   }),
//             )
//           ],
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               size: 25,
//             ),
//             //tooltip: 'Setting Icon',
//             onPressed: () {
//               // Get.toNamed('/Siteheaddashboard');
//               // Get.toNamed('/Addnewfacilitylist');
//               Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => Addnewfieldlist()),
//               );
//             },
//           ),
//         ),
//         body: Column(children: [
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 TextField(
//                     controller:
//                         facilityAddListItemsController.FieldSiteNameController,
//                     decoration: InputDecoration(labelText: "First Name")),
//                 TextField(
//                     decoration: InputDecoration(
//                         labelText:
//                             "${facilityAddListItemsController.lat.trim()}")),
//                 TextField(
//                     // controller: facilityAddListItemsController.LatitudeController,
//                     decoration: InputDecoration(
//                         labelText:
//                             "${facilityAddListItemsController.long.trim()}")),
//                 TextField(
//                     //controller: facilityAddListItemsController.MobileNumberController,
//                     decoration: InputDecoration(
//                         labelText:
//                             "${facilityAddListItemsController.distance.toString()}")),
//                 TextField(
//                     controller:
//                         facilityAddListItemsController.MobileNumberController,
//                     decoration: InputDecoration(labelText: "Field Site Name")),
//                 TextField(
//                   controller: addnewfacilitycontroller.imageController,
//                   decoration: InputDecoration(labelText: "Field Image"),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     facilityCardListviewController.addFieldStateApi();
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Addnewfieldlist()));
//                   },
//                   child: Text("Add Field"),
//                 )
//               ],
//             ),
//           ),
//         ]));
//   }
// }
