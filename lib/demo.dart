// import 'dart:io';
//
// import 'package:attendanceapp/Screens/AddWorkType/model/worktypemodeldata.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'dart:convert';
//
// import 'CommenFiles/functions.dart';
// import 'CommenFiles/getXcontroller.dart';
// import 'CommenFiles/translateService.dart';
// import 'Screens/AddWorkType/view/AddWorkTypescreen.dart';
// import 'Screens/Admin/FacilityCardDetails/model/FacilitylistModel.dart';
// import 'Screens/ShiftTime/ShiftTimeScreen/model/ShiftTimeModel.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'Screens/SiteHeader/AddSiteHead/model/SinglehospitalModel.dart';
// import 'Screens/SiteHeader/AddSiteHead/model/Siteheadmodel.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// enum SampleItem { itemOne, itemTwo, itemThree }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green, // Set the app's primary theme color
//       ),
//       home: APICall(),
//     );
//   }
// }
//
// class APICall extends StatefulWidget {
//   @override
//   _APICallState createState() => _APICallState();
// }
//
// class _APICallState extends State<APICall> {
//   final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   String result = ''; // To store the result from the API call
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _postData() async {
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, dynamic>{
//           'name': nameController.text,
//           'email': emailController.text,
//           // Add any other data you want to send in the body
//         }),
//       );
//
//       if (response.statusCode == 201) {
//         // Successful POST request, handle the response here
//         final responseData = jsonDecode(response.body);
//         setState(() {
//           result =
//               'ID: ${responseData['id']}\nName: ${responseData['name']}\nEmail: ${responseData['email']}';
//         });
//       } else {
//         // If the server returns an error response, throw an exception
//         throw Exception('Failed to post data');
//       }
//     } catch (e) {
//       setState(() {
//         result = 'Error: $e';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('POST Request Example'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             ElevatedButton(
//               onPressed: _postData,
//               child: Text('Submit'),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               result,
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ImageUploadScreen extends StatefulWidget {
//   @override
//   _ImageUploadScreenState createState() => _ImageUploadScreenState();
// }
//
// class _ImageUploadScreenState extends State<ImageUploadScreen> {
//   File? _image; // Selected image file
//   final picker = ImagePicker();
//
//   // 📌 Pick image from camera or gallery
//   Future<void> pickImage(ImageSource source) async {
//     final pickedFile = await picker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<void> uploadImage() async {
//     if (_image == null) {
//       print("⚠ No image selected!");
//       return;
//     }
//
//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse("https://mobileappapi.onrender.com/api/work/create"),
//       );
//
//       // ✅ Add WorkType field
//       request.fields["WorkType"] = "Driver";
//
//       // ✅ Attach the image file
//       request.files
//           .add(await http.MultipartFile.fromPath('Image', _image!.path));
//
//       var response = await request.send();
//       String responseBody = await response.stream.bytesToString();
//       print("📩 Response: $responseBody");
//
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         print("✅ Image uploaded successfully!");
//       } else {
//         print("❌ Upload failed: $responseBody");
//       }
//     } catch (e) {
//       print("⚠ Error: $e");
//     }
//   }
//
//   // 📌 Upload image to API
//   // Future<void> uploadImage() async {
//   //   if (_image == null) {
//   //     print("No image selected!");
//   //     return;
//   //   }
//   //
//   //   try {
//   //     var request = http.MultipartRequest(
//   //       'POST',
//   //       Uri.parse("https://mobileappapi.onrender.com/api/work/create"),
//   //     );
//   //
//   //     // ✅ Add WorkType field
//   //     request.fields["WorkType"] = "Driver"; // Replace with actual input
//   //
//   //     // ✅ Attach the image file
//   //     request.files.add(
//   //       await http.MultipartFile.fromPath('Image', _image!.path),
//   //     );
//   //
//   //     var response = await request.send();
//   //     if (response.statusCode == 201 || response.statusCode == 200) {
//   //       print("✅ Image uploaded successfully!");
//   //     } else {
//   //       print("❌ Failed to upload: ${await response.stream.bytesToString()}");
//   //     }
//   //   } catch (e) {
//   //     print("Error: $e");
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Image')),
//       body: Column(
//         children: [
//           SizedBox(height: 20),
//           _image != null
//               ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
//               : Text("No image selected"),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton.icon(
//                 icon: Icon(Icons.camera),
//                 label: Text("Camera"),
//                 onPressed: () => pickImage(ImageSource.camera),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton.icon(
//                 icon: Icon(Icons.image),
//                 label: Text("Gallery"),
//                 onPressed: () => pickImage(ImageSource.gallery),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             icon: Icon(Icons.upload),
//             label: Text("Upload"),
//             onPressed: uploadImage,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class WorkTypeModel {
//   final int id;
//   final String workType;
//
//   WorkTypeModel({required this.id, required this.workType});
//
//   factory WorkTypeModel.fromJson(Map<String, dynamic> json) {
//     return WorkTypeModel(
//       id: json["Id"] ?? 0,
//       workType: json["WorkType"] ?? "No Work Type",
//     );
//   }
// }
//
// class ApiService {
//   final String baseUrl =
//       "https://your-api-url.com"; // Change this to your API URL
//
//   /// **GET Method**: Fetch Work Data
//   Future<List<WorkTypeModel>> fetchWorkData() async {
//     try {
//       final response = await http
//           .get(Uri.parse("https://mobileappapi.onrender.com/api/work/all"));
//
//       if (response.statusCode == 200) {
//         Map<String, dynamic> jsonData = json.decode(response.body);
//         List<WorkTypeModel> workList = [];
//
//         jsonData.forEach((key, value) {
//           for (var item in value) {
//             workList.add(WorkTypeModel.fromJson(item));
//           }
//         });
//
//         return workList;
//       } else {
//         throw Exception("Failed to load data");
//       }
//     } catch (e) {
//       print("Error: $e");
//       return [];
//     }
//   }
//
//   /// **POST Method**: Send Work Data
//   Future<bool> postWorkData(Map<String, dynamic> data) async {
//     try {
//       final response = await http.post(
//         Uri.parse("https://mobileappapi.onrender.com/api/work/create"),
//         headers: {"Content-Type": "application/json"},
//         body: json.encode(data),
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print("Data posted successfully");
//         return true;
//       } else {
//         print("Failed to post data");
//         return false;
//       }
//     } catch (e) {
//       print("Error: $e");
//       return false;
//     }
//   }
// }
//
// class WorkTypeListScreen extends StatefulWidget {
//   @override
//   _WorkTypeListScreenState createState() => _WorkTypeListScreenState();
// }
//
// class _WorkTypeListScreenState extends State<WorkTypeListScreen> {
//   late Future<List<WorkTypeModel>> workDataFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     workDataFuture = ApiService().fetchWorkData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Work Type List")),
//       body: FutureBuilder<List<WorkTypeModel>>(
//         future: workDataFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No data available"));
//           }
//
//           List<WorkTypeModel> workList = snapshot.data!;
//
//           return ListView.builder(
//             itemCount: workList.length,
//             itemBuilder: (context, index) {
//               var workItem = workList[index];
//
//               return Column(
//                 children: [
//                   // Padding(
//                   //   padding: EdgeInsets.all(8.0),
//                   //   child: TextField(
//                   //     controller: addWorkTypeController.searchController,
//                   //     decoration: InputDecoration(
//                   //       labelText: TranslationService.translate("Search"),
//                   //       border: OutlineInputBorder(),
//                   //       suffixIcon:
//                   //       addWorkTypeController.searchController.text.isNotEmpty
//                   //           ? IconButton(
//                   //         icon: Icon(Icons.search),
//                   //         onPressed: () {
//                   //           addWorkTypeController.searchController.clear();
//                   //           fetchData();
//                   //         },
//                   //       )
//                   //           : null,
//                   //     ),
//                   //     onChanged: (query) => fetchData(query: query),
//                   //   ),
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => AddWorkTypeScreen()));
//                           },
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.add,
//                                 size: 50,
//                                 color: Colors.blue,
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 TranslationService.translate('Add Work Type'),
//                                 // "Add Facility",
//                                 style: TextStyle(
//                                     color: Colors.blue,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Card(
//                     child: ListTile(
//                       title: Text(workItem.workType),
//                       subtitle: Text("ID: ${workItem.id}"),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class work extends StatefulWidget {
//   const work({super.key});
//
//   @override
//   State<work> createState() => _workState();
// }
//
// class _workState extends State<work> {
//   @override
//   Future<void> fetchWorkData() async {
//     String url =
//         "https://mobileappapi.onrender.com/api/work/all"; // Replace with your API URL
//
//     try {
//       var response = await http.get(Uri.parse(url));
//
//       if (response.statusCode == 200) {
//         var jsonData = jsonDecode(response.body);
//         print("Fetched Data: $jsonData"); // Debugging
//         // addWorkTypeController.updateWorkData(jsonData);
//       } else {
//         print("Failed to fetch data: ${response.body}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Obx(() {
//             if (addWorkTypeController.workData.isEmpty) {
//               return Center(
//                   child:
//                       CircularProgressIndicator()); // Show loader if data is empty
//             }
//
//             var workList = addWorkTypeController.workData.entries
//                 .expand((entry) => entry.value)
//                 .toList();
//
//             return GridView.builder(
//               padding: EdgeInsets.all(18.0),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.78,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemCount: workList.length,
//               itemBuilder: (context, index) {
//                 var site = workList[index];
//
//                 return GestureDetector(
//                   onTap: () {
//                     Get.toNamed('/FacilitiesListView');
//                   },
//                   child: Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     color: Colors.blue,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   site.workType ?? "No Work Type",
//                                   // Handle null safely
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               PopupMenuButton<String>(
//                                 onSelected: (value) {
//                                   if (value == "edit") {
//                                     // Handle edit
//                                   } else if (value == "remove") {
//                                     // Handle remove
//                                   } else if (value == "disable") {
//                                     // Handle disable
//                                   }
//                                 },
//                                 itemBuilder: (context) => [
//                                   PopupMenuItem(
//                                       value: "edit", child: Text("Edit")),
//                                   PopupMenuItem(
//                                       value: "remove", child: Text("Remove")),
//                                   PopupMenuItem(
//                                       value: "disable", child: Text("Disable")),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Image.asset("assets/images/hopital1.png"),
//                         SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
//
// class field extends StatefulWidget {
//   const field({super.key});
//
//   @override
//   State<field> createState() => _fieldState();
// }
//
// class _fieldState extends State<field> {
//   List<FacilityModel> facilities = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchFacilities();
//   }
//
//   Future<void> fetchFacilities() async {
//     String url =
//         "https://yourapi.com/api/facilities"; // Replace with your API URL
//
//     try {
//       final response = await http.get(Uri.parse(url));
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           facilities = (data["facilities"] as List)
//               .map((facility) => FacilityModel.fromJson(facility))
//               .toList();
//         });
//       } else {
//         print("Failed to load facilities: ${response.body}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Facilities")),
//       body: facilities.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loader
//           : ListView.builder(
//               itemCount: facilities.length,
//               itemBuilder: (context, index) {
//                 var facility = facilities[index];
//                 return ListTile(
//                   title: Text(facility.fieldName),
//                   subtitle: Text("Head: ${facility.headName}"),
//                   trailing: IconButton(
//                     icon: Icon(Icons.edit),
//                     onPressed: () {
//                       //  editFacility(context, facility.id, facility.fieldName, facility.fieldImage);
//                     },
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
//
// class FacilityModel {
//   final int id;
//   final String fieldName;
//   final double latitude;
//   final double longitude;
//   final double proximity;
//   final String headName;
//   final String mobileNumber;
//   final String fieldImage;
//
//   FacilityModel({
//     required this.id,
//     required this.fieldName,
//     required this.latitude,
//     required this.longitude,
//     required this.proximity,
//     required this.headName,
//     required this.mobileNumber,
//     required this.fieldImage,
//   });
//
//   factory FacilityModel.fromJson(Map<String, dynamic> json) {
//     return FacilityModel(
//       id: json["ID"],
//       fieldName: json["FieldName"] ?? "",
//       latitude: json["Latitude"].toDouble(),
//       longitude: json["Longitude"].toDouble(),
//       proximity: json["Proximity"].toDouble(),
//       headName: json["HeadName"] ?? "",
//       mobileNumber: json["MobileNumber"],
//       fieldImage: json["FieldImage"],
//     );
//   }
// }
//
// class FacilityScreen extends StatefulWidget {
//   @override
//   _FacilityScreenState createState() => _FacilityScreenState();
// }
//
// class _FacilityScreenState extends State<FacilityScreen> {
//   List<FacilityModel> facilities = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchFacilities();
//   }
//
//   Future<void> fetchFacilities() async {
//     String url =
//         "https://yourapi.com/api/facilities"; // Replace with your API URL
//
//     try {
//       final response = await http.get(Uri.parse(url));
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           facilities = (data["facilities"] as List)
//               .map((facility) => FacilityModel.fromJson(facility))
//               .toList();
//         });
//       } else {
//         print("Failed to load facilities: ${response.body}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Facilities")),
//       body: facilities.isEmpty
//           ? Center(child: CircularProgressIndicator()) // Show loader
//           : ListView.builder(
//               itemCount: facilities.length,
//               itemBuilder: (context, index) {
//                 var facility = facilities[index];
//                 return ListTile(
//                   title: Text(facility.fieldName),
//                   subtitle: Text("Head: ${facility.headName}"),
//                   trailing: IconButton(
//                     icon: Icon(Icons.edit),
//                     onPressed: () {
//                       //  editFacility(context, facility.id, facility.fieldName, facility.fieldImage);
//                     },
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
//
// class hide extends StatefulWidget {
//   const hide({super.key});
//
//   @override
//   State<hide> createState() => _hideState();
// }
//
// class _hideState extends State<hide> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           PopupMenuItem<SampleItem>(
//             value: SampleItem.itemTwo,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(TranslationService.translate("Disable"),
//                     style: TextStyle(fontSize: 18, color: Colors.black)),
//                 Switch(
//                   value: userListSiteHeaderController.isDisabled,
//                   onChanged: (value) {
//                     setState(() {
//                       userListSiteHeaderController.isDisabled = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//
// // Outside the PopupMenu, wrap the ListView properly
//           SizedBox(
//             height: 400,
//             child: IgnorePointer(
//               ignoring: userListSiteHeaderController.isDisabled,
//               child: ListView(
//                 physics: AlwaysScrollableScrollPhysics(),
//                 shrinkWrap: true, // Ensures it doesn't take infinite height
//                 children:
//                     addSiteHeadController.siteheadData.entries.map((entry) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           entry.key,
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       ...entry.value.map((site) => ListTile(
//                             leading: CircleAvatar(
//                               radius: 30,
//                               backgroundImage:
//                                   AssetImage("assets/images/boy.png"),
//                             ),
//                             title: Text(
//                               TranslationService.translate(
//                                   "${site.firstName} ${site.lastName}"),
//                             ),
//                             subtitle:
//                                 Text("${site.field}\n${site.fieldSiteName}"),
//                             isThreeLine: true,
//                           ))
//                     ],
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Model class for Post
// class Post {
//   final int id;
//   final String title;
//   final String body;
//
//   Post({required this.id, required this.title, required this.body});
//
//   // Factory method to create Post object from JSON
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }
//
// //
// // class PostListScreen extends StatefulWidget {
// //   @override
// //   _PostListScreenState createState() => _PostListScreenState();
// // }
// //
// // class _PostListScreenState extends State<PostListScreen> {
// //   List<Siteheadmodeldata> posts = [];
// //   bool isLoading = true;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchPosts(); // Call API on screen load
// //   }
// //
// //   // Fetch data from API (GET method)
// //   Future<void> fetchPosts() async {
// //     final response = await http.get(
// //         Uri.parse("https://jsonplaceholder.typicode.com/posts"));
// //
// //     if (response.statusCode == 200) {
// //       List<dynamic> data = json.decode(response.body);
// //       setState(() {
// //         posts = data.map((json) => Siteheadmodeldata.fromJson(json)).toList();
// //         isLoading = false;
// //       });
// //     } else {
// //       throw Exception("Failed to load posts");
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Fetch API Data in ListView")),
// //       body: isLoading
// //           ? Center(
// //           child: CircularProgressIndicator()) // Show loader while fetching
// //           : ListView.builder(
// //         itemCount: posts.length,
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             // title: Text(posts,
// //             //     style: TextStyle(fontWeight: FontWeight.bold)),
// //             // subtitle: Text(posts[index].fieldSiteName),
// //             // leading: CircleAvatar(child: Text(posts[index].id.toString())),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
//
// void main() {
//   runApp(MyApp());
// }
//
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: FieldListScreen(),
// //     );
// //   }
// // }
//
// // Model Class
// class FieldItem {
//   int id;
//   String fieldName;
//   String fieldImage;
//   int count;
//
//   FieldItem(
//       {required this.id,
//       required this.fieldName,
//       required this.fieldImage,
//       required this.count});
//
//   factory FieldItem.fromJson(Map<String, dynamic> json) {
//     return FieldItem(
//       id: json['id'],
//       fieldName: json['FieldName'],
//       fieldImage: json['FieldImage'],
//       count: json['Count'],
//     );
//   }
// }
//
// class FieldListScreen extends StatefulWidget {
//   @override
//   _FieldListScreenState createState() => _FieldListScreenState();
// }
//
// class _FieldListScreenState extends State<FieldListScreen> {
//   List<FieldItem> fields = [];
//
//   @override
//   void initState() {
//     super.initState();
//     loadJsonData();
//   }
//
//   // Simulating JSON fetching and parsing
//   void loadJsonData() {
//     String jsonData = '''{
//     "Field": [
//       {"id": 3, "FieldName": "Hospital", "FieldImage": "img_1.jpg", "Count": 0},
//       {"id": 5, "FieldName": "Hospital", "FieldImage": "img_1.jpg", "Count": 0},
//       {"id": 6, "FieldName": "College", "FieldImage": "img_1.jpg", "Count": 0},
//       {"id": 8, "FieldName": "College", "FieldImage": "img_1.jpg", "Count": 0},
//       {"id": 9, "FieldName": "College", "FieldImage": "img_1.jpg", "Count": 0},
//       {"id": 10, "FieldName": "College", "FieldImage": "img_1.jpg", "Count": 0}
//     ]
//   }''';
//
//     final parsedJson = json.decode(jsonData);
//     setState(() {
//       fields = (parsedJson['Field'] as List)
//           .map((item) => FieldItem.fromJson(item))
//           .toList();
//     });
//   }
//
//   // Function to increment count
//   void incrementCount(int index) {
//     setState(() {
//       fields[index].count++;
//     });
//   }
//
//   // Function to decrement count
//   void decrementCount(int index) {
//     setState(() {
//       if (fields[index].count > 0) {
//         fields[index].count--;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Field List")),
//       body: ListView.builder(
//         itemCount: fields.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             elevation: 5,
//             child: ListTile(
//               // leading: Image.asset('assets/${fields[index].fieldImage}',
//               //     width: 50, height: 50, fit: BoxFit.cover),
//               title: Text(fields[index].fieldName),
//               subtitle: Text("Count: ${fields[index].count}"),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.remove, color: Colors.red),
//                     onPressed: () => decrementCount(index),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.add, color: Colors.green),
//                     onPressed: () => incrementCount(index),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class CardListView extends StatefulWidget {
//   @override
//   _CardListViewState createState() => _CardListViewState();
// }
//
// class _CardListViewState extends State<CardListView> {
//   String responseMessage = "No response yet";
//
//   Future<void> sendPostRequest() async {
//     final url =
//         Uri.parse('https://jsonplaceholder.typicode.com/posts'); // Example API
//     final headers = {'Content-Type': 'application/json'};
//     final body = jsonEncode({
//       "title": "Flutter POST Request",
//       "body": "This is a test post request",
//       "userId": 1
//     });
//
//     try {
//       final response = await http.post(url, headers: headers, body: body);
//
//       if (response.statusCode == 201) {
//         setState(() {
//           responseMessage = "Success: ${jsonDecode(response.body)['title']}";
//         });
//       } else {
//         setState(() {
//           responseMessage = "Error: ${response.statusCode} - ${response.body}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         responseMessage = "Failed to connect: $e";
//       });
//     }
//   }
//
//   List<Map<String, String>> items = [
//     {"title": "Flutter", "subtitle": "Build beautiful apps"},
//     {"title": "Dart", "subtitle": "Fast programming language"},
//   ];
//
//   void addItem() {
//     setState(() {
//       items.add({
//         "title": "New Item ${items.length + 1}",
//         "subtitle": "Description for item ${items.length + 1}",
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Dynamic Card ListView")),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             elevation: 5, // Adds shadow effect
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Colors.blue,
//                 child: Text(items[index]["title"]![0]), // First letter
//               ),
//               title: Text(items[index]["title"]!),
//               subtitle: Text(items[index]["subtitle"]!),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete, color: Colors.red),
//                 onPressed: () {
//                   setState(() {
//                     items.removeAt(index); // Remove item
//                   });
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: addItem,
//         child: Icon(Icons.add),
//         tooltip: "Add New Item",
//       ),
//     );
//   }
// }
//
// class Hospital {
//   int id;
//   String firstName;
//   String lastName;
//   String mobileNumber;
//   String fieldSiteName;
//   String? image;
//
//   Hospital({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.mobileNumber,
//     required this.fieldSiteName,
//     this.image,
//   });
//
//   // Convert JSON to Dart Model
//   factory Hospital.fromJson(Map<String, dynamic> json) {
//     return Hospital(
//       id: json["Id"],
//       firstName: json["FirstName"],
//       lastName: json["LastName"],
//       mobileNumber: json["MobileNumber"],
//       fieldSiteName: json["FieldSiteName"],
//       image: json["Image"], // Image may be null
//     );
//   }
// }
//
// class HospitalListScreen extends StatefulWidget {
//   @override
//   _HospitalListScreenState createState() => _HospitalListScreenState();
// }
//
// class _HospitalListScreenState extends State<HospitalListScreen> {
//   // Fetch data from API
//   Future<List<Hospital>> fetchHospitals() async {
//     final response = await http
//         .get(Uri.parse('https://mobileappapi.onrender.com/api/sitehead/all'));
//
//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonData = jsonDecode(response.body);
//       List<dynamic> hospitalList = jsonData["Hospital"]; // Extract List
//
//       return hospitalList.map((json) => Hospital.fromJson(json)).toList();
//     } else {
//       throw Exception("Failed to load hospital data");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Hospital List")),
//       body: FutureBuilder<List<Hospital>>(
//         future: fetchHospitals(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator()); // Loading state
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: Text("Error: ${snapshot.error}")); // Error state
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No hospitals found")); // No data state
//           } else {
//             List<Hospital> hospitals = snapshot.data!;
//
//             return ListView.builder(
//               itemCount: hospitals.length,
//               itemBuilder: (context, index) {
//                 Hospital hospital = hospitals[index];
//
//                 return ListTile(
//                   leading: Image.asset("assets/images/1.png",
//                       width: 50, height: 50, fit: BoxFit.cover),
//
//                   title: Text("${hospital.firstName} ${hospital.lastName}"),
//                   subtitle: Text(
//                       "${hospital.fieldSiteName}\n${hospital.mobileNumber}"),
//                   isThreeLine: true,
//                   // trailing: Icon(Icons.arrow_forward_ios),
//                   onTap: () {
//                     // print("Tapped on: ${hospital.firstName}");
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// // void main() {
// //   runApp(MyApp());
// // }
//
// // class DynamicListView extends StatefulWidget {
// //   @override
// //   _DynamicListViewState createState() => _DynamicListViewState();
// // }
// //
// // class _DynamicListViewState extends State<DynamicListView> {
// //   List<Map<String, dynamic>> items = [];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchItems(); // Fetch items when the app starts
// //   }
// //
// //   SiteheadApi() async {
// //     // print('userId ${memberId}');
// //     print("Event create api");
// //     final String? token = localStorage.read('api_token');
// //     final String? memberId = localStorage.read('member_id').toString();
// //
// //     print('FirstName ${addSiteHeadController.FirstNameController.text}');
// //     print('LastName ${addSiteHeadController.LastNameController.text}');
// //     print('MobileNumber ${addSiteHeadController.MobileNumberController.text}');
// //     print('Field ${addSiteHeadController.FieldController.text}');
// //     print(
// //         'FieldSiteName ${addSiteHeadController.FieldSiteNamerController.text}');
// //     print('Password ${addSiteHeadController.EnterPasswordController.text}');
// //     print(
// //         'ConfirmPassword ${addSiteHeadController.ConfirmPasswordController.text}');
// //     print('Image ${addSiteHeadController.images.value}');
// //     print('userId ${memberId}');
// //     try {
// //       final response = await http.post(
// //         Uri.parse('https://mobileappapi.onrender.com/api/sitehead/create'),
// //         // Change this to your actual API
// //         headers: {
// //           'Content-Type': 'application/json',
// //           "Accept": "application/json",
// //         },
// //
// //         body: jsonEncode({
// //           "FirstName": addSiteHeadController.FirstNameController.text,
// //           "LastName": addSiteHeadController.LastNameController.text,
// //           "MobileNumber": addSiteHeadController.MobileNumberController.text,
// //           "Field": addSiteHeadController.FieldController.text,
// //           "FieldSiteName": addSiteHeadController.FieldSiteNamerController.text,
// //           "Password": addSiteHeadController.EnterPasswordController.text,
// //           "ConfirmPassword":
// //               addSiteHeadController.ConfirmPasswordController.text,
// //           "Image": addSiteHeadController.images.value,
// //         }),
// //       );
// //
// //       if (response.statusCode == 201) {
// //         print("Data added successfully: ${response.body}");
// //         // fetchHospitals();
// //       } else {
// //         print("Failed with status code: ${response.statusCode}");
// //         print("Response: ${response.body}");
// //       }
// //     } catch (e) {
// //       print("Error: $e");
// //     }
// //   }
// //
// //   // GET Request to Fetch Data
// //   Future<void> fetchItems() async {
// //     final response = await http.get(
// //         Uri.parse('https://mobileappapi.onrender.com/api/sitehead/create'));
// //
// //     if (response.statusCode == 200) {
// //       Map<String, Hospital> newItem = jsonDecode(response.body);
// //       List<Hospital> data = jsonDecode(response.body);
// //       // shifttimeformController.shifttimeApiData.value = fa(data);
// //       setState(() {
// //         items = data
// //             .map((item) => {
// //                   "id": newItem["id"],
// //                   "WorkType": newItem["WorkType"],
// //                   "ShiftName": newItem["ShiftName"],
// //                   "ShiftFrom": newItem["ShiftFrom"],
// //                   "ShiftTo": newItem["ShiftTo"],
// //                 })
// //             .toList();
// //       });
// //     } else {
// //       throw Exception("Failed to load data");
// //     }
// //   }
// //
// //   // POST Request to Add New Data
// //   Future<void> addItem() async {
// //     final response = await http.post(
// //       Uri.parse('https://mobileappapi.onrender.com/api/shift/create'),
// //       headers: {"Content-Type": "application/json"},
// //       body: jsonEncode({
// //         "WorkType": "House Keeping",
// //         "ShiftName": "Morning Shift",
// //         "ShiftFrom": "08:00:00",
// //         "ShiftTo": "16:00:00",
// //         "userId": 16,
// //       }),
// //     );
// //
// //     if (response.statusCode == 201) {
// //       Map<String, ShiftTimeModel> newItem = jsonDecode(response.body);
// //       setState(() {
// //         items.insert(0, {
// //           "id": newItem["id"],
// //           "WorkType": newItem["WorkType"],
// //           "ShiftName": newItem["ShiftName"],
// //           "ShiftFrom": newItem["ShiftFrom"],
// //           "ShiftTo": newItem["ShiftTo"],
// //         });
// //       });
// //     } else {
// //       throw Exception("Failed to add data");
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Dynamic ListView with API")),
// //       body: items.isEmpty
// //           ? Center(child: CircularProgressIndicator())
// //           : ListView.builder(
// //               itemCount: items.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   leading:
// //                       CircleAvatar(child: Text(items[index]["id"].toString())),
// //                   title: Text(items[index]["title"]),
// //                 );
// //               },
// //             ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: addItem,
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
import 'dart:convert';
import 'dart:io';
import 'package:attendanceapp/CommenFiles/getXcontroller.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'Screens/Admin/AddNewFacilityScreen/model/facilitymodeldata.dart';

// class FacilityApiService {
//   // final String baseUrl = "https://yourapi.com"; // Replace with actual API URL
//
//   /// **Fetch Facilities**
//
//   Future<List<FacilityModel>> fetchFacilities() async {
//     final url = Uri.parse('https://mobileappapi.onrender.com/api/facility/all');
//     final response = await http.get(url);
//
//     print("Response Status Code: ${response.statusCode}");
//     print("Response Body: ${response.body}");
//
//     if (response.statusCode == 200) {
//       try {
//         final decodedData = jsonDecode(response.body);
//         print("Decoded Data: $decodedData");
//         print("Decoded Data Type: ${decodedData.runtimeType}");
//         print("Map Keys: ${decodedData.keys}");
//
//         if (decodedData.containsKey("Field")) {
//           List<dynamic> facilitiesList = decodedData["Field"]; // Correct key
//           return facilitiesList
//               .map((json) => FacilityModel.fromJson(json))
//               .toList();
//         } else {
//           throw Exception(
//               "Unexpected JSON structure. Available keys: ${decodedData.keys}");
//         }
//       } catch (e) {
//         throw Exception("Error parsing JSON: $e");
//       }
//     } else {
//       throw Exception("Failed to load facilities: ${response.statusCode}");
//     }
//   }
//
//   /// **POST: Add New Facility**
//   Future<bool> addFacility(FacilityModel facility) async {
//     final url = Uri.parse(
//         'https://mobileappapi.onrender.com/api/facility/create'); // Adjust endpoint
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({"FieldName": "College", "FieldImage": "img_1.jpg"}),
//     );
//
//     return response.statusCode == 201 || response.statusCode == 200;
//   }
//
//   /// **PUT: Update Existing Facility**
//   Future<bool> updateFacility(
//       int facilityId, FacilityModel updatedFacility) async {
//     final url = Uri.parse(
//         'https://mobileappapi.onrender.com/api/facility/update/$facilityId'); // Adjust endpoint
//     final response = await http.put(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(updatedFacility.fieldName),
//     );
//
//     return response.statusCode == 200;
//   }
// }
//
// class FacilityListScreen extends StatefulWidget {
//   @override
//   _FacilityListScreenState createState() => _FacilityListScreenState();
// }
//
// class _FacilityListScreenState extends State<FacilityListScreen> {
//   late Future<List<FacilityModel>> futureFacilities;
//
//   @override
//   void initState() {
//     super.initState();
//     futureFacilities = FacilityApiService().fetchFacilities();
//   }
//
//   void refreshList() {
//     setState(() {
//       futureFacilities = FacilityApiService().fetchFacilities();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Facilities")),
//       body: FutureBuilder<List<FacilityModel>>(
//         future: futureFacilities,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No facilities found."));
//           }
//
//           List<FacilityModel> facilities = snapshot.data!;
//           return ListView.builder(
//             itemCount: facilities.length,
//             itemBuilder: (context, index) {
//               FacilityModel facility = facilities[index];
//               return ListTile(
//                 title: Text(facility.fieldName),
//                 subtitle: Text(facility.fieldImage),
//                 trailing: IconButton(
//                   icon: Icon(Icons.edit),
//                   onPressed: () => updateFacility(facility),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => addNewFacility(),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   /// **Function to Add New Facility**
//   void addNewFacility() async {
//     FacilityModel newFacility = FacilityModel(
//       id: 1,
//       fieldName: addnewfacilitycontroller.nameController.text,
//       fieldImage: addnewfacilitycontroller.imageController.text,
//     );
//
//     bool success = await FacilityApiService().addFacility(newFacility);
//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Facility added successfully!")));
//       refreshList();
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Failed to add facility.")));
//     }
//   }
//
//   /// **Function to Update Facility**
//
//   // void updateFacility(FacilityModel facility) async {
//   //   FacilityModel updatedFacility = FacilityModel(
//   //     id: 1,
//   //     fieldName: addnewfacilitycontroller.nameController.text,
//   //     fieldImage: addnewfacilitycontroller.imageController.text,
//   //   );

// bool success = await FacilityApiService()
//     .updateFacility();
// if (success) {
//   ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Facility updated successfully!")));
//   refreshList();
// } else {
//   ScaffoldMessenger.of(context)
//       .showSnackBar(SnackBar(content: Text("Failed to update facility.")));
// }
//   }
// }
import 'package:flutter/material.dart';

class DisableListExamples extends StatefulWidget {
  @override
  _DisableListExamplesState createState() => _DisableListExamplesState();
}

class _DisableListExamplesState extends State<DisableListExamples> {
  // Sample data list
  List<SiteheadModel> siteheadData = [
    SiteheadModel(
      id: 1,
      firstName: "John",
      lastName: "Doe",
      mobileNumber: "1234567890",
      field: "Engineering",
      fieldSiteName: "Site A",
      password: "pass123",
      confirmPassword: "pass123",
      image: "assets/images/boy.png",
    ),
    SiteheadModel(
      id: 2,
      firstName: "Jane",
      lastName: "Smith",
      mobileNumber: "0987654321",
      field: "Construction",
      fieldSiteName: "Site B",
      password: "pass123",
      confirmPassword: "pass123",
      image: "assets/images/boy.png",
    ),
  ];

  // Track disabled items
  Set<int> disabledItems = {};

  // Toggle disable state
  void toggleDisableItem(int id) {
    setState(() {
      if (disabledItems.contains(id)) {
        disabledItems.remove(id);
      } else {
        disabledItems.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Disable Feature Example")),
      body: ListView.builder(
        itemCount: siteheadData.length,
        itemBuilder: (context, index) {
          var site = siteheadData[index];
          bool isDisabled = disabledItems.contains(site.id);

          return Opacity(
            opacity: isDisabled ? 0.5 : 1.0,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage:
                    AssetImage(site.image ?? "assets/images/boy.png"),
              ),
              title: Text(
                "${site.firstName} ${site.lastName}",
                style: TextStyle(
                  color: isDisabled ? Colors.grey : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("${site.field}\n${site.fieldSiteName}"),
              isThreeLine: true,
              trailing: PopupMenuButton<String>(
                onSelected: (String value) {
                  if (value == "Disable" || value == "Enable") {
                    toggleDisableItem(site.id);
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(value: "Edit", child: Text("Edit")),
                  PopupMenuItem(value: "Remove", child: Text("Remove")),
                  PopupMenuItem(
                    value: isDisabled ? "Enable" : "Disable",
                    child: Text(isDisabled ? "Enable" : "Disable"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// SiteheadModel class
class SiteheadModel {
  int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String field;
  String fieldSiteName;
  String password;
  String confirmPassword;
  String? image;

  SiteheadModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.field,
    required this.fieldSiteName,
    required this.password,
    required this.confirmPassword,
    this.image,
  });

  factory SiteheadModel.fromMap(Map<String, dynamic> json) => SiteheadModel(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        mobileNumber: json["MobileNumber"],
        field: json["Field"],
        fieldSiteName: json["FieldSiteName"],
        password: json["Password"],
        confirmPassword: json["ConfirmPassword"],
        image: json["Image"],
      );

  Map<String, dynamic> toMap() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "MobileNumber": mobileNumber,
        "Field": field,
        "FieldSiteName": fieldSiteName,
        "Password": password,
        "ConfirmPassword": confirmPassword,
        "Image": image,
      };
}

void main() {
  runApp(MyApppost());
}

class MyApppost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostListScreen(),
    );
  }
}

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  Future<void> uploadData() async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile == null) {
      print("No image selected");
      return;
    }

    File imageFile = File(pickedFile.path);
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://mobileappapi.onrender.com/api/facility/create'),
    );

    request.fields['FieldName'] = 'College';
    request.files.add(
      await http.MultipartFile.fromPath('FieldImage', imageFile.path),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Upload successful");
    } else {
      print("Upload failed with status: ${response.statusCode}");
    }
  }

  // Future<List<FacilityModel>> fetchData() async {
  //   final url = Uri.parse(
  //       'https://mobileappapi.onrender.com/api/facility/create'); // Replace with your API URL
  //   final response = await http.post(url, body: {
  //     "FieldName": "College",
  //     "FieldImage": "img_1.jpg"
  //   }); // Add body if needed
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ListView with POST Method')),
        body:
            // FutureBuilder<List<Field>>(
            //   future: fetchData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return Center(child: CircularProgressIndicator());
            //     } else if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //       return Center(child: Text('No data found'));
            //     }
            //
            //     return ListView.builder(
            //       itemCount: snapshot.data!.length,
            //       itemBuilder: (context, index) {
            //         return ListTile(
            //           title: Text(snapshot.data![index].fieldName.toString()),
            //           // Adjust according to API response
            //           subtitle: Text(snapshot.data![index].fieldName.toString()),
            //         );
            //       },
            //     );
            //   },
            // ),
            ElevatedButton(
          onPressed: uploadData,
          child: Text("Upload"),
        ));
  }
}

class HomeScreenname extends StatefulWidget {
  @override
  _HomeScreennameState createState() => _HomeScreennameState();
}

class _HomeScreennameState extends State<HomeScreenname> {
  final ApiService apiService = ApiService();
  FieldModel? fieldData;

  @override
  void initState() {
    super.initState();
    fetchFields();
  }

  void sendData() {
    FieldModel fieldData = FieldModel(field: [
      FieldItem(id: 3, fieldName: "college", fieldImage: "sdf")
    ]); // ✅ Ensure List, not Set

    postFieldData(fieldData);
  }

  // 📌 Fetch Fields from API
  Future<void> fetchFields() async {
    FieldModel? data = await apiService.getFields();
    if (data != null) {
      setState(() {
        fieldData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("GET API Example")),
        body: fieldData == null
            ? Center(child: CircularProgressIndicator())
            : ElevatedButton(onPressed: sendData, child: Text("data"))
        // ListView.builder(
        //   itemCount: fieldData!.field.length,
        //   itemBuilder: (context, index) {
        //     final item = fieldData!.field[index];
        //     return ListTile(
        //       title: Text(item.fieldName),
        //       subtitle: Text("ID: ${item.id}"),
        //     );
        //   },
        // ),

        );
  }
}

class ApiService {
  //static const String baseUrl = "https://yourapi.com";

  // 📌 GET Request
  Future<FieldModel?> getFields() async {
    final url = Uri.parse("https://mobileappapi.onrender.com/api/facility/all");

    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        // Parse JSON response
        final decodedJson = jsonDecode(response.body);
        return FieldModel.fromJson(decodedJson);
      } else {
        print("API Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}

// 📌 POST Request
Future<void> postFieldData(FieldModel fieldData) async {
  final url =
      Uri.parse("https://mobileappapi.onrender.com/api/facility/create");

  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        {"FieldName": "Theater", "FieldImage": "img_1.jpg"}
      }), // Convert model to JSON
    );

    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Data posted successfully!");
    } else {
      print("API Error: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
}

class FieldModel {
  List<FieldItem> field;

  FieldModel({required this.field});

  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      field: (json['Field'] as List)
          .map((item) => FieldItem.fromJson(item))
          .toList(),
    );
  }
}

class FieldItem {
  int id;
  String fieldName;
  String fieldImage;

  FieldItem(
      {required this.id, required this.fieldName, required this.fieldImage});

  factory FieldItem.fromJson(Map<String, dynamic> json) {
    return FieldItem(
      id: json['id'],
      fieldName: json['FieldName'],
      fieldImage: json['FieldImage'],
    );
  }
}
