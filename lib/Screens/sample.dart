import 'dart:convert';
import 'dart:io';

import 'package:attendanceapp/Screens/Admin/FacilityCardListview/controller/FacilityCardListviewController.dart';
import 'package:attendanceapp/Screens/SiteHeader/AddSiteHead/controller/AddSiteHeadController.dart';
import 'package:attendanceapp/Screens/SiteHeader/WorkerList/model/worklistmodel.dart';
import 'package:attendanceapp/demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

////////Proximity/////////////
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../CommenFiles/getXcontroller.dart';
import '../widgets/AppBarSample.dart';
import 'package:flutter/material.dart';

import 'Admin/FacilityCardDetails/model/FacilitylistModel.dart';
import 'Admin/FacilityCardListview/model/fieldstatemodel.dart';
import 'Admin/FacilityCardListview/view/Facilities_Card_Items.dart';
import 'SiteHeader/AddSiteHead/model/SinglehospitalModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'languagechanger/controller/LanguageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum SampleItem { itemOne, itemTwo, itemThree }

void main() {
  runApp(MaterialApp(home: DisableListExample()));
}

class DisableListExample extends StatefulWidget {
  @override
  _DisableListExampleState createState() => _DisableListExampleState();
}

class _DisableListExampleState extends State<DisableListExample> {
  // Sample data list
  List<Map<String, dynamic>> siteheadData = [];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🌟 GridView Layout

            // 🌟 ListView Layout
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: siteheadData.length,
              itemBuilder: (context, index) {
                var site = siteheadData[index];
                bool isDisabled = disabledItems.contains(site["id"]);

                return Opacity(
                  opacity: isDisabled ? 0.5 : 1.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/boy.png"),
                    ),
                    title: Text(
                      "${site["firstName"]} ${site["lastName"]}",
                      style: TextStyle(
                          color: isDisabled ? Colors.grey : Colors.black),
                    ),
                    subtitle:
                    Text("${site["field"]}\n${site["fieldSiteName"]}"),
                    isThreeLine: true,
                    trailing: PopupMenuButton<String>(
                      onSelected: (String value) {
                        if (value == "Disable" || value == "Enable") {
                          toggleDisableItem(site["id"]);
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                      [
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
          ],
        ),
      ),
    );
  }
}

class FacilityScreen extends StatefulWidget {
  @override
  _FacilityScreenState createState() => _FacilityScreenState();
}

class _FacilityScreenState extends State<FacilityScreen> {
  Map<String, List<dynamic>> siteheadData = {};

  Set<int> disabledItems = {}; // Track disabled item IDs

