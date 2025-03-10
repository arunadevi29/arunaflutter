import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'Admin/FacilityCardDetails/model/FacilitylistModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart'; // For snackbar messages

class AddFieldPage extends StatelessWidget {
  final TextEditingController fieldNameController = TextEditingController();
  final TextEditingController categeryController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController proximityController = TextEditingController();
  final TextEditingController headNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  Future<void> postCollegeData() async {
    final String url =
        "https://mobileappapi.onrender.com/api/fieldstate/create"; // API URL

    Map<String, dynamic> data = {
      "Category": categeryController.text.trim(),
      "FieldName": fieldNameController.text.trim(),
      "Latitude": latitudeController.text.trim(),
      "Longitude": longitudeController.text.trim(),
      "Proximity": proximityController.text.trim(),
      "HeadName": headNameController.text.trim(),
      "MobileNumber": mobileNumberController.text.trim(),
      "FieldImage": "school.png" // Check if server expects actual file upload
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Data posted successfully: ${response.body}");
      } else {
        print("Failed to post data: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void main() {
    postCollegeData();
  }

  Future<void> addFieldstatepostapi(
    final int id,
    final int? fieldId,
    final String fieldName,
    final double latitude,
    final double longitude,
    final double proximity,
    final String headName,
    final String mobileNumber,
    final String fieldImage,
  ) async {
    final url =
        Uri.parse("https://mobileappapi.onrender.com/api/fieldstate/create");

    final Map<String, dynamic> requestBody = {
      "id": id,
      "FieldName": fieldName,
      "FieldImage": fieldImage,
      "latitude": latitude,
      "longitude": longitude,
      "proximity": proximity,
      "headName": headName,
      "mobileNumber": mobileNumber,
      "fieldId": fieldId,
    };

    print("📩 Sending Request: $requestBody");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      print("🔍 Response Status Code: ${response.statusCode}");
      print("🔍 Response Body: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar("Success", "✅ Item added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "❌ Failed to add field: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print("⚠ Error: $e");
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Facility")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: categeryController,
                decoration: InputDecoration(labelText: " Name")),
            TextField(
                controller: fieldNameController,
                decoration: InputDecoration(labelText: "Field Name")),
            TextField(
                controller: latitudeController,
                decoration: InputDecoration(labelText: "Latitude"),
                keyboardType: TextInputType.number),
            TextField(
                controller: longitudeController,
                decoration: InputDecoration(labelText: "Longitude"),
                keyboardType: TextInputType.number),
            TextField(
                controller: proximityController,
                decoration: InputDecoration(labelText: "Proximity"),
                keyboardType: TextInputType.number),
            TextField(
                controller: headNameController,
                decoration: InputDecoration(labelText: "Head Name")),
            TextField(
                controller: mobileNumberController,
                decoration: InputDecoration(labelText: "Mobile Number"),
                keyboardType: TextInputType.phone),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                postCollegeData();
                // addFieldstatepostapi(
                //   1,
                //   4,
                //   fieldNameController.text,
                //   double.parse(latitudeController.text),
                //   double.parse(longitudeController.text),
                //   double.parse(proximityController.text),
                //   headNameController.text,
                //   mobileNumberController.text,
                //   "school.png".toString(),
                // );
              },
              child: Text("Add Field"),
            ),
          ],
        ),
      ),
    );
  }
}

class FacilityModeldata {
  final int id;
  final int fieldId;
  final String fieldName;
  final double latitude;
  final double longitude;
  final double proximity;
  final String headName;
  final String mobileNumber;
  final String fieldImage;

  FacilityModeldata({
    required this.id,
    required this.fieldId,
    required this.fieldName,
    required this.latitude,
    required this.longitude,
    required this.proximity,
    required this.headName,
    required this.mobileNumber,
    required this.fieldImage,
  });

  // Factory method to convert JSON into an object
  factory FacilityModeldata.fromJson(Map<String, dynamic> json) {
    return FacilityModeldata(
      id: json["ID"],
      fieldId: json["FieldID"],
      fieldName: json["FieldName"],
      latitude: json["Latitude"].toDouble(),
      longitude: json["Longitude"].toDouble(),
      proximity: json["Proximity"].toDouble(),
      headName: json["HeadName"],
      mobileNumber: json["MobileNumber"],
      fieldImage: json["FieldImage"],
    );
  }

