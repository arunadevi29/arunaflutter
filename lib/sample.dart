import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HospitalListScreen extends StatefulWidget {
  @override
  _HospitalListScreenState createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  List<dynamic> hospitals = []; // Stores fetched hospitals

  @override
  void initState() {
    super.initState();
    fetchHospitals(); // Fetch data on startup
  }

  /// Fetch data from API (GET)
  Future<void> fetchHospitals() async {
    final response = await http.get(Uri.parse('https://yourapi.com/hospitals'));

    if (response.statusCode == 200) {
      setState(() {
        hospitals = json.decode(response.body); // Store response data
      });
    } else {
      print("Failed to load data");
    }
  }

  /// Add new hospital to API (POST)
  Future<void> addHospital(String name) async {
    final response = await http.post(
      Uri.parse('https://yourapi.com/hospitals'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"name": name}),
    );

    if (response.statusCode == 201) {
      setState(() {
        hospitals.insert(0, {"name": name}); // Add new item to UI
      });
    } else {
      print("Failed to add hospital");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hospitals")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => addHospital("New Hospital"),
            child: Text("Add Hospital"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(hospitals[index]["name"]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Text("Set locale to German"),
          onPressed: () => MyApp.of(context)
              ?.setLocale(Locale.fromSubtags(languageCode: 'de')),
        ),
        TextButton(
          child: Text("Set locale to English"),
          onPressed: () => MyApp.of(context)
              ?.setLocale(Locale.fromSubtags(languageCode: 'en')),
        ),
      ],
    );
  }
}
//
//
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// void main() => runApp(MyAppcard());
//
// class MyAppcard extends StatelessWidget {
//   // Create a GlobalKey to access the TextField widget state
//   final GlobalKey<_LocationFormState> locationKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Location in TextField")),
//         body: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               LocationForm(key: locationKey), // Assign GlobalKey to widget
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Access getCurrentLocation method using GlobalKey
//                   locationKey.currentState?.getCurrentLocation();
//                 },
//                 child: Text("Get Location"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// //
// class LocationForm extends StatefulWidget {
//   LocationForm({Key? key}) : super(key: key);
//
//   @override
//   _LocationFormState createState() => _LocationFormState();
// }
//
// class _LocationFormState extends State<LocationForm> {
//   TextEditingController LatitudeController = TextEditingController();
//   TextEditingController LongitudeController = TextEditingController();
//
//   // Method to fetch the current location
//   Future<void> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       setState(() {
//         LatitudeController.text = "Location services are disabled";
//         LongitudeController.text = "Location services are disabled";
//       });
//       return;
//     }
//
//     // Check location permissions
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         setState(() {
//           LatitudeController.text = "Location services are disabled";
//           LongitudeController.text = "Location services are disabled";
//         });
//         return;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       setState(() {
//         LatitudeController.text = "Location services are disabled";
//         LongitudeController.text = "Location services are disabled";
//       });
//       return;
//     }
//
//     // Get the current location
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//
//     setState(() {
//       LatitudeController.text =
//       "Lat: ${position.latitude}";
//       LongitudeController.text =
//       "Lng: ${position.longitude}";
//
//       // LatitudeController.text =
//       // "Lat: ${position.latitude}, Lng: ${position.longitude}";
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Column(
//         children: [
//           TextField(
//           AddContractor: LatitudeController,
//           readOnly: true, // Make it read-only
//           decoration: InputDecoration(
//             labelText: "Latitude",
//             border: OutlineInputBorder(),
//           ),
//               ), TextField(
//           AddContractor: LongitudeController,
//           readOnly: true, // Make it read-only
//           decoration: InputDecoration(
//             labelText: "Location",
//             border: OutlineInputBorder(),
//           ),
//               ),
//         ],
//       );
//   }
// }
// //
// //
// // class GoogleMapScreen extends StatefulWidget {
// //   @override
// //   _GoogleMapScreenState createState() => _GoogleMapScreenState();
// // }
// //
// // class _GoogleMapScreenState extends State<GoogleMapScreen> {
// //   GoogleMapController? _controller;
// //   LatLng? _currentPosition;
// //   final CameraPosition _initialPosition = CameraPosition(
// //     target: LatLng(37.7749, -122.4194), // Default (San Francisco)
// //     zoom: 14,
// //   );
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchCurrentLocation();
// //   }
// //
// //
// //   Future<void> getCurrentLocation() async {
// //     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       print("Location services are disabled.");
// //       return;
// //     }
// //
// //     LocationPermission permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         print("Location permission denied.");
// //         return;
// //       }
// //     }
// //
// //     if (permission == LocationPermission.deniedForever) {
// //       print("Location permission permanently denied. Open app settings.");
// //       await openAppSettings();
// //       return;
// //     }
// //
// //     Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);
// //     print("Location: ${position.latitude}, ${position.longitude}");
// //   }
// //
// //
// //   Future<void> _fetchCurrentLocation() async {
// //     try {
// //       Position position = await Geolocator.getCurrentPosition(
// //           desiredAccuracy: LocationAccuracy.high);
// //       setState(() {
// //         _currentPosition = LatLng(position.latitude, position.longitude);
// //       });
// //
// //       if (_controller != null) {
// //         _controller!.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
// //       }
// //     } catch (e) {
// //       print("Error fetching location: $e");
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Google Maps Example")),
// //       body: GoogleMap(
// //         initialCameraPosition: _initialPosition,
// //         myLocationEnabled: true,
// //         myLocationButtonEnabled: true,
// //         zoomControlsEnabled: true,
// //         onMapCreated: (GoogleMapController AddContractor) {
// //           _controller = AddContractor;
// //           if (_currentPosition != null) {
// //             _controller!.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
// //           }
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: getCurrentLocation,
// //         child: Icon(Icons.my_location),
// //       ),
// //     );
// //   }
// // }
// //
// //
// // Future<void> requestLocationPermission() async {
// //   var status = await Permission.location.status;
// //
// //   if (!status.isGranted) {
// //     status = await Permission.location.request();
// //
// //     if (status.isGranted) {
// //       print("Location permission granted");
// //     } else if (status.isDenied) {
// //       print("Location permission denied");
// //     } else if (status.isPermanentlyDenied) {
// //       openAppSettings(); // Directs the user to app settings
// //     }
// //   }
// // }
// // Future<Position> getCurrentLocation() async {
// //   bool serviceEnabled;
// //   LocationPermission permission;
// //
// //   // Check if location services are enabled
// //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //   if (!serviceEnabled) {
// //     return Future.error("Location services are disabled.");
// //   }
// //
// //   // Check permission status
// //   permission = await Geolocator.checkPermission();
// //   if (permission == LocationPermission.denied) {
// //     permission = await Geolocator.requestPermission();
// //     if (permission == LocationPermission.denied) {
// //       return Future.error("Location permission denied.");
// //     }
// //   }
// //
// //   if (permission == LocationPermission.deniedForever) {
// //     return Future.error("Location permission permanently denied.");
// //   }
// //
// //   // Get current location
// //   return await Geolocator.getCurrentPosition(
// //       desiredAccuracy: LocationAccuracy.high);
// // }
// // void fetchLocation() async {
// //   await requestLocationPermission();
// //   try {
// //     Position position = await getCurrentLocation();
// //     print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
// //   } catch (e) {
// //     print("Error: $e");
// //   }
// // }
// // class location extends StatefulWidget {
// //   const location({super.key});
// //
// //   @override
// //   State<location> createState() => _locationState();
// // }
// //
// // class _locationState extends State<location> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: ElevatedButton(
// //         onPressed: fetchLocation,
// //         child: Text("Get Location"),
// //       )
// //       ,
// //     );
// //   }
// // }
// //
// //
// //
// //
// // class MapLauncherScreen extends StatelessWidget {
// //   final double latitude = 37.7749; // Example: San Francisco
// //   final double longitude = -122.4194;
// //   String lat = "";
// //   String long = "";
// //
// //   Future<void> _openMap(String lat, String long) async {
// //     String googleURL =
// //         'https://www.google.com/maps/search/?api=1&query=$lat,$long';
// //     await canLaunchUrlString(googleURL)
// //         ? await launchUrlString(googleURL)
// //         : throw "Could not launch $googleURL";
// //   }
// //
// //   // Future<void> _launchMaps() async {
// //   //   final Uri googleUrl = Uri.parse(
// //   //       "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
// //   //
// //   //   if (await canLaunchUrl(googleUrl)) {
// //   //     await launchUrl(googleUrl, mode: LaunchMode.externalApplication);
// //   //   } else {
// //   //     throw 'Could not launch $googleUrl';
// //   //   }
// //   // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Launch Google Maps')),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             _openMap(lat,long);
// //           },
// //           child: Text('Open Google Maps'),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// //
// // class LocationScreen extends StatefulWidget {
// //   @override
// //   _LocationScreenState createState() => _LocationScreenState();
// // }
// //
// // class _LocationScreenState extends State<LocationScreen> {
// //   double? latitude;
// //   double? longitude;
// //
// //   Future<void> _getCurrentLocation() async {
// //     bool serviceEnabled;
// //     LocationPermission permission;
// //
// //     // Check if location services are enabled
// //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       return Future.error('Location services are disabled.');
// //     }
// //
// //     // Check and request location permissions
// //     permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         return Future.error('Location permissions are denied.');
// //       }
// //     }
// //
// //     if (permission == LocationPermission.deniedForever) {
// //       return Future.error(
// //           'Location permissions are permanently denied. Enable manually in settings.');
// //     }
// //
// //     // Get current position
// //     Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);
// //
// //     setState(() {
// //       latitude = position.latitude;
// //       longitude = position.longitude;
// //     });
// //
// //     print("Latitude: $latitude, Longitude: $longitude");
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Get Location')),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(latitude != null && longitude != null
// //                 ? "Latitude: $latitude, Longitude: $longitude"
// //                 : "Press the button to get location"),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _getCurrentLocation,
// //               child: Text('Get Location'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
