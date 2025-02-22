import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'CommenFiles/functions.dart';
import 'CommenFiles/getXcontroller.dart';
import 'Screens/Admin/FacilityCardDetails/model/FacilitylistModel.dart';
import 'Screens/ShiftTime/ShiftTimeScreen/model/ShiftTimeModel.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Screens/SiteHeader/AddSiteHead/model/SinglehospitalModel.dart';
import 'Screens/SiteHeader/AddSiteHead/model/Siteheadmodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Model class for Post
class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  // Factory method to create Post object from JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

//
// class PostListScreen extends StatefulWidget {
//   @override
//   _PostListScreenState createState() => _PostListScreenState();
// }
//
// class _PostListScreenState extends State<PostListScreen> {
//   List<Siteheadmodeldata> posts = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchPosts(); // Call API on screen load
//   }
//
//   // Fetch data from API (GET method)
//   Future<void> fetchPosts() async {
//     final response = await http.get(
//         Uri.parse("https://jsonplaceholder.typicode.com/posts"));
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       setState(() {
//         posts = data.map((json) => Siteheadmodeldata.fromJson(json)).toList();
//         isLoading = false;
//       });
//     } else {
//       throw Exception("Failed to load posts");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Fetch API Data in ListView")),
//       body: isLoading
//           ? Center(
//           child: CircularProgressIndicator()) // Show loader while fetching
//           : ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             // title: Text(posts,
//             //     style: TextStyle(fontWeight: FontWeight.bold)),
//             // subtitle: Text(posts[index].fieldSiteName),
//             // leading: CircleAvatar(child: Text(posts[index].id.toString())),
//           );
//         },
//       ),
//     );
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FieldListScreen(),
    );
  }
}

// Model Class
class FieldItem {
  int id;
  String fieldName;
  String fieldImage;
  int count;

  FieldItem(
      {required this.id,
      required this.fieldName,
      required this.fieldImage,
      required this.count});

  factory FieldItem.fromJson(Map<String, dynamic> json) {
    return FieldItem(
      id: json['id'],
      fieldName: json['FieldName'],
      fieldImage: json['FieldImage'],
      count: json['Count'],
    );
  }
}

class FieldListScreen extends StatefulWidget {
  @override
  _FieldListScreenState createState() => _FieldListScreenState();
}

class _FieldListScreenState extends State<FieldListScreen> {
  List<FieldItem> fields = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  // Simulating JSON fetching and parsing
  void loadJsonData() {
    String jsonData = '''{
    "Field": [
      {"id": 3, "FieldName": "Hospital", "FieldImage": "img_1.jpg", "Count": 0},
      {"id": 5, "FieldName": "Hospital", "FieldImage": "img_1.jpg", "Count": 0},
      {"id": 6, "FieldName": "College", "FieldImage": "img_1.jpg", "Count": 0},
      {"id": 8, "FieldName": "College", "FieldImage": "img_1.jpg", "Count": 0},
      {"id": 9, "FieldName": "College", "FieldImage": "img_1.jpg", "Count": 0},
      {"id": 10, "FieldName": "College", "FieldImage": "img_1.jpg", "Count": 0}
    ]
  }''';

    final parsedJson = json.decode(jsonData);
    setState(() {
      fields = (parsedJson['Field'] as List)
          .map((item) => FieldItem.fromJson(item))
          .toList();
    });
  }

  // Function to increment count
  void incrementCount(int index) {
    setState(() {
      fields[index].count++;
    });
  }