  // Convert object to JSON format for POST requests
  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "FieldID": fieldId,
      "FieldName": fieldName,
      "Latitude": latitude,
      "Longitude": longitude,
      "Proximity": proximity,
      "HeadName": headName,
      "MobileNumber": mobileNumber,
      "FieldImage": fieldImage,
    };
  }
}

class FacilityListScreen extends StatelessWidget {
  @override
  Future<List<FacilityModeldata>> fetchFacilities() async {
    final String apiUrl =
        "https://mobileappapi.onrender.com/api/fieldstate/all"; // Replace with actual API URL

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> facilitiesList = data["facilities"]; // Extract list

        return facilitiesList
            .map((json) => FacilityModeldata.fromJson(json))
            .toList();
      } else {
        throw Exception("Failed to load facilities: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> postFacility(FacilityModel facility) async {
    final String apiUrl =
        "https://mobileappapi.onrender.com/api/fieldstate/create"; // Your API URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(facility.toString()), // Convert model to JSON
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "✅ Facility added successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "❌ Failed to add facility: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Facilities")),
      body: FutureBuilder<List<FacilityModeldata>>(
        future: fetchFacilities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}")); // Error
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available")); // No Data
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
                  subtitle: Text("Proximity: ${facility.proximity} km"),
                  trailing: Icon(Icons.location_on),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FieldModel {
  int id;
  int fieldID;
  String fieldName;
  double latitude;
  double longitude;
  double proximity;
  String headName;
  String mobileNumber;
  String fieldImage;

  FieldModel({
    required this.id,
    required this.fieldID,
    required this.fieldName,
    required this.latitude,
    required this.longitude,
    required this.proximity,
    required this.headName,
    required this.mobileNumber,
    required this.fieldImage,
  });

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "FieldID": fieldID,
      "FieldName": fieldName,
      "Latitude": latitude,
      "Longitude": longitude,
      "Proximity": proximity,
      "HeadName": headName,
      "MobileNumber": mobileNumber,
      "FieldImage": fieldImage,
    };
  }
}

class FacilityModelname {
  int id;
  String fieldName;
  double latitude;
  double longitude;
  double proximity;
  String headName;
  String mobileNumber;
  String fieldImage;

  FacilityModelname({
    required this.id,
    required this.fieldName,
    required this.latitude,
    required this.longitude,
    required this.proximity,
    required this.headName,
    required this.mobileNumber,
    required this.fieldImage,
  });

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "FieldName": fieldName,
      "Latitude": latitude,
      "Longitude": longitude,
      "Proximity": proximity,
      "HeadName": headName,
      "MobileNumber": mobileNumber,
      "FieldImage": fieldImage,
    };
  }
}

