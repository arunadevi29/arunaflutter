// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../../CommenFiles/getXcontroller.dart';
// import '../../../../CommenFiles/translateService.dart';
// import '../../FacilityCardDetails/view/Addfacility.dart';
// import 'AddNewFacilityList.dart';
//
// class Addnewfacilityscreen extends StatefulWidget {
//   const Addnewfacilityscreen({super.key});
//
//   @override
//   State<Addnewfacilityscreen> createState() => _AddnewfacilityscreenState();
// }
//
// class _AddnewfacilityscreenState extends State<Addnewfacilityscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Text(
//               TranslationService.translate('Add Facility'),
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
//             //  Get.toNamed('/Addnewfacilitylist');
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => Addfacility()),
//             );
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 40,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 TextField(
//                     controller: facilityCardDetailsController.nameController,
//                     decoration: InputDecoration(
//                       labelText: "Field Name",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         // Rounded corners
//                         borderSide: BorderSide(color: Colors.blue, width: 2),
//                       ),
//                     )),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextField(
//                   controller: facilityCardDetailsController.imageController,
//                   decoration: InputDecoration(
//                     labelText: "Image URL",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       // Rounded corners
//                       borderSide: BorderSide(color: Colors.blue, width: 2),
//                     ),
//                   ),
//                 ),
//                 //Image.asset(facilityCardDetailsController.image.toString()),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     // Button background color
//                     foregroundColor: Colors.white,
//                     // Text color
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                     // Button padding
//                     shape: RoundedRectangleBorder(
//                       borderRadius:
//                           BorderRadius.circular(10), // Rounded corners
//                     ),
//                     elevation: 5, // Shadow effect
//                   ),
//                   onPressed: () {
//                     if (facilityCardDetailsController
//                             .nameController.text.isNotEmpty &&
//                         facilityCardDetailsController
//                             .imageController.text.isNotEmpty) {
//                       facilityCardDetailsController.addField(
//                           facilityCardDetailsController.nameController.text,
//                           facilityCardDetailsController.imageController.text);
//                       facilityCardDetailsController.nameController.clear();
//                       facilityCardDetailsController.imageController.clear();
//                     }
//                     Get.toNamed("/FacilitiesScreen");
//                   },
//                   child: Text("Add Field"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       // Column(children: [
//       //   Padding(
//       //     padding: EdgeInsets.all(10),
//       //     child: Column(
//       //       children: [
//       //         TextField(
//       //           controller: addnewfacilitycontroller.nameController,
//       //           decoration: InputDecoration(labelText: "Field Name"),
//       //         ),
//       //         TextField(
//       //           controller: addnewfacilitycontroller.imageController,
//       //           decoration: InputDecoration(labelText: "Field Image"),
//       //         ),
//       //         SizedBox(height: 10),
//       //         ElevatedButton(
//       //           onPressed: () {
//       //             addnewfacilitycontroller.addFacilitypostapi(
//       //                 addnewfacilitycontroller.nameController.text,
//       //                 addnewfacilitycontroller.imageController.text);
//       //             Navigator.push(
//       //                 context,
//       //                 MaterialPageRoute(
//       //                     builder: (context) => Addnewfacilitylist()));
//       //             // addnewfacilitycontroller.addFacility(
//       //             //     "Mall", "mall_image_url.png");
//       //           },
//       //           child: Text("Add Facility"),
//       //         )
//       //       ],
//       //     ),
//       //   ),
//       // ])
//       //     Padding(
//       //   padding: const EdgeInsets.all(16.0),
//       //   child: Column(
//       //     children: [
//       //       TextField(
//       //         controller: addnewfacilitycontroller.nameController,
//       //         decoration: InputDecoration(
//       //           labelText: "Enter text",
//       //           border: OutlineInputBorder(),
//       //         ),
//       //       ),
//       //       SizedBox(height: 10),
//       //       Obx(() => addnewfacilitycontroller.selectedImage.value != null
//       //           ? Image.file(addnewfacilitycontroller.selectedImage.value!,
//       //               height: 150)
//       //           : Text("No image selected")),
//       //       SizedBox(height: 10),
//       //       ElevatedButton.icon(
//       //         onPressed: addnewfacilitycontroller.pickImage,
//       //         icon: Icon(Icons.image),
//       //         label: Text("Pick Image"),
//       //       ),
//       //       SizedBox(height: 10),
//       //       Obx(() => addnewfacilitycontroller.isLoading.value
//       //           ? CircularProgressIndicator()
//       //           : ElevatedButton(
//       //               onPressed: addnewfacilitycontroller.uploadData,
//       //               child: Text("Upload"),
//       //             )),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../CommenFiles/getXcontroller.dart';
import '../model/facilitymodeldata.dart';
import 'AddNewFacilityList.dart';

class AddFacilityScreen extends StatefulWidget {
  @override
  _AddFacilityScreenState createState() => _AddFacilityScreenState();
}

class _AddFacilityScreenState extends State<AddFacilityScreen> {
  void submitData() async {
    FacilityModels newFacility = FacilityModels(
      id: 0, // ID will be auto-generated by the backend
      fieldName: addnewfacilitycontroller.nameController.text,
      fieldImage: addnewfacilitycontroller.imageController.text,
      entryCount:
          int.tryParse(addnewfacilitycontroller.entryController.text) ?? 0,
    );

    bool isSuccess = await addnewfacilitycontroller.addFacility(newFacility);

    if (isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Facility added successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add facility")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Facility")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: addnewfacilitycontroller.nameController,
              decoration: InputDecoration(labelText: "Facility Name"),
            ),
            TextField(
              controller: addnewfacilitycontroller.imageController,
              decoration: InputDecoration(labelText: "Image URL"),
            ),
            TextField(
              controller: addnewfacilitycontroller.entryController,
              decoration: InputDecoration(labelText: "Entry Count"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                submitData();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Addnewfacilitylist()),
                );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