  void toggleDisableItem(int id) {
    setState(() {
      if (disabledItems.contains(id)) {
        disabledItems.remove(id); // Enable the item
      } else {
        disabledItems.add(id); // Disable the item
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Facilities")),
      body: ListView(
        children: siteheadData.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  entry.key,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.78,
                padding: EdgeInsets.all(18.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: entry.value.map((site) {
                  bool isDisabled = disabledItems.contains(site.id);

                  return Opacity(
                    opacity: isDisabled ? 0.5 : 1.0,
                    // Reduce opacity if disabled
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: isDisabled ? Colors.grey[300] : Colors.blue,
                      child: IgnorePointer(
                        ignoring: isDisabled,
                        // Disable interactions if item is disabled
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      site.firstName,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isDisabled
                                            ? Colors.grey
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                    onSelected: (String value) {
                                      if (value == "Disable" ||
                                          value == "Enable") {
                                        toggleDisableItem(site.id);
                                      }
                                    },
                                    itemBuilder: (BuildContext context) =>
                                    [
                                      PopupMenuItem(
                                        value: "Edit",
                                        child: Text("Edit"),
                                      ),
                                      PopupMenuItem(
                                        value: "Remove",
                                        child: Text("Remove"),
                                      ),
                                      PopupMenuItem(
                                        value:
                                        isDisabled ? "Enable" : "Disable",
                                        child: Text(
                                            isDisabled ? "Enable" : "Disable"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Image.asset("assets/image/1.png", height: 80),
                              SizedBox(height: 10),
                              Text("Count: ${site.id}"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class FacilityModeldatas {
  final int id;
  final String fieldName;
  final String fieldImage;

  FacilityModeldatas({
    required this.id,
    required this.fieldName,
    required this.fieldImage,
  });

  factory FacilityModeldatas.fromJson(Map<String, dynamic> json) {
    return FacilityModeldatas(
      id: json['id'],
      fieldName: json['FieldName'],
      fieldImage: json['FieldImage'],
    );
  }
}

class ApiServiceapi {
  final String baseUrl = "https://your-api-endpoint.com/api";

  // POST method to add a new field
  Future<void> addField(Map<String, dynamic> fieldData) async {
    final url =
    Uri.parse("https://mobileappapi.onrender.com/api/facility/create");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(fieldData),
      );

      if (response.statusCode == 201) {
        print("Field added successfully");
      } else {
        print("Failed to add field: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // UPDATE (PUT) method to update an existing field
  Future<void> updateField(int id, Map<String, dynamic> fieldData) async {
    final url =
    Uri.parse("https://mobileappapi.onrender.com/api/facility/update/$id");

    try {
      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(fieldData),
      );

      if (response.statusCode == 200) {
        print("Field updated successfully");
      } else {
        print("Failed to update field: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // GET method to fetch fields
  Future<List<FacilityModeldata>> getFields() async {
    final url = Uri.parse("https://mobileappapi.onrender.com/api/facility/all");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // Decode the response body
        List<dynamic> jsonList = jsonDecode(response.body);

        // Convert JSON List to FacilityModeldata List
        return jsonList
            .map((json) => FacilityModeldata.fromJson(json))
            .toList();
      } else {
        print("Failed to fetch fields: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}

// void main() async {
//   ApiServiceapi apiService = ApiServiceapi();
//
//   // Example: Adding a new field
//   Map<String, dynamic> newField = {
//     "id": 2,
//     "FieldName": "Clinic",
//     "FieldImage": "xyz",
//     "EntryCount": 5
//   };
//   await apiService.addField(newField);
//
//   // Example: Updating an existing field
//   Map<String, dynamic> updatedField = {
//     "FieldName": "Updated Hospital",
//     "FieldImage": "new_image",
//     "EntryCount": 10
//   };
//   await apiService.updateField(1, updatedField);
// }

class FieldListScreenapi extends StatefulWidget {
  @override
  _FieldListScreenapiState createState() => _FieldListScreenapiState();
}

class _FieldListScreenapiState extends State<FieldListScreenapi> {
  final ApiServiceapi apiService = ApiServiceapi();
  Map<String, List<FacilityModeldata>> siteheadData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Field List")),
        body: FutureBuilder<List<FacilityModeldata>>(
          future: apiService.getFields(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error fetching data"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No data available"));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var field = snapshot.data![index];
                return ListTile(
                  leading: Image.network(field.fieldImage.toString(),
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(field.fieldName.toString()),
                  subtitle: Text("Entries:}"),
                );
              },
            );
          },
        ));
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: FieldListScreen(),
//   ));
// }

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<dynamic> fieldList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/getFields'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        fieldList = data["Field"];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Field List")),
      body: fieldList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: fieldList.length,
        itemBuilder: (context, index) {
          final field = fieldList[index];
          return ListTile(
            title: Text(field["FieldName"]),
            subtitle: Text("Entries: ${field["EntryCount"]}"),
            leading: Icon(Icons.local_hospital),
          );
        },
      ),
    );
  }
}

class EditShiftScreen extends StatefulWidget {
  final String shiftId;
  final String initialWorkType;
  final String initialShiftName;
  final String initialFromTime;
  final String initialToTime;

  EditShiftScreen({
    required this.shiftId,
    required this.initialWorkType,
    required this.initialShiftName,
    required this.initialFromTime,
    required this.initialToTime,
  });

  @override
  _EditShiftScreenState createState() => _EditShiftScreenState();
}

class _EditShiftScreenState extends State<EditShiftScreen> {
  late TextEditingController workTypeController;
  late TextEditingController shiftNameController;
  late TextEditingController fromTimeController;
  late TextEditingController toTimeController;

  @override
  void initState() {
    super.initState();
    workTypeController = TextEditingController(text: widget.initialWorkType);
    shiftNameController = TextEditingController(text: widget.initialShiftName);
    fromTimeController = TextEditingController(text: widget.initialFromTime);
    toTimeController = TextEditingController(text: widget.initialToTime);
  }

  @override
  void dispose() {
    workTypeController.dispose();
    shiftNameController.dispose();
    fromTimeController.dispose();
    toTimeController.dispose();
    super.dispose();
  }

  Future<void> updateShift() async {
    String url =
        "https://mobileappapi.onrender.com/api/shift/update/${widget.shiftId}";

    if (workTypeController.text.isEmpty ||
        shiftNameController.text.isEmpty ||
        fromTimeController.text.isEmpty ||
        toTimeController.text.isEmpty) {
      Get.snackbar("Error", "⚠ Please fill all fields!",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    final Map<String, dynamic> requestBody = {
      "WorkType": workTypeController.text,
      "ShiftName": shiftNameController.text,
      "ShiftFrom": fromTimeController.text,
      "ShiftTo": toTimeController.text,
    };

    print("📩 Sending Update Request: ${jsonEncode(requestBody)}");

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      print("🔍 Response Status Code: ${response.statusCode}");
      print("🔍 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "✅ Shift updated successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);
        Navigator.pop(context); // Close screen after success
      } else {
        Get.snackbar("Error", "❌ Failed to update shift: ${response.body}",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "⚠ API Error: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Shift")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: workTypeController,
              decoration: InputDecoration(labelText: "Work Type"),
            ),
            TextField(
              controller: shiftNameController,
              decoration: InputDecoration(labelText: "Shift Name"),
            ),
            TextField(
              controller: fromTimeController,
              decoration: InputDecoration(labelText: "Shift From"),
            ),
            TextField(
              controller: toTimeController,
              decoration: InputDecoration(labelText: "Shift To"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateShift,
              child: Text("Update Shift"),
            ),
          ],
        ),
      ),
    );
  }
}

class FieldListScreen extends StatefulWidget {
  @override
  _FieldListScreenState createState() => _FieldListScreenState();
}

class _FieldListScreenState extends State<FieldListScreen> {
  // Sample JSON Data
  Map<String, dynamic> jsonData = {
    "Field": [
      {"id": 1, "FieldName": "Hospital", "FieldImage": "sdf", "EntryCount": 0}
    ]
  };

  // Function to increase count
  void incrementEntryCount(int index) {
    setState(() {
      jsonData["Field"][index]["EntryCount"]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Field List")),
      body: ListView.builder(
        itemCount: jsonData["Field"].length,
        itemBuilder: (context, index) {
          var field = jsonData["Field"][index];

          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(field["FieldName"]),
              subtitle: Text("Entry Count: ${field["EntryCount"]}"),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () => incrementEntryCount(index),
              ),
            ),
          );
        },
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: HospitalSelectionScreen(),
//   ));
// }

class HospitalSelectionScreen extends StatefulWidget {
  @override
  _HospitalSelectionScreenState createState() =>
      _HospitalSelectionScreenState();
}

class _HospitalSelectionScreenState extends State<HospitalSelectionScreen> {
  List<Map<String, dynamic>> hospitals = [
    {
      "name": "City Hospital",
      "departments": ["Cardiology", "Orthopedics", "Neurology"],
      "selected": <String, bool>{}
    },
    {
      "name": "Green Valley Clinic",
      "departments": ["Pediatrics", "Dermatology", "General Surgery"],
      "selected": <String, bool>{}
    },
    {
      "name": "Sunrise Medical",
      "departments": ["ENT", "Gastroenterology", "Urology"],
      "selected": <String, bool>{}
    },
  ];

  void toggleSelection(int hospitalIndex, String department) {
    setState(() {
      if (hospitals[hospitalIndex]["selected"][department] == true) {
        hospitals[hospitalIndex]["selected"].remove(department);
      } else {
        hospitals[hospitalIndex]["selected"][department] = true;
      }
    });
  }

  // int getTotalSelectedCount() {
  //   // int count = 0;
  //   // for (var hospital in hospitals) {
  //   //   count += hospitals[index].length;
  //   // }
  //   // return count;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Hospital Fields")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Total Selected:}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ExpansionTile(
                    title: Text(hospitals[index]["name"]),
                    children: hospitals[index]["departments"]
                        .map<Widget>((department) {
                      bool isSelected =
                      hospitals[index]["selected"].containsKey(department);
                      return ListTile(
                        title: Text(department),
                        trailing: Icon(
                          isSelected
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: isSelected ? Colors.green : null,
                        ),
                        onTap: () => toggleSelection(index, department),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneNumberInput extends StatefulWidget {
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final TextEditingController phoneController = TextEditingController();
  String fullPhoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone Input with Controller")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IntlPhoneField(
              initialCountryCode: 'IN',
              // Set default to India
              disableLengthCheck: true,
              showDropdownIcon: false,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              onChanged: (phone) {
                phoneController.text =
                    phone.completeNumber; // Store in controller
                setState(() {
                  fullPhoneNumber = phone.completeNumber;
                });
                print("Full Number: ${phone.completeNumber}");
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Entered Phone Number: ${phoneController.text}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Phone: ${phoneController.text}")),
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

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;

  // API Endpoint (Replace with your actual API URL)
  final String apiUrl = "https://your-api.com/reset-password";

  // Function to send POST request
  Future<void> resetPassword() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text,
        "new_password": passwordController.text,
        "confirm_password": confirmPasswordController.text
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      // Success: Show message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset successful!")),
      );
    } else {
      // Error: Show message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Error: ${jsonDecode(response.body)['message']}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter your details to reset your password",
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            // Email Field
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // New Password Field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "New Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Confirm Password Field
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Reset Password Button
            ElevatedButton(
              onPressed: isLoading ? null : resetPassword,
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}

class names extends StatefulWidget {
  const names({super.key});

  @override
  State<names> createState() => _namesState();
}

class _namesState extends State<names> {
  @override
  Map<String, List<String>> facilityData = {
    "Hospitals": ["Apollo", "GH", "SRM"],
    "Colleges": ["Anna University", "SRM University", "VIT"],
    "Schools": ["DAV", "PSBB", "Velammal"],
  };

  int getCategoryCount(String category) {
    return facilityData[category]?.length ?? 0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              // 2 items per row
              childAspectRatio: 0.78,
              padding: EdgeInsets.all(18.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                // ✅ HOSPITALS GRID
                CategoryCard(
                  categoryName: "Hospitals",
                  totalCount: getCategoryCount("Hospitals"),
                  onTap: () {},
                ),

                // ✅ COLLEGES GRID
                CategoryCard(
                  categoryName: "Colleges",
                  totalCount: getCategoryCount("Colleges"),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   // MaterialPageRoute(
                    //   //     builder: (context) =>
                    //   //         FacilitiesListView(category: "Colleges")),
                    // );
                  },
                ),

                // ✅ SCHOOLS GRID
                CategoryCard(
                  categoryName: "Schools",
                  totalCount: getCategoryCount("Schools"),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           FacilitiesListView(category: "Schools")),
                    //);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final int totalCount;
  final VoidCallback onTap;

  const CategoryCard({
    required this.categoryName,
    required this.totalCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.blue,
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                categoryName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "Total: $totalCount",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController textController = TextEditingController();
  File? _selectedImage;

  // 📌 Function to pick an image
  Future<void> pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // 📌 Function to upload text + image
  Future<void> uploadData() async {
    if (textController.text.isEmpty || _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter text and select an image")),
      );
      return;
    }

    final url = Uri.parse("https://yourapi.com/upload");
    var request = http.MultipartRequest("POST", url);

    // 📌 Attach text data
    request.fields["text"] = textController.text;

    // 📌 Attach image file
    request.files
        .add(await http.MultipartFile.fromPath("image", _selectedImage!.path));

    try {
      final response = await request.send();
      final responseString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        print("Upload Success: $responseString");
      } else {
        print("Upload Failed: $responseString");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Text & Image")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: "Enter text",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            _selectedImage != null
                ? Image.file(_selectedImage!, height: 150)
                : Text("No image selected"),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: pickImage,
              icon: Icon(Icons.image),
              label: Text("Pick Image"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: uploadData,
              child: Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchGridView extends StatefulWidget {
  @override
  _SearchGridViewState createState() => _SearchGridViewState();
}

class _SearchGridViewState extends State<SearchGridView> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> fieldStateList = [];

  List<Map<String, dynamic>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = fieldStateList; // Initialize with full list
  }

  void filterSearchResults(String query) {
    List<Map<String, dynamic>> dummyList = [];
    if (query.isNotEmpty) {
      dummyList = fieldStateList
          .where((item) =>
          item["FieldName"]?.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      dummyList = fieldStateList;
    }

    setState(() {
      filteredList = dummyList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search GridView"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Enter field name",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.78,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        filteredList[index]["FieldName"],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Image.asset(filteredList[index]["FieldImage"]),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShiftScreen extends StatefulWidget {
  @override
  _ShiftScreenState createState() => _ShiftScreenState();
}

class _ShiftScreenState extends State<ShiftScreen> {
  TimeOfDay? _selectedFromTime;
  TimeOfDay? _selectedToTime;
  String? _selectedWorkType;
  String? _selectedShiftName;

  final List<String> _workTypes = ["Electrician", "Plumber", "Driver"];
  final List<String> _shiftNames = ["Morning", "Afternoon", "Night"];

  // Function to pick time
  Future<void> _pickTime(bool isFromTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        if (isFromTime) {
          _selectedFromTime = pickedTime;
        } else {
          _selectedToTime = pickedTime;
        }
      });
    }
  }

  // Function to format time as "HH:mm:ss"
  String formatTime(TimeOfDay? time) {
    if (time == null) return "";
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm:ss')
        .format(DateTime(now.year, now.month, now.day, time.hour, time.minute));
    return formattedTime;
  }

  Future<void> addShift() async {
    String url = "https://mobileappapi.onrender.com/api/shift/create";

    if (_selectedWorkType == null ||
        _selectedShiftName == null ||
        _selectedFromTime == null ||
        _selectedToTime == null) {
      print("⚠ Please fill all fields!");
      return;
    }

    String formattedFromTime = formatTime(_selectedFromTime);
    String formattedToTime = formatTime(_selectedToTime);

    final Map<String, dynamic> requestBody = {
      "WorkType": _selectedWorkType,
      "ShiftName": _selectedShiftName,
      "ShiftFrom": formattedFromTime,
      "ShiftTo": formattedToTime,
    };

    print("📩 Sending Request: ${jsonEncode(requestBody)}");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      print("🔍 Response Status Code: ${response.statusCode}");
      print("🔍 Response Body: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("✅ Shift added successfully!");
      } else {
        print("❌ Failed to add shift. Status: ${response.statusCode}");
        print("❌ Response: ${response.body}");
      }
    } catch (e) {
      print("⚠ Error: $e");
    }
  }

  // Function to send data to API
  // Future<void> addShift() async {
  //   String url = "https://mobileappapi.onrender.com/api/shift/create";
  //
  //   if (_selectedWorkType == null ||
  //       _selectedShiftName == null ||
  //       _selectedFromTime == null ||
  //       _selectedToTime == null) {
  //     print("⚠ Please fill all fields!");
  //     return;
  //   }
  //
  //   final Map<String, dynamic> requestBody = {
  //     "WorkType": _selectedWorkType,
  //     "ShiftName": _selectedShiftName,
  //     "ShiftFrom": formatTime(_selectedFromTime),
  //     "ShiftTo": formatTime(_selectedToTime),
  //   };
  //
  //   print("📩 Sending Request: ${jsonEncode(requestBody)}");
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: jsonEncode(requestBody),
  //     );
  //
  //     print("🔍 Response Status Code: ${response.statusCode}");
  //     print("🔍 Response Body: ${response.body}");
  //
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       print("✅ Shift added successfully!");
  //     } else {
  //       print("❌ Failed to add shift. Status: ${response.statusCode}");
  //       print("❌ Response: ${response.body}");
  //     }
  //   } catch (e) {
  //     print("⚠ Error: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Shift")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Work Type Dropdown
            DropdownButtonFormField<String>(
              value: _selectedWorkType,
              decoration: InputDecoration(labelText: "Select Work Type"),
              items: _workTypes.map((work) {
                return DropdownMenuItem(value: work, child: Text(work));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedWorkType = value;
                });
              },
            ),

            SizedBox(height: 10),

            // Shift Name Dropdown
            DropdownButtonFormField<String>(
              value: _selectedShiftName,
              decoration: InputDecoration(labelText: "Select Shift"),
              items: _shiftNames.map((shift) {
                return DropdownMenuItem(value: shift, child: Text(shift));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedShiftName = value;
                });
              },
            ),

            SizedBox(height: 10),

            // From Time Picker
            Row(
              children: [
                Expanded(
                  child: Text(
                      "From Time: ${_selectedFromTime != null ? formatTime(
                          _selectedFromTime) : "Not Selected"}"),
                ),
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () => _pickTime(true),
                ),
              ],
            ),

            SizedBox(height: 10),

            // To Time Picker
            Row(
              children: [
                Expanded(
                  child: Text(
                      "To Time: ${_selectedToTime != null ? formatTime(
                          _selectedToTime) : "Not Selected"}"),
                ),
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () => _pickTime(false),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: addShift,
              child: Text("Add Shift"),
            ),
          ],
        ),
      ),
    );
  }
}

class FieldStateScreen extends StatefulWidget {
  @override
  _FieldStateScreenState createState() => _FieldStateScreenState();
}

class _FieldStateScreenState extends State<FieldStateScreen> {
  final TextEditingController fieldSiteNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController siteHeadNameController = TextEditingController();

  String? latitude;
  String? longitude;
  double? distance; // Store the distance

  // 📍 Get Current Location
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
      });
      print("📍 Location: $latitude, $longitude");
    } catch (e) {
      print("⚠ Location Error: $e");
    }
  }

  // 📏 Calculate Distance Between Two Points
  Future<void> calculateDistance(double startLat, double startLong,
      double endLat, double endLong) async {
    double distanceInMeters =
    Geolocator.distanceBetween(startLat, startLong, endLat, endLong);
    setState(() {
      distance = distanceInMeters / 1000; // Convert to KM
    });
    print("📏 Distance: $distance KM");
  }

  // 🌟 Send Data to API
  Future<void> addFieldStateApi() async {
    if (siteHeadNameController.text.isEmpty ||
        fieldSiteNameController.text.isEmpty ||
        mobileNumberController.text.isEmpty ||
        latitude == null ||
        longitude == null ||
        distance == null) {
      print("⚠ Please fill all fields!");
      return;
    }

    final Map<String, dynamic> requestBody = {
      "FieldName": fieldSiteNameController.text.trim(),
      "Latitude": latitude,
      "Longitude": longitude,
      "Proximity": distance.toString(),
      "HeadName": siteHeadNameController.text.trim(),
      "MobileNumber": mobileNumberController.text.trim(),
      "FieldImage": "image_url.jpg"
    };

    print("Sending Request: $requestBody");

    try {
      final response = await http.post(
        Uri.parse("https://mobileappapi.onrender.com/api/fieldstate/create"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("✅ Field added successfully!");
      } else {
        print("❌ Failed to add field. Status: ${response.statusCode}");
        print("❌ Response: ${response.body}");
      }
    } catch (e) {
      print("⚠ Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Field State")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fieldSiteNameController,
              decoration: InputDecoration(labelText: "Field Site Name"),
            ),
            TextField(
              controller: mobileNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Mobile Number"),
            ),
            TextField(
              controller: siteHeadNameController,
              decoration: InputDecoration(labelText: "Head Name"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: getCurrentLocation,
              child: Text("📍 Get Current Location"),
            ),
            latitude != null && longitude != null
                ? Text("Lat: $latitude, Long: $longitude")
                : Container(),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (latitude != null && longitude != null) {
                  // Replace with target location (e.g., company location)
                  double targetLat = 12.9716; // Example Lat
                  double targetLong = 77.5946; // Example Long
                  calculateDistance(double.parse(latitude!),
                      double.parse(longitude!), targetLat, targetLong);
                } else {
                  print("⚠ Get location first!");
                }
              },
              child: Text("📏 Calculate Distance"),
            ),
            distance != null
                ? Text("📏 Distance: ${distance!.toStringAsFixed(2)} KM")
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addFieldStateApi,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkerFormtype extends StatefulWidget {
  @override
  _WorkerFormtypeState createState() => _WorkerFormtypeState();
}

class _WorkerFormtypeState extends State<WorkerFormtype> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  String? _selectedWork; // Work Dropdown selection
  String? _selectedWorkType; // Work Type Dropdown selection

  final List<String> _workOptions = [
    "Security",
    "Driver",
    "Electrician",
    "Plumber"
  ];
  final List<String> _workTypeOptions = ["Full-Time", "Part-Time", "Freelance"];

  // 🌟 Send Data to API
  Future<void> addWorker() async {
    if (_selectedWork == null ||
        _selectedWorkType == null ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _mobileNumberController.text.isEmpty) {
      print("⚠ Please fill all fields!");
      return;
    }

    final Map<String, dynamic> requestBody = {
      "FirstName": _firstNameController.text.trim(),
      "LastName": _lastNameController.text.trim(),
      "MobileNumber": _mobileNumberController.text.trim(),
      "Work": _selectedWork,
      "WorkType": _selectedWorkType,
      "Image": "img1.jpg" // Static image name for now
    };

    try {
      var response = await http.post(
        Uri.parse("https://mobileappapi.onrender.com/api/worker/create"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      String responseBody = response.body;
      print("📩 API Response: $responseBody");

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("✅ Worker added successfully!");
      } else {
        print("❌ Failed to add worker. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("⚠ Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Worker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: "First Name"),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: "Last Name"),
            ),
            TextField(
              controller: _mobileNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Mobile Number"),
            ),
            DropdownButtonFormField<String>(
              value: _selectedWork,
              decoration: InputDecoration(labelText: "Select Work"),
              items: _workOptions.map((String work) {
                return DropdownMenuItem<String>(
                  value: work,
                  child: Text(work),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedWork = value;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: _selectedWorkType,
              decoration: InputDecoration(labelText: "Select Work Type"),
              items: _workTypeOptions.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedWorkType = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addWorker,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class AddWorkScreen extends StatefulWidget {
  @override
  _AddWorkScreenState createState() => _AddWorkScreenState();
}

class _AddWorkScreenState extends State<AddWorkScreen> {
  final TextEditingController _workTypeController = TextEditingController();
  String? _selectedCategory; // For dropdown selection

  final List<String> _categories = [
    "Driver",
    "Painter",
    "Electrician",
    "Plumber"
  ]; // Example dropdown options

  // 🚀 Function to Send Data to API
  Future<void> addWorkPostApi() async {
    if (_selectedCategory == null || _workTypeController.text.isEmpty) {
      print("⚠ Please fill all fields!");
      return;
    }

    try {
      var response = await http.post(
        Uri.parse("https://mobileappapi.onrender.com/api/worker/create"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "WorkType": _workTypeController.text.trim(),
          "Category": _selectedCategory,
        }),
      );
      print("🔹 Sending Data: ${jsonEncode({
        "WorkType": _workTypeController.text.trim(),
        "Category": _selectedCategory,
      })}");
      String responseBody = response.body;
      print("📩 API Response: $responseBody");

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("✅ Data stored successfully!");
      } else {
        print("❌ Failed to add item. Status Code: ${response.statusCode}");
        print("❌ Server Response: $responseBody");
      }
    } catch (e) {
      print("⚠ Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Work")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 📝 TextField for Work Type
            TextField(
              controller: _workTypeController,
              decoration: InputDecoration(labelText: "Enter Work Type"),
            ),
            SizedBox(height: 20),

            // ⬇️ DropdownButton for Category Selection
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(labelText: "Select Category"),
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            SizedBox(height: 20),

            // 📤 Submit Button
            ElevatedButton(
              onPressed: addWorkPostApi,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkListScreenname extends StatefulWidget {
  @override
  _WorkListScreennameState createState() => _WorkListScreennameState();
}

class _WorkListScreennameState extends State<WorkListScreenname> {
  List<Map<String, dynamic>> workList = []; // List to store added work items

  Future<void> pickImageAndUpload() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String workType = "Driver"; // Example work type (You can use user input)

      // Call API to upload
      await addworkPostApi(imageFile, workType);

      // Add to list and update UI
      setState(() {
        workList.add({"workType": workType, "imagePath": pickedFile.path});
      });
    }
  }

  Future<void> addworkPostApi(File imageFile, String workType) async {
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse("https://mobileappapi.onrender.com/api/work/create"));
      request.fields["WorkType"] = workType;
      request.files
          .add(await http.MultipartFile.fromPath('Image', imageFile.path));

      var response = await request.send();
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("Item added successfully!");
      } else {
        print("Failed to add item: ${await response.stream.bytesToString()}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Work List")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: pickImageAndUpload, // Call function to add work
            child: Text("Add Work"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: workList[index]["imagePath"] != null
                      ? Image.file(File(workList[index]["imagePath"]),
                      width: 50, height: 50)
                      : Icon(Icons.work),
                  title: Text(workList[index]["workType"]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ApiService {
  final String uploadUrl = "https://mobileappapi.onrender.com/api/work/create";

  /// **Upload Image to Server**
  Future<bool> uploadImage(File imageFile) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
      request.files
          .add(await http.MultipartFile.fromPath('image', imageFile.path));

      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Image uploaded successfully");
        return true;
      } else {
        print("Failed to upload image");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  final picker = ImagePicker();

  /// **Pick Image from Camera**
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void uploadImage() async {
    if (_image == null) {
      print("No image selected");
      return;
    }

    bool success = await ApiService().uploadImage(_image!);
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Image uploaded successfully!")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Image upload failed!")));
    }
  }

  /// **Pick Image from Gallery**
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick & Upload Image")),
      body: Column(
        children: [
          SizedBox(height: 20),
          _image != null
              ? Image.file(_image!, height: 200)
              : Text("No image selected"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: _pickImageFromCamera, child: Text("Camera")),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: _pickImageFromGallery, child: Text("Gallery")),
            ],
          ),
        ],
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  List<dynamic> dropdownItems = []; // Store fetched dropdown items
  String? selectedValue; // Store selected value

  @override
  void initState() {
    super.initState();
    fetchDropdownData(); // Fetch dropdown data when screen loads
  }

  // Function to fetch dropdown data using POST request
  Future<void> fetchDropdownData() async {
    String url =
        "https://yourapi.com/api/getDropdownValues"; // Replace with actual API

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"key": "value"}), // Send necessary payload
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          dropdownItems = data["options"]; // Adjust based on API response
          if (dropdownItems.isNotEmpty) {
            selectedValue = dropdownItems[0]["id"]; // Set default selection
          }
        });
      } else {
        print("Failed to load dropdown data: ${response.body}");
      }
    } catch (e) {
      print("Error fetching dropdown data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dropdown with POST API")),
      body: Center(
        child: dropdownItems.isEmpty
            ? CircularProgressIndicator() // Show loader while fetching data
            : DropdownButton<String>(
          value: selectedValue,
          items: dropdownItems.map((item) {
            return DropdownMenuItem<String>(
              value: item["id"].toString(), // Adjust based on API data
              child: Text(item["name"]), // Adjust based on API data
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}

class DynamicDropdownScreen extends StatefulWidget {
  @override
  _DynamicDropdownScreenState createState() => _DynamicDropdownScreenState();
}

class _DynamicDropdownScreenState extends State<DynamicDropdownScreen> {
  List<String> dropdownValues = []; // Stores selected values
  List<List<String>> dropdownOptions = [
    ["Anand", "mani", "Ravi"],
    ["House keeping", "Security", "Watchman"],
  ]; // Different dropdown lists

  @override
  void initState() {
    super.initState();
    dropdownValues = List.filled(dropdownOptions.length, ""); // Default values
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dynamic Dropdowns")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dropdownOptions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Select Option ${index + 1}",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      value: dropdownValues[index].isNotEmpty
                          ? dropdownValues[index]
                          : null,
                      items: dropdownOptions[index]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValues[index] = newValue!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("Selected Values: $dropdownValues");
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

// FacilityModel Class
class FacilityModel {
  final String id;
  final String fieldName;
  final String fieldImage;

  FacilityModel(
      {required this.id, required this.fieldName, required this.fieldImage});

  // Convert JSON to FacilityModel
  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityModel(
      id: json['_id'] ?? '',
      fieldName: json['fieldName'] ?? 'Unknown',
      fieldImage: json['fieldImage'] ?? '',
    );
  }
}

class FacilityScreenname extends StatefulWidget {
  @override
  _FacilityScreennameState createState() => _FacilityScreennameState();
}

class _FacilityScreennameState extends State<FacilityScreenname> {
  Future<Map<String, List<FacilityModel>>> facilitygetApi(
      {String? query}) async {
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/facility/all'),
      );

      if (response.statusCode == 200) {
        print("Data Fetched Successfully");

        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        // ✅ Convert JSON to FacilityModel List
        final siteheads = jsonData.map((key, value) =>
            MapEntry<String, List<FacilityModel>>(
                key,
                List<FacilityModel>.from(
                    value.map((x) => FacilityModel.fromJson(x)))));

        // ✅ Filtering based on query
        if (query != null && query.isNotEmpty) {
          final filteredSiteheads = siteheads.map((key, value) {
            final filteredList = value
                .where((site) =>
            site.fieldName
                .toLowerCase()
                .contains(query.toLowerCase()) ||
                site.fieldImage.toLowerCase().contains(query.toLowerCase()))
                .toList();
            return MapEntry(key, filteredList);
          });

          return filteredSiteheads;
        }

        return siteheads;
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('Failed to load data: $e\n$stackTrace');
      throw Exception('Failed to load data: $e\n$stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Facility Grid")),
      body: FutureBuilder<Map<String, List<FacilityModel>>>(
        future: facilitygetApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Loading Indicator
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Data Found"));
          }

          // ✅ Extracting List from Map
          final facilityList =
          snapshot.data!.values.expand((list) => list).toList();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: facilityList.length,
              itemBuilder: (context, index) {
                final facility = facilityList[index];

                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: facility.fieldImage.isNotEmpty
                            ? Image.network(facility.fieldImage,
                            fit: BoxFit.cover)
                            : Icon(Icons.image_not_supported,
                            size: 80, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          facility.fieldName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: FacilityScreen(),
//   ));
// }

// void main() {
//   runApp(MyAppfuction());
// }

class MyAppfuction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FacilityScreens(),
    );
  }
}

class FacilityScreens extends StatefulWidget {
  @override
  _FacilityScreensState createState() => _FacilityScreensState();
}

class _FacilityScreensState extends State<FacilityScreens> {
  Map<String, List<Map<String, FacilityModeldatas>>> facilityData = {
    // "Category 1": [
    //   {"id": 1, "fieldName": "Facility A", "count": 10},
    //   {"id": 2, "fieldName": "Facility B", "count": 5},
    // ],
    // "Category 2": [
    //   {"id": 3, "fieldName": "Facility C", "count": 8},
    //   {"id": 4, "fieldName": "Facility D", "count": 12},
    // ]
  };

  Set<int> disabledItems = {}; // Track disabled item IDs

  void disableItem(int id) {
    setState(() {
      disabledItems.add(id); // Disable the item
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Facilities")),
      body: ListView(
        children: facilityData.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  entry.key,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.78,
                padding: EdgeInsets.all(18.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: entry.value.map((site) {
                  bool isDisabled = disabledItems.contains(site["id"]);

                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: isDisabled ? Colors.grey[300] : Colors.blue,
                    child: Container(
                      child: ListTile(
                        title: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    site["fieldName"].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isDisabled
                                          ? Colors.grey
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  enabled: !isDisabled,
                                  // Disable menu if item is disabled
                                  itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                      value: 'Edit',
                                      child: Text("Edit"),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Remove',
                                      child: Text("Remove"),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Disable',
                                      child: TextButton(
                                        onPressed: () {
                                          disableItem(site["id"] as int);
                                          Navigator.pop(
                                              context); // Close menu after disabling
                                        },
                                        child: Text("Disable"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Image.asset("assets/images/hopital1.png"),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text("Count: ${site["count"]}"),
                              ],
                            ),
                          ],
                        ),
                        isThreeLine: false,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// void main() {
//   runApp(MyAppdisable());
// }

class MyAppdisable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DisableListItemScreen(),
    );
  }
}

class DisableListItemScreen extends StatefulWidget {
  @override
  _DisableListItemScreenState createState() => _DisableListItemScreenState();
}

class _DisableListItemScreenState extends State<DisableListItemScreen> {
  List<Map<String, dynamic>> items = [
    {"id": 1, "name": "Item 1"},
    {"id": 2, "name": "Item 2"},
    {"id": 3, "name": "Item 3"},
    {"id": 4, "name": "Item 4"},
  ];

  Set<int> disabledItems = {}; // Store IDs of disabled items

  void disableItem(int id) {
    setState(() {
      disabledItems.add(id); // Mark item as disabled
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Disable List Item")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isDisabled = disabledItems.contains(item["id"]);

          return Card(
            child: ListTile(
              title: Text(
                item["name"],
                style: TextStyle(
                  color: isDisabled
                      ? Colors.grey
                      : Colors.black, // Gray out disabled text
                ),
              ),
              trailing: ElevatedButton(
                onPressed: isDisabled
                    ? null // Disable button if item is in disabled list
                    : () => disableItem(item["id"]),
                child: Text("Disable"),
              ),
            ),
          );
        },
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers for text fields
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  TextEditingController FieldController = TextEditingController();
  TextEditingController FieldSiteNamerController = TextEditingController();
  TextEditingController EnterPasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    siteheadgetApi(); // Load existing data when the screen opens
  }

  Future<void> siteheadgetApi() async {
    String url = "https://mobileappapi.onrender.com/api/sitehead/1";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data is Map) {
          // ✅ Ensure it's a Map before accessing keys
          setState(() {
            FirstNameController.text = data['FirstName'] ?? "";
            LastNameController.text = data['LastName'] ?? "";
            MobileNumberController.text = data['MobileNumber'] ?? "";
            FieldController.text = data['Field'] ?? "";
            FieldSiteNamerController.text = data['FieldSiteName'] ?? "";
          });
        } else if (data is List) {
          // ✅ Handle List response
          setState(() {
            FirstNameController.text = data[0]['FirstName'] ?? "";
            LastNameController.text = data[0]['LastName'] ?? "";
          });
        }
      } else {
        print("Failed to load data: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> SiteheadUpdateapi() async {
    String url = "https://mobileappapi.onrender.com/api/sitehead/update/1";

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "FirstName": FirstNameController.text,
          "LastName": LastNameController.text,
          "MobileNumber": MobileNumberController.text,
          "Field": FieldController.text,
          "FieldSiteName": FieldSiteNamerController.text,
          "Password": EnterPasswordController.text,
          "ConfirmPassword": ConfirmPasswordController.text,
          "Image": "img1.jpg"
        }),
      );

      if (response.statusCode == 200) {
        print("Item updated successfully!");
        siteheadgetApi(); // Reload data
      } else {
        print("Failed to update item: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: FirstNameController,
                decoration: InputDecoration(labelText: "First Name")),
            TextField(
                controller: LastNameController,
                decoration: InputDecoration(labelText: "Last Name")),
            TextField(
                controller: MobileNumberController,
                decoration: InputDecoration(labelText: "Mobile Number")),
            TextField(
                controller: FieldController,
                decoration: InputDecoration(labelText: "Field")),
            TextField(
                controller: FieldSiteNamerController,
                decoration: InputDecoration(labelText: "Field Site Name")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: SiteheadUpdateapi,
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}

class EditListScreen extends StatefulWidget {
  @override
  _EditListScreenState createState() => _EditListScreenState();
}

class _EditListScreenState extends State<EditListScreen> {
  List<Map<String, String>> users = [
    {"name": "Alice", "role": "Designer"},
    {"name": "Bob", "role": "Developer"},
    {"name": "Charlie", "role": "Manager"},
  ];

  // Function to show edit dialog
  void _editItem(int index) {
    TextEditingController nameController =
    TextEditingController(text: users[index]["name"]);
    TextEditingController roleController =
    TextEditingController(text: users[index]["role"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: roleController,
                decoration: InputDecoration(labelText: "Role"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  users[index]["name"] = nameController.text;
                  users[index]["role"] = roleController.text;
                });
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editable List")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(users[index]["name"]![0]), // First letter as avatar
              ),
              title: Text(users[index]["name"]!),
              subtitle: Text(users[index]["role"]!),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () => _editItem(index),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  final LanguageController languageController = Get.find();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("language".tr)), // Translated text
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("hello".tr, style: TextStyle(fontSize: 22)), // Translated text
            SizedBox(height: 20),
            DropdownButton<String>(
              value: languageController.locale.value.languageCode,
              onChanged: (String? newLang) {
                if (newLang != null) {
                  languageController.changeLanguage(newLang);
                }
              },
              items: [
                DropdownMenuItem(value: "en", child: Text("English")),
                DropdownMenuItem(value: "ka", child: Text("Kannada")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   TextEditingController searchController = TextEditingController();
//   Map<String, List<SiteheadModel>> siteheadData = {};
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   void fetchData({String? query}) async {
//     setState(() => isLoading = true);
//     try {
//       final data = await addSiteHeadController.siteheadgetApi(query: query);
//       setState(() {
//         siteheadData = data;
//         isLoading = false;
//       });
//     } catch (e) {
//       print("Error: $e");
//       setState(() => isLoading = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Search Siteheads")),
//         body: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   labelText: "Search...",
//                   border: OutlineInputBorder(),
//                   suffixIcon: searchController.text.isNotEmpty
//                       ? IconButton(
//                           icon: Icon(Icons.clear),
//                           onPressed: () {
//                             searchController.clear();
//                             fetchData();
//                           },
//                         )
//                       : null,
//                 ),
//                 onChanged: (query) => fetchData(query: query),
//               ),
//             ),
//             isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : Expanded(
//                     child: ListView(
//                       children: siteheadData.entries.map((entry) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text(
//                                 entry.key,
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             ...entry.value.map((site) => ListTile(
//                                   title: Text(site.field),
//                                   subtitle: Text(site.fieldSiteName),
//                                 )),
//                           ],
//                         );
//                       }).toList(),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SiteheadSearchPage extends StatefulWidget {
  @override
  _SiteheadSearchPageState createState() => _SiteheadSearchPageState();
}

class _SiteheadSearchPageState extends State<SiteheadSearchPage> {
  Map<String, List<SiteheadModeldatalist>> allData = {}; // Original Data
  Map<String, List<SiteheadModeldatalist>> filteredData =
  {}; // Filtered Data for Search
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchSiteheadData();
    searchController.addListener(_filterData);
  }

  /// Fetch Data from API
  Future<void> fetchSiteheadData() async {
    try {
      final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/sitehead/all'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);

        setState(() {
          allData = jsonData.map((key, value) =>
              MapEntry(
                  key,
                  List<SiteheadModeldatalist>.from(
                      value.map((x) => SiteheadModeldatalist.fromMap(x)))));
          filteredData = Map.from(allData); // Show all data initially
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  /// Search Filter Function
  void _filterData() {
    String query = searchController.text.toLowerCase();

    if (query.isEmpty) {
      setState(() {
        filteredData = Map.from(allData); // Reset to original data
      });
      return;
    }

    Map<String, List<SiteheadModeldatalist>> tempFilteredData = {};

    allData.forEach((category, list) {
      List<SiteheadModeldatalist> filteredList = list.where((item) {
        return item.firstName.toLowerCase().contains(query) ||
            item.lastName.toLowerCase().contains(query) ||
            item.field.toLowerCase().contains(query) ||
            item.fieldSiteName.toLowerCase().contains(query);
        // item.MobileNumber.toLowerCase().contains(query) ||
        // item.Password.toLowerCase().contains(query) ||
        // item.ConfirmPassword.toLowerCase().contains(query) ||
        // item.Image.toLowerCase().contains(query);
      }).toList();

      if (filteredList.isNotEmpty) {
        tempFilteredData[category] = filteredList;
      }
    });

    setState(() {
      filteredData = tempFilteredData;
    });
  }

  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search ListView in Map")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search by name or field...",
                prefixIcon: Icon(Icons.search),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: filteredData.isEmpty
                ? Center(child: Text("No results found"))
                : ListView(
              children: filteredData.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(entry.key,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    ...entry.value.map((sitehead) =>
                        ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              "assets/images/boy.png",
                            ),
                          ),

                          // Image.asset(
                          //   _foundUsers[index]["image"],
                          //   fit: BoxFit.fill,
                          //   width: 90,
                          //   height: 100,
                          // ),
                          // Image.asset("assets/images/2.png",
                          //     width: 50, height: 50, fit: BoxFit.cover),
                          //Image.network("YOUR_IMAGE_BASE_URL/${hospital.image}",

                          title: Text(
                              "${sitehead.firstName} ${sitehead.lastName}"),
                          subtitle: Text("${sitehead.field}"
                              "\n${sitehead.fieldSiteName}"),
                          isThreeLine: true,
                          trailing: Padding(
                            padding:
                            const EdgeInsets.only(top: 10, left: 13),
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
                                            // userListSiteHeaderController
                                            //     .editItem(index, context);
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
                                              // hospitals.removeAt(index);
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
                            ),
                          ),
                        )),
                    Divider()
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

class SiteheadModeldatalist {
  int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String field;
  String fieldSiteName;
  String password;
  String confirmPassword;
  String? image;

  SiteheadModeldatalist({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.field,
    required this.fieldSiteName,
    required this.password,
    required this.confirmPassword,
    required this.image,
  });

  factory SiteheadModeldatalist.fromMap(Map<String, dynamic> json) =>
      SiteheadModeldatalist(
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

  Map<String, dynamic> toMap() =>
      {
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

class SiteheadModellist {
  int id;
  String firstName;
  String lastName;
  String MobileNumber;
  String field;
  String fieldSiteName;
  String Password;
  String ConfirmPassword;
  String Image;

  SiteheadModellist({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.field,
    required this.fieldSiteName,
    required this.MobileNumber,
    required this.Password,
    required this.ConfirmPassword,
    required this.Image,
  });

  factory SiteheadModellist.fromMap(Map<String, dynamic> json) =>
      SiteheadModellist(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        field: json["Field"],
        fieldSiteName: json["FieldSiteName"],
        MobileNumber: json["MobileNumber"],
        Password: json["Password"],
        ConfirmPassword: json["ConfirmPassword"],
        Image: json["Image"],
      );
}

class sitehead {
  int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String field;
  String fieldSiteName;
  String password;
  String confirmPassword;
  String image;

  sitehead({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.field,
    required this.fieldSiteName,
    required this.password,
    required this.confirmPassword,
    required this.image,
  });

  // Convert JSON to Object
  factory sitehead.fromJson(Map<String, dynamic> json) {
    return sitehead(
      id: json['Id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      mobileNumber: json['MobileNumber'],
      field: json['Field'],
      fieldSiteName: json['FieldSiteName'],
      password: json['Password'],
      confirmPassword: json['ConfirmPassword'],
      image: json['Image'],
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<sitehead> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() {
    String jsonData = '''
    [
      {
          "Id": 3,
          "FirstName": "siva",
          "LastName": "kumar",
          "MobileNumber": "1234567890",
          "Field": "Hospital",
          "FieldSiteName": "JIPMER",
          "Password": "1234",
          "ConfirmPassword": "1234",
          "Image": "img1.jpg"
      }
    ]
    ''';

    List<dynamic> parsedList = jsonDecode(jsonData);
    setState(() {
      users = parsedList.map((json) => sitehead.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          sitehead user = users[index];
          return Card(
            child: ListTile(
              // leading: CircleAvatar(
              //   backgroundImage:
              //       AssetImage("assets/2.png}"), // Load image from assets
              // ),
              title: Text("${user.firstName} ${user.lastName}"),
              subtitle: Text(
                  "Mobile: ${user.mobileNumber}\nField: ${user.field}"),
            ),
          );
        },
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(home: UserListScreen()));
// }
//
// void main() {
//   runApp(MaterialApp(home: HospitalScreen()));
// }
//
// class UserListScreen extends StatefulWidget {
//   @override
//   _UserListScreenState createState() => _UserListScreenState();
// }
//
// class _UserListScreenState extends State<UserListScreen> {
//   List<User> users = []; // List to store users
//   List<Map<String, User>> dataList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUsers(); // Fetch data when the screen loads
//   }
//
//   Future<void> fetchUsers() async {
//     String url =
//         "https://mobileappapi.onrender.com/api/sitehead/all"; // Replace with your API
//
//     try {
//       final response = await http.get(Uri.parse(url));
//
//       if (response.statusCode == 200) {
//         List<dynamic> jsonData = jsonDecode(response.body); // Decode JSON
//         setState(() {
//           users = jsonData
//               .map((e) => User.fromJson(e))
//               .toList(); // Convert JSON to List<User>
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Request failed: $e");
//     }
//   }
//
//   List<Map<String, User>> userList = [];
//
//   Future<void> fetchUser() async {
//     String url =
//         "https://mobileappapi.onrender.com/api/sitehead/all"; // Replace with your API
//
//     try {
//       final response = await http.get(Uri.parse(url));
//
//       if (response.statusCode == 200) {
//         List<dynamic> jsonData = jsonDecode(response.body); // Decode JSON
//
//         setState(() {
//           userList = jsonData.map<Map<String, User>>((item) {
//             String key = item.keys.first; // Get the first key (e.g., "user1")
//             return {
//               key: User.fromJson(item[key])
//             }; // Convert value to User object
//           }).toList();
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Request failed: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("User List")),
//       body: ListView.builder(
//         itemCount: userList.length,
//         itemBuilder: (context, index) {
//           var entry = userList[index].entries.first; // Get key-value pair
//           String key = entry.key;
//           User user = entry.value;
//
//           return ListTile(
//             leading: CircleAvatar(child: Text(user.firstName)),
//             title: Text(user.fieldSiteName),
//             subtitle: Text(user.field),
//             trailing: Text(key), // Show key (e.g., "user1")
//           );
//         },
//       ),
//     );
//   }
// }

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String field;
  final String fieldSiteName;
  final String password;
  final String confirmPassword;
  final String image;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.field,
    required this.fieldSiteName,
    required this.password,
    required this.confirmPassword,
    required this.image,
  });

  // Convert JSON to Dart Object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobileNumber: json['mobileNumber'],
      field: json['field'],
      fieldSiteName: json['fieldSiteName'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      image: json['image'],
    );
  }
}

class LanguageListScreen extends StatefulWidget {
  @override
  _LanguageListScreenState createState() => _LanguageListScreenState();
}

class _LanguageListScreenState extends State<LanguageListScreen> {
  List<dynamic> languages = [];

  @override
  void initState() {
    super.initState();
    fetchLanguages();
  }

  Future<void> fetchLanguages() async {
    String apiUrl =
        "https://mobileappapi.onrender.com/api/sitehead/all"; // Replace with real API URL

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        setState(() {
          languages = jsonDecode(response.body);
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("API Fetch Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Languages List")),
      body: languages.isEmpty
          ? Center(
          child: CircularProgressIndicator()) // Show loader while fetching
          : ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(languages[index]['name']),
            subtitle: Text("Native: ${languages[index]['nativeName']}"),
          );
        },
      ),
    );
  }
}

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when screen loads
  }

  /// **GET Method: Fetch Data from API**
  Future<void> fetchData() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      setState(() {
        items = jsonDecode(response.body);
      });
    } else {
      print("Failed to fetch data");
    }
  }

  /// **POST Method: Add New Item**
  Future<void> addItem() async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'title': 'New Item', 'body': 'This is a new post', 'userId': 1}),
    );

    if (response.statusCode == 201) {
      final newItem = jsonDecode(response.body);
      setState(() {
        items.insert(0, newItem); // Add the new item to the top of the list
      });
    } else {
      print("Failed to add item");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView with API')),
      body: items.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]['title']),
            subtitle: Text(items[index]['body']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}

class DateTextFieldExample extends StatefulWidget {
  @override
  _DateTextFieldExampleState createState() => _DateTextFieldExampleState();
}

class _DateTextFieldExampleState extends State<DateTextFieldExample> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context,
      TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // Minimum selectable date
      lastDate: DateTime(2100), // Maximum selectable date
    );

    if (pickedDate != null) {
      setState(() {
        controller.text =
        "${pickedDate.toLocal()}".split(' ')[0]; // Format the date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date Picker in TextField")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: fromDateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "From Date",
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, fromDateController),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: toDateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "To Date",
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, toDateController),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateRangePickerExample extends StatefulWidget {
  @override
  _DateRangePickerExampleState createState() => _DateRangePickerExampleState();
}

class _DateRangePickerExampleState extends State<DateRangePickerExample> {
  DateTimeRange? selectedDateRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000), // fromDate
      lastDate: DateTime(2100), // toDate
      initialDateRange: selectedDateRange,
    );

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  Future<void> _selectToRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000), // fromDate
      lastDate: DateTime(2100), // toDate
      initialDateRange: selectedDateRange,
    );

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Date Range Picker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedDateRange == null
                  ? "No date selected"
                  : "From: ${selectedDateRange!.start.toString().split(
                  ' ')[0]}\nTo: ${selectedDateRange!.end.toString().split(
                  ' ')[0]}",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDateRange(context),
              child: Text('Select Date Range'),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProximityCheckScreen(),
//     );
//   }
// }

class ProximityCheckScreen extends StatefulWidget {
  @override
  _ProximityCheckScreenState createState() => _ProximityCheckScreenState();
}

class _ProximityCheckScreenState extends State<ProximityCheckScreen> {
  TextEditingController latController1 = TextEditingController();
  TextEditingController lonController1 = TextEditingController();
  TextEditingController latController2 = TextEditingController();
  TextEditingController lonController2 = TextEditingController();
  double distance = 0.0;

  void _calculateDistance() {
    double lat1 = double.tryParse(latController1.text) ?? 0.0;
    double lon1 = double.tryParse(lonController1.text) ?? 0.0;
    double lat2 = double.tryParse(latController2.text) ?? 0.0;
    double lon2 = double.tryParse(lonController2.text) ?? 0.0;

    // Check if both locations are the same
    if (lat1 == lat2 && lon1 == lon2) {
      setState(() {
        distance = 0.0; // Same location, distance should be 0
      });
      return;
    }

    // Calculate the distance between two locations
    double calculatedDistance =
    Geolocator.distanceBetween(lat1, lon1, lat2, lon2);

    setState(() {
      distance = calculatedDistance; // Distance in meters
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Proximity Check")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter First Location"),
            TextField(
              controller: latController1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Latitude"),
            ),
            TextField(
              controller: lonController1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Longitude"),
            ),
            SizedBox(height: 20),
            Text("Enter Second Location"),
            TextField(
              controller: latController2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Latitude"),
            ),
            TextField(
              controller: lonController2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Longitude"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateDistance,
              child: Text("Check Distance"),
            ),
            SizedBox(height: 20),
            Text("Distance: ${distance.toStringAsFixed(2)} meters",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class DistanceCalculator extends StatefulWidget {
  @override
  _DistanceCalculatorState createState() => _DistanceCalculatorState();
}

class _DistanceCalculatorState extends State<DistanceCalculator> {
  late GoogleMapController _mapController;
  LatLng userLocation = LatLng(37.7749, -122.4194); // Default: San Francisco
  LatLng destination = LatLng(34.0522, -118.2437); // Example: Los Angeles
  String distanceMessage = "Tap the button to calculate distance.";

  // Get user's current location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => distanceMessage = "❌ Location services are disabled.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => distanceMessage = "❌ Location permission denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(
              () =>
          distanceMessage = "❌ Location permission permanently denied.");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      userLocation = LatLng(position.latitude, position.longitude);
      _mapController.animateCamera(CameraUpdate.newLatLng(userLocation));
    });

    _calculateDistance();
  }

  // Calculate distance in meters between two locations
  void _calculateDistance() {
    double distance = Geolocator.distanceBetween(
      userLocation.latitude,
      userLocation.longitude,
      destination.latitude,
      destination.longitude,
    );

    setState(() {
      distanceMessage = "Distance: ${(distance / 1000).toStringAsFixed(2)} km";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Map Distance Calculator")),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition:
              CameraPosition(target: userLocation, zoom: 6),
              onMapCreated: (controller) => _mapController = controller,
              markers: {
                Marker(
                    markerId: MarkerId('user'),
                    position: userLocation,
                    infoWindow: InfoWindow(title: "Your Location")),
                Marker(
                    markerId: MarkerId('destination'),
                    position: destination,
                    infoWindow: InfoWindow(title: "Destination")),
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(distanceMessage,
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _getCurrentLocation,
                  child: Text("Calculate Distance"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// void main() => runApp(MaterialApp(home: DistanceCalculator()));
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DistanceCalculatorScreen(),
//     );
//   }
// }

class DistanceCalculatorScreen extends StatefulWidget {
  @override
  _DistanceCalculatorScreenState createState() =>
      _DistanceCalculatorScreenState();
}

class _DistanceCalculatorScreenState extends State<DistanceCalculatorScreen> {
  double distance = 0.0;

  void _calculateProximity() {
    double startLat = 12.9716; // Example: Bangalore
    double startLng = 77.5946;
    double endLat = 13.0827; // Example: Chennai
    double endLng = 80.2707;

    double calculatedDistance =
        Geolocator.distanceBetween(startLat, startLng, endLat, endLng) /
            1000; // Convert meters to km

    setState(() {
      distance = calculatedDistance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Proximity Calculation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Distance: ${distance.toStringAsFixed(2)} km",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateProximity,
              child: Text("Calculate Distance"),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LocationScreen(),
//     );
//   }
// }

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String locationMessage = "Press button to get location";

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationMessage = "Location services are disabled.";
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationMessage = "Location permission denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationMessage = "Location permissions are permanently denied.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      locationMessage =
      "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Geolocation in Flutter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationMessage, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text("Get Current Location"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImageScreen extends StatefulWidget {
  @override
  _ProfileImageScreenState createState() => _ProfileImageScreenState();
}

class _ProfileImageScreenState extends State<ProfileImageScreen> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  // Method to capture or pick the profile image
  Future<void> _pickProfileImage() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    String formattedDate =
    DateFormat('yyyy-MM-dd – hh:mm:ss a').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Image with Time & Date'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Display the profile image
            if (_profileImage != null)
              ClipOval(
                child: Image.file(
                  _profileImage!,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              )
            else
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
            // Overlay the current time and date on top of the profile image
            Positioned(
              bottom: 10,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  formattedDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            // Button to pick a profile image
            Positioned(
              bottom: 80,
              child: ElevatedButton(
                onPressed: _pickProfileImage,
                child: Text('Pick Profile Image'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCapturePage extends StatefulWidget {
  @override
  _ImageCapturePageState createState() => _ImageCapturePageState();
}

class _ImageCapturePageState extends State<ImageCapturePage> {
  File? _image;
  String? _dateTime;
  TextEditingController FromshiftController = TextEditingController();
  TextEditingController ToshiftController = TextEditingController();

  // Function to capture an image using the camera
  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() async {
        _image = File(pickedFile.path);
        // Get current date and time
        _dateTime = DateTime.now().toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture Image and Show Date/Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(_image!), // Display the captured image
            SizedBox(height: 20),
            if (_dateTime != null)
              Text(
                'Captured on: $_dateTime', // Display current time and date
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _captureImage,
              child: Text('Capture Image'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class DatePickerScreen extends StatefulWidget {
//   @override
//   _DatePickerScreenState createState() => _DatePickerScreenState();
// }
//
// class _DatePickerScreenState extends State<DatePickerScreen> {
//   DateTime? fromDate;
//   DateTime? toDate;
//
//   Future<void> _selectFromDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: fromDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//
//     if (picked != null && picked != fromDate) {
//       setState(() {
//         fromDate = picked;
//       });
//     }
//   }
//
//   Future<void> _selectToDate(BuildContext context) async {
//     if (fromDate == null) {
//       // Show an error if "From Date" is not selected yet.
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please select a "From Date" first.')),
//       );
//       return;
//     }
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: toDate ?? fromDate!, // Default to "From Date" if not set
//       firstDate: fromDate!, // "To Date" should be after "From Date"
//       lastDate: DateTime(2101),
//     );
//
//     if (picked != null && picked != toDate) {
//       setState(() {
//         toDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('From and To Date Picker'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text("From Date: "),
//                 Text(fromDate != null
//                     ? fromDate!.toLocal().toString().split(' ')[0]
//                     : 'Select a date'),
//                 IconButton(
//                   icon: Icon(Icons.calendar_today),
//                   onPressed: () => _selectFromDate(context),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 Text("To Date: "),
//                 Text(toDate != null
//                     ? toDate!.toLocal().toString().split(' ')[0]
//                     : 'Select a date'),
//                 IconButton(
//                   icon: Icon(Icons.calendar_today),
//                   onPressed: () => _selectToDate(context),
//                 ),
//               ],
//             ),
//             SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//                 if (fromDate != null && toDate != null) {
//                   if (toDate!.isBefore(fromDate!)) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                           content: Text(
//                               'The "To Date" should be after the "From Date".')),
//                     );
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                           content: Text(
//                               'From: ${fromDate!.toLocal().toString().split(' ')[0]} To: ${toDate!.toLocal().toString().split(' ')[0]}')),
//                     );
//                   }
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// //////////////geolation
//
// class LocationScreen extends StatefulWidget {
//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<LocationScreen> {
//   String lat = "Latitude";
//   String long = "Longitude";
//
//   @override
//   void initState() {
//     super.initState();
//     _checkPermission();
//   }
//
//   Future<void> _checkPermission() async {
//     PermissionStatus status = await Permission.location.request();
//
//     if (status.isGranted) {
//       _getCurrentLocation();
//     } else {
//       setState(() {
//         lat = "Permission Denied!";
//         long = "Permission Denied!";
//       });
//     }
//   }
//
//   Future<void> _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       setState(() {
//         lat =
//             'Latitude: ${position.latitude}';
//            long=     'Longitude: ${position.longitude}';
//       });
//     } catch (e) {
//       setState(() {
//         lat = "Error getting location: $e";
//         long = "Error getting location: $e";
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Get Location Example'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text(lat), Text(long),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// //
// // class LocationWidget extends StatefulWidget {
// //   const LocationWidget({Key? key}) : super(key: key);
// //
// //   @override
// //   _LocationWidgetState createState() => _LocationWidgetState();
// // }
// //
// // class _LocationWidgetState extends State<LocationWidget> {
// //   Position? position;
// //
// //   fetchPosition() async {
// //     bool serviceEnabled;
// //     LocationPermission permission;
// //
// //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       return Future.error('Location services are disabled.');
// //     }
// //
// //     permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         return Future.error('Location permissions are denied');
// //       }
// //     }
// //
// //     if (permission == LocationPermission.deniedForever) {
// //       return Future.error(
// //           'Location permissions are permanently denied, we cannot request permissions.');
// //     }
// //     Position currentposition = await Geolocator.getCurrentPosition();
// //     setState(() {
// //       position = currentposition;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Location')),
// //       body: Center(
// //           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
// //         Text(position == null ? 'Location' : position.toString()),
// //         ElevatedButton(
// //             onPressed: () => fetchPosition(), child: Text('Find Location'))
// //       ])),
// //     );
// //   }
// // }
// //
// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // // import 'package:image_cropper/image_cropper.dart';
// // // import 'package:image_picker/image_picker.dart';
// // //
// // //
// // // class HomeScreen extends StatefulWidget {
// // //   const HomeScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<HomeScreen> createState() => _HomeScreenState();
// // // }
// // //
// // // class _HomeScreenState extends State<HomeScreen> {
// // //   File? imageFile;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Select & Crop Image'),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           children: [
// // //             const SizedBox(
// // //               height: 20.0,
// // //             ),
// // //             imageFile == null
// // //                 ? Image.asset(
// // //                     'assets/images/h1.png',
// // //                     height: 300.0,
// // //                     width: 300.0,
// // //                   )
// // //                 : ClipRRect(
// // //                     borderRadius: BorderRadius.circular(150.0),
// // //                     child: Image.file(
// // //                       imageFile!,
// // //                       height: 300.0,
// // //                       width: 300.0,
// // //                       fit: BoxFit.fill,
// // //                     )),
// // //             const SizedBox(
// // //               height: 20.0,
// // //             ),
// // //             ElevatedButton(
// // //               onPressed: () async {
// // //                 Map<Permission, PermissionStatus> statuses = await [
// // //                   Permission.storage,
// // //                   Permission.camera,
// // //                 ].request();
// // //                 if (statuses[Permission.storage]!.isGranted &&
// // //                     statuses[Permission.camera]!.isGranted) {
// // //                   showImagePicker(context);
// // //                 } else {
// // //                   print('no permission provided');
// // //                 }
// // //               },
// // //               child: Text('Select Image'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   final picker = ImagePicker();
// // //
// // //   void showImagePicker(BuildContext context) {
// // //     showModalBottomSheet(
// // //         context: context,
// // //         builder: (builder) {
// // //           return Card(
// // //             child: Container(
// // //                 width: MediaQuery.of(context).size.width,
// // //                 height: MediaQuery.of(context).size.height / 5.2,
// // //                 margin: const EdgeInsets.only(top: 8.0),
// // //                 padding: const EdgeInsets.all(12),
// // //                 child: Row(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     Expanded(
// // //                         child: InkWell(
// // //                       child: Column(
// // //                         children: const [
// // //                           Icon(
// // //                             Icons.image,
// // //                             size: 60.0,
// // //                           ),
// // //                           SizedBox(height: 12.0),
// // //                           Text(
// // //                             "Gallery",
// // //                             textAlign: TextAlign.center,
// // //                             style: TextStyle(fontSize: 16, color: Colors.black),
// // //                           )
// // //                         ],
// // //                       ),
// // //                       onTap: () {
// // //                         _imgFromGallery();
// // //                         Navigator.pop(context);
// // //                       },
// // //                     )),
// // //                     Expanded(
// // //                         child: InkWell(
// // //                       child: SizedBox(
// // //                         child: Column(
// // //                           children: const [
// // //                             Icon(
// // //                               Icons.camera_alt,
// // //                               size: 60.0,
// // //                             ),
// // //                             SizedBox(height: 12.0),
// // //                             Text(
// // //                               "Camera",
// // //                               textAlign: TextAlign.center,
// // //                               style:
// // //                                   TextStyle(fontSize: 16, color: Colors.black),
// // //                             )
// // //                           ],
// // //                         ),
// // //                       ),
// // //                       onTap: () {
// // //                         _imgFromCamera();
// // //                         Navigator.pop(context);
// // //                       },
// // //                     ))
// // //                   ],
// // //                 )),
// // //           );
// // //         });
// // //   }
// // //
// // //   _imgFromGallery() async {
// // //     await picker
// // //         .pickImage(source: ImageSource.gallery, imageQuality: 50)
// // //         .then((value) {
// // //       if (value != null) {
// // //         _cropImage(File(value.path));
// // //       }
// // //     });
// // //   }
// // //
// // //   _imgFromCamera() async {
// // //     await picker
// // //         .pickImage(source: ImageSource.camera, imageQuality: 50)
// // //         .then((value) {
// // //       if (value != null) {
// // //         _cropImage(File(value.path));
// // //       }
// // //     });
// // //   }
// // //
// // //   _cropImage(File imgFile) async {
// // //     final croppedFile = await ImageCropper().cropImage(
// // //         sourcePath: imgFile.path,
// // //         // aspectRatioPresets: Platform.isAndroid
// // //         //     ? [
// // //         //         CropAspectRatioPreset.square,
// // //         //         CropAspectRatioPreset.ratio3x2,
// // //         //         CropAspectRatioPreset.original,
// // //         //         CropAspectRatioPreset.ratio4x3,
// // //         //         CropAspectRatioPreset.ratio16x9
// // //         //       ]
// // //         //     : [
// // //         //         CropAspectRatioPreset.original,
// // //         //         CropAspectRatioPreset.square,
// // //         //         CropAspectRatioPreset.ratio3x2,
// // //         //         CropAspectRatioPreset.ratio4x3,
// // //         //         CropAspectRatioPreset.ratio5x3,
// // //         //         CropAspectRatioPreset.ratio5x4,
// // //         //         CropAspectRatioPreset.ratio7x5,
// // //         //         CropAspectRatioPreset.ratio16x9
// // //         //       ],
// // //         uiSettings: [
// // //           AndroidUiSettings(
// // //               toolbarTitle: "Image Cropper",
// // //               toolbarColor: Colors.deepOrange,
// // //               toolbarWidgetColor: Colors.white,
// // //               initAspectRatio: CropAspectRatioPreset.original,
// // //               lockAspectRatio: false),
// // //           IOSUiSettings(
// // //             title: "Image Cropper",
// // //           )
// // //         ]);
// // //     if (croppedFile != null) {
// // //       imageCache.clear();
// // //       setState(() {
// // //         imageFile = File(croppedFile.path);
// // //       });
// // //       // reload();
// // //     }
// // //   }
// // // }
// // //
// // // class GalleryAccess extends StatefulWidget {
// // //   const GalleryAccess({super.key});
// // //
// // //   @override
// // //   State<GalleryAccess> createState() => _GalleryAccessState();
// // // }
// // //
// // // class _GalleryAccessState extends State<GalleryAccess> {
// // //   File? galleryFile;
// // //   final picker = ImagePicker();
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     //display image selected from gallery
// // //
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Gallery and Camera Access'),
// // //         backgroundColor: Colors.green,
// // //         actions: const [],
// // //       ),
// // //       body: Builder(
// // //         builder: (BuildContext context) {
// // //           return Center(
// // //             child: Column(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 ElevatedButton(
// // //                   style: ButtonStyle(
// // //                       backgroundColor: MaterialStateProperty.all(Colors.green)),
// // //                   child: const Text('Select Image from Gallery and Camera'),
// // //                   onPressed: () {
// // //                     _showPicker(context: context);
// // //                   },
// // //                 ),
// // //                 const SizedBox(
// // //                   height: 20,
// // //                 ),
// // //                 SizedBox(
// // //                   height: 200.0,
// // //                   width: 300.0,
// // //                   child: galleryFile == null
// // //                       ? const Center(child: Text('Sorry nothing selected!!'))
// // //                       : Center(child: Image.file(galleryFile!)),
// // //                 ),
// // //                 const Padding(
// // //                   padding: EdgeInsets.symmetric(vertical: 18.0),
// // //                   child: Text(
// // //                     "GFG",
// // //                     textScaleFactor: 3,
// // //                     style: TextStyle(color: Colors.green),
// // //                   ),
// // //                 )
// // //               ],
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // //
// // //   void _showPicker({
// // //     required BuildContext context,
// // //   }) {
// // //     showModalBottomSheet(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return SafeArea(
// // //           child: Wrap(
// // //             children: <Widget>[
// // //               ListTile(
// // //                 leading: const Icon(Icons.photo_library),
// // //                 title: const Text('Photo Library'),
// // //                 onTap: () {
// // //                   getImage(ImageSource.gallery);
// // //                   Navigator.of(context).pop();
// // //                 },
// // //               ),
// // //               ListTile(
// // //                 leading: const Icon(Icons.photo_camera),
// // //                 title: const Text('Camera'),
// // //                 onTap: () {
// // //                   getImage(ImageSource.camera);
// // //                   Navigator.of(context).pop();
// // //                 },
// // //               ),
// // //             ],
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   Future getImage(
// // //     ImageSource img,
// // //   ) async {
// // //     final pickedFile = await picker.pickImage(source: img);
// // //     XFile? xfilePick = pickedFile;
// // //     setState(
// // //       () {
// // //         if (xfilePick != null) {
// // //           galleryFile = File(pickedFile!.path);
// // //         } else {
// // //           ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
// // //               const SnackBar(content: Text('Nothing is selected')));
// // //         }
// // //       },
// // //     );
// // //   }
// // // }