class AddFieldScreen extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController fieldidController = TextEditingController();
  final TextEditingController fieldNameController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController headNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController distance = TextEditingController();

  Future<void> postFacilityname(FacilityModelname facility) async {
    final String apiUrl =
        "https://mobileappapi.onrender.com/api/fieldstate/create"; // Replace with your actual API URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(facility.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Facility added successfully!");
      } else {
        print("❌ Failed to add facility. Status Code: ${response.statusCode}");
        print("📥 Response: ${response.body}");
      }
    } on http.ClientException catch (e) {
      print("❌ Network Error: ${e.message}");
    } on FormatException catch (e) {
      print("❌ JSON Format Error: ${e.message}");
    } catch (e) {
      print("❌ Unknown Error: $e");
    }
  }

  Future<void> postFacilitys(FieldModel facility) async {
    final String apiUrl =
        "https://mobileappapi.onrender.com/api/fieldstate/create";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(facility.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Facility added successfully!");
      } else {
        print("Failed to add facility. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e"); // ✅ This will catch format errors
    }
  }

  Future<void> postFacilities(List<FieldModel> field) async {
    String apiUrl =
        "https://your-api-url.com/postFacilities"; // Replace with actual API URL

    // Convert the list of FacilityModel to JSON
    Map<String, dynamic> requestBody = {
      "facilities": field.map((facility) => facility.toJson()).toList()
    };

    print("📩 Sending Request: ${jsonEncode(requestBody)}");

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "Category": idController.text,
          "FieldName": fieldNameController.text,
          "Latitude": 14.567890,
          "Longitude": 78.123456,
          "Proximity": 3.2,
          "HeadName": headNameController.text,
          "MobileNumber": mobileController,
          "FieldImage": "school.png".toString()
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Facilities added successfully!");
      } else {
        print(
            "❌ Failed to add facilities. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("⚠ API Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Facility")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "ID"),
            ),
            TextField(
              controller: fieldNameController,
              decoration: InputDecoration(labelText: "Field Name"),
            ),
            TextField(
              controller: latitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Latitude"),
            ),
            TextField(
              controller: longitudeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Longitude"),
            ),
            TextField(
              controller: headNameController,
              decoration: InputDecoration(labelText: "Head Name"),
            ),
            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Mobile Number"),
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: "Image URL"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                int? id = int.tryParse(
                    idController.text.trim()); // Convert to integer

                if (id == null) {
                  print("❌ Error: ID must be a valid number");
                  return; // Stop execution if ID is invalid
                }

                FacilityModelname facility = FacilityModelname(
                  id: id,
                  // Use the parsed integer ID
                  fieldName: fieldNameController.text.trim(),
                  latitude: double.parse(latitudeController.text.trim()),
                  longitude: double.parse(longitudeController.text.trim()),
                  proximity: 3.2,
                  headName: headNameController.text.trim(),
                  mobileNumber: mobileController.text.trim(),
                  fieldImage: "school.png",
                );

                await postFacilityname(facility);
              },

              // // int? id = int.tryParse(idController.text.trim());
              // // int? fieldID = int.tryParse(fieldidController.text.trim());
              // List<FieldModel> facilities = [];
              //
              // await postFacilities(facilities);

              child: Text("Submit Facilities"),
            ),
          ],
        ),
      ),
    );
  }
}

class FacilityModel {
  final int id;
  final String fieldName;
  final String fieldImage;
  final int entryCount;

  FacilityModel({
    required this.id,
    required this.fieldName,
    required this.fieldImage,
    required this.entryCount,
  });

  // Factory constructor to convert JSON to FacilityModel
  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityModel(
      id: json['id'],
      fieldName: json['FieldName'],
      fieldImage: json['FieldImage'],
      entryCount: json['EntryCount'],
    );
  }
}

class ApiServices {
  final String baseUrl = "https://yourapi.com"; // Replace with your API URL

  // 🟢 Fetch Facilities (GET Method)
  Future<List<FacilityModel>> fetchFacilities() async {
    final response = await http
        .get(Uri.parse("https://mobileappapi.onrender.com/api/facility/all"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> fields = data['Field']; // Extract "Field" array

      return fields.map((json) => FacilityModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load facilities");
    }
  }

  // 🔵 Add Facility (POST Method)
  Future<bool> addFacility(FacilityModel facility) async {
    final response = await http.post(
      Uri.parse("https://mobileappapi.onrender.com/api/facility/create"),
      // Replace with actual API endpoint
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "FieldName": facility.fieldName,
        "FieldImage": facility.fieldImage,
        "EntryCount": facility.entryCount,
      }),
    );

    if (response.statusCode == 201) {
      return true; // Successfully added
    } else {
      print("Error: ${response.body}");
      return false; // Failed to add
    }
  }
}

class AddFacilityScreen extends StatefulWidget {
  @override
  _AddFacilityScreenState createState() => _AddFacilityScreenState();
}

class _AddFacilityScreenState extends State<AddFacilityScreen> {
  final ApiServices apiService = ApiServices();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController entryController = TextEditingController();