  // Function to decrement count
  void decrementCount(int index) {
    setState(() {
      if (fields[index].count > 0) {
        fields[index].count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Field List")),
      body: ListView.builder(
        itemCount: fields.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: ListTile(
              // leading: Image.asset('assets/${fields[index].fieldImage}',
              //     width: 50, height: 50, fit: BoxFit.cover),
              title: Text(fields[index].fieldName),
              subtitle: Text("Count: ${fields[index].count}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.red),
                    onPressed: () => decrementCount(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.green),
                    onPressed: () => incrementCount(index),
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

class CardListView extends StatefulWidget {
  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  String responseMessage = "No response yet";

  Future<void> sendPostRequest() async {
    final url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts'); // Example API
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "title": "Flutter POST Request",
      "body": "This is a test post request",
      "userId": 1
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        setState(() {
          responseMessage = "Success: ${jsonDecode(response.body)['title']}";
        });
      } else {
        setState(() {
          responseMessage = "Error: ${response.statusCode} - ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        responseMessage = "Failed to connect: $e";
      });
    }
  }

  List<Map<String, String>> items = [
    {"title": "Flutter", "subtitle": "Build beautiful apps"},
    {"title": "Dart", "subtitle": "Fast programming language"},
  ];

  void addItem() {
    setState(() {
      items.add({
        "title": "New Item ${items.length + 1}",
        "subtitle": "Description for item ${items.length + 1}",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dynamic Card ListView")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5, // Adds shadow effect
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(items[index]["title"]![0]), // First letter
              ),
              title: Text(items[index]["title"]!),
              subtitle: Text(items[index]["subtitle"]!),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    items.removeAt(index); // Remove item
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: Icon(Icons.add),
        tooltip: "Add New Item",
      ),
    );
  }
}

class Hospital {
  int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String fieldSiteName;
  String? image;

  Hospital({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.fieldSiteName,
    this.image,
  });

  // Convert JSON to Dart Model
  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json["Id"],
      firstName: json["FirstName"],
      lastName: json["LastName"],
      mobileNumber: json["MobileNumber"],
      fieldSiteName: json["FieldSiteName"],
      image: json["Image"], // Image may be null
    );
  }
}

class HospitalListScreen extends StatefulWidget {
  @override
  _HospitalListScreenState createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  // Fetch data from API
  Future<List<Hospital>> fetchHospitals() async {
    final response = await http
        .get(Uri.parse('https://mobileappapi.onrender.com/api/sitehead/all'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> hospitalList = jsonData["Hospital"]; // Extract List

      return hospitalList.map((json) => Hospital.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load hospital data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hospital List")),
      body: FutureBuilder<List<Hospital>>(
        future: fetchHospitals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading state
          } else if (snapshot.hasError) {
            return Center(
                child: Text("Error: ${snapshot.error}")); // Error state
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No hospitals found")); // No data state
          } else {
            List<Hospital> hospitals = snapshot.data!;

            return ListView.builder(
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                Hospital hospital = hospitals[index];

                return ListTile(
                  leading: Image.asset("assets/images/1.png",
                      width: 50, height: 50, fit: BoxFit.cover),

                  title: Text("${hospital.firstName} ${hospital.lastName}"),
                  subtitle: Text(
                      "${hospital.fieldSiteName}\n${hospital.mobileNumber}"),
                  isThreeLine: true,
                  // trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // print("Tapped on: ${hospital.firstName}");
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

class DynamicListView extends StatefulWidget {
  @override
  _DynamicListViewState createState() => _DynamicListViewState();
}

class _DynamicListViewState extends State<DynamicListView> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    fetchItems(); // Fetch items when the app starts
  }

  SiteheadApi() async {
    // print('userId ${memberId}');
    print("Event create api");
    final String? token = localStorage.read('api_token');
    final String? memberId = localStorage.read('member_id').toString();

    print('FirstName ${addSiteHeadController.FirstNameController.text}');
    print('LastName ${addSiteHeadController.LastNameController.text}');
    print('MobileNumber ${addSiteHeadController.MobileNumberController.text}');
    print('Field ${addSiteHeadController.FieldController.text}');
    print(
        'FieldSiteName ${addSiteHeadController.FieldSiteNamerController.text}');
    print('Password ${addSiteHeadController.EnterPasswordController.text}');
    print(
        'ConfirmPassword ${addSiteHeadController.ConfirmPasswordController.text}');
    print('Image ${addSiteHeadController.images.value}');
    print('userId ${memberId}');
    try {
      final response = await http.post(
        Uri.parse('https://mobileappapi.onrender.com/api/sitehead/create'),
        // Change this to your actual API
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json",
        },

        body: jsonEncode({
          "FirstName": addSiteHeadController.FirstNameController.text,
          "LastName": addSiteHeadController.LastNameController.text,
          "MobileNumber": addSiteHeadController.MobileNumberController.text,
          "Field": addSiteHeadController.FieldController.text,
          "FieldSiteName": addSiteHeadController.FieldSiteNamerController.text,
          "Password": addSiteHeadController.EnterPasswordController.text,
          "ConfirmPassword":
              addSiteHeadController.ConfirmPasswordController.text,
          "Image": addSiteHeadController.images.value,
        }),
      );

      if (response.statusCode == 201) {
        print("Data added successfully: ${response.body}");
        // fetchHospitals();
      } else {
        print("Failed with status code: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // GET Request to Fetch Data
  Future<void> fetchItems() async {
    final response = await http.get(
        Uri.parse('https://mobileappapi.onrender.com/api/sitehead/create'));

    if (response.statusCode == 200) {
      Map<String, Hospital> newItem = jsonDecode(response.body);
      List<Hospital> data = jsonDecode(response.body);
      // shifttimeformController.shifttimeApiData.value = fa(data);
      setState(() {
        items = data
            .map((item) => {
                  "id": newItem["id"],
                  "WorkType": newItem["WorkType"],
                  "ShiftName": newItem["ShiftName"],
                  "ShiftFrom": newItem["ShiftFrom"],
                  "ShiftTo": newItem["ShiftTo"],
                })
            .toList();
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  // POST Request to Add New Data
  Future<void> addItem() async {
    final response = await http.post(
      Uri.parse('https://mobileappapi.onrender.com/api/shift/create'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "WorkType": "House Keeping",
        "ShiftName": "Morning Shift",
        "ShiftFrom": "08:00:00",
        "ShiftTo": "16:00:00",
        "userId": 16,
      }),
    );

    if (response.statusCode == 201) {
      Map<String, ShiftTimeModel> newItem = jsonDecode(response.body);
      setState(() {
        items.insert(0, {
          "id": newItem["id"],
          "WorkType": newItem["WorkType"],
          "ShiftName": newItem["ShiftName"],
          "ShiftFrom": newItem["ShiftFrom"],
          "ShiftTo": newItem["ShiftTo"],
        });
      });
    } else {
      throw Exception("Failed to add data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dynamic ListView with API")),
      body: items.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading:
                      CircleAvatar(child: Text(items[index]["id"].toString())),
                  title: Text(items[index]["title"]),
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
