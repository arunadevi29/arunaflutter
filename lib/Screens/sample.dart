import 'dart:convert';
import 'dart:io';

import 'package:attendanceapp/demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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

// Controller for managing products
// class ProductController extends GetxController {
//   RxList<Hospital> hospitals = RxList<Hospital>();
//   var isLoading = true.obs;
//   var errorMessage = ''.obs;
//
//   // Fetch data asynchronously
//   Future<void> fetchProducts() async {
//     try {
//       await Future.delayed(Duration(seconds: 2)); // Simulate API call
//       hospitals.value = [];
//       isLoading.value = false;
//       var data = ["City Hospital", "General Hospital"];
//       hospitals.value = data
//           .map((name) => Hospital(
//               id: 1,
//               firstName: '',
//               lastName: '',
//               mobileNumber: '',
//               fieldSiteName: ''))
//           .toList()
//           .obs;
//     } catch (e) {
//       errorMessage.value = "Failed to fetch products";
//       isLoading.value = false;
//     }
//   }
//
//   @override
//   void onInit() {
//     fetchProducts(); // Automatically fetch data on controller initialization
//     super.onInit();
//   }
// }
//
// class FutureObxListViewExample extends StatelessWidget {
//   final ProductController controller = Get.put(ProductController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("FutureBuilder + Obx ListView")),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator()); // Show loading
//         } else if (controller.errorMessage.isNotEmpty) {
//           return Center(
//               child: Text(controller.errorMessage.value)); // Show error
//         } else if (controller.hospitals.isEmpty) {
//           return Center(
//               child: Text("No products available")); // Show empty state
//         }
//
//         // Show ListView when data is available
//         return ListView.builder(
//           itemCount: controller.hospitals.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: Icon(Icons.shopping_bag),
//               title: Text(controller.hospitals[index].firstName),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

// void main() {
//   runApp(GetMaterialApp(
//     home: FutureObxListViewExample(),
//   ));
// }

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