  void submitData() async {
    FacilityModel newFacility = FacilityModel(
      id: 0, // ID will be auto-generated by the backend
      fieldName: nameController.text,
      fieldImage: imageController.text,
      entryCount: int.tryParse(entryController.text) ?? 0,
    );

    bool isSuccess = await apiService.addFacility(newFacility);

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
              controller: nameController,
              decoration: InputDecoration(labelText: "Facility Name"),
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: "Image URL"),
            ),
            TextField(
              controller: entryController,
              decoration: InputDecoration(labelText: "Entry Count"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                submitData();
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => FacilityListScreen()),
                // );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyAppapp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Facility List',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: FacilityListScreen(),
//     );
//   }
// }
//
// class FacilityListScreen extends StatefulWidget {
//   @override
//   _FacilityListScreenState createState() => _FacilityListScreenState();
// }
//
// class _FacilityListScreenState extends State<FacilityListScreen> {
//   // final ApiService apiService = ApiService();
//   //
//   // Future<List<FacilityModel>> fetchFacilities() async {
//   //   final response = await http
//   //       .get(Uri.parse("https://mobileappapi.onrender.com/api/facility/all"));
//   //
//   //   if (response.statusCode == 200) {
//   //     final data = jsonDecode(response.body);
//   //     List<dynamic> fields = data['Field']; // Extract "Field" array
//   //
//   //     return fields.map((json) => FacilityModel.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception("Failed to load facilities");
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Facilities')),
//       body: FutureBuilder<List<FacilityModel>>(
//         future: addFacility(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//                 child: CircularProgressIndicator()); // Loading Indicator
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: Text('Error: ${snapshot.error}')); // Error Message
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//                 child: Text('No data available')); // Empty Data Message
//           }
//
//           final facilities = snapshot.data!;
//           return ListView.builder(
//             itemCount: facilities.length,
//             itemBuilder: (context, index) {
//               final facility = facilities[index];
//
//               return Card(
//                 margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 child: ListTile(
//                   leading: Image.network(
//                     facility.fieldImage,
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) =>
//                         Icon(Icons.image_not_supported),
//                   ),
//                   title: Text(facility.fieldName),
//                   subtitle: Text("Entries: ${facility.entryCount}"),
//                   trailing: Icon(Icons.arrow_forward_ios, size: 16),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class ApiService {
  final String baseUrl = "https://yourapi.com"; // Replace with your API URL

  // GET Method
  Future<List<Map<String, FacilityModeldata>>> getFields() async {
    final response = await http
        .get(Uri.parse("https://mobileappapi.onrender.com/api/facility/all"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, FacilityModeldata>>.from(data['Field']);
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<List<Map<String, FacilityModeldata>>> getFacilities() async {
    final response = await http
        .get(Uri.parse("https://mobileappapi.onrender.com/api/facility/all"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body); // Decoding JSON response
      return (data['Field'] as List).map((item) {
        return {
          "facility": FacilityModeldata.fromJson(item)
          // Convert to FacilityModeldata
        };
      }).toList();
    } else {
      throw Exception("Failed to load facilities");
    }
  }

  // POST Method
  Future<bool> createField(String fieldName, String fieldImage) async {
    final response = await http.post(
      Uri.parse("https://mobileappapi.onrender.com/api/facility/create"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
          {"FieldName": fieldName, "FieldImage": fieldImage, "EntryCount": 0}),
    );

    return response.statusCode == 201;
  }

  // UPDATE Method
  Future<bool> updateField(
      int id, String fieldName, String fieldImage, int entryCount) async {
    final response = await http.put(
      Uri.parse("https://mobileappapi.onrender.com/api/fieldstate/update/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "FieldName": fieldName,
        "FieldImage": fieldImage,
        "EntryCount": entryCount
      }),
    );

    return response.statusCode == 200;
  }
}

// void main() {
//   runApp(examplescreen());
// }

class examplescreen extends StatefulWidget {
  @override
  _examplescreenState createState() => _examplescreenState();
}

class _examplescreenState extends State<examplescreen> {
  final ApiService apiService = ApiService();
  List<Map<String, FacilityModeldata>> fields = [];

  @override
  void initState() {
    super.initState();
    fetchFields();
  }

  void fetchFields() async {
    fields = await apiService.getFacilities();
    setState(() {});
  }

  void addField() async {
    bool success = await apiService.createField("Library", "img_2.jpg");
    if (success) fetchFields();
  }

  void updateField() async {
    bool success =
        await apiService.updateField(1, "Updated Hospital", "img_new.jpg", 2);
    if (success) fetchFields();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("API Example")),
        body: ListView.builder(
          itemCount: fields.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(fields[index]['FieldName'].toString()),
              subtitle:
                  Text("Entries: ${fields[index]['EntryCount'].toString()}"),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(onPressed: addField, child: Icon(Icons.add)),
            SizedBox(height: 10),
            FloatingActionButton(
                onPressed: updateField, child: Icon(Icons.update)),
          ],
        ),
      ),
    );
  }
}
