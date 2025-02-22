import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../widgets/AppBarSample.dart';

class FacilityAddListItemsController extends GetxController {
  String? selectedOption;

  // Options for the dropdown
  final List<String> options = ['Raja', 'Ram', 'mani', 'Rajesh'];

  // Future<void> requestLocationPermission() async {
  //   var status = await Permission.location.status;
  //
  //   if (!status.isGranted) {
  //     status = await Permission.location.request();
  //
  //     if (status.isGranted) {
  //       print("Location permission granted");
  //     } else if (status.isDenied) {
  //       print("Location permission denied");
  //     } else if (status.isPermanentlyDenied) {
  //       openAppSettings(); // Directs the user to app settings
  //     }
  //   }
  // }
  // Future<Position> getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error("Location services are disabled.");
  //   }
  //
  //   // Check permission status
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error("Location permission denied.");
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error("Location permission permanently denied.");
  //   }
  //
  //   // Get current location
  //   return await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  // }
  // void fetchLocation() async {
  //   await requestLocationPermission();
  //   try {
  //     Position position = await getCurrentLocation();
  //     print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }
  SampleItem? selectedItem;
  var _currentSelectedItem;
  List _studentList = ["sdfsd", "sdfsdf"];

  var timepicker = "";

  bool? isLoading;

  // Future<Position> _getCurrentLoction() async {
  //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error("Location services are disabled.");
  //   }
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error("Location Permission  are denied.");
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         "Location Permission  are permanently denied, we cannot request permission.");
  //   }
  //   return await Geolocator.getCurrentPosition();
  // }

  Future<void> openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw "Could not launch $googleURL";
  }

  // double? latitude;
  // double? longitude;
  //
  // Future<void> _getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   // Check and request location permissions
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied.');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied. Enable manually in settings.');
  //   }
  //
  //   // Get current position
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //
  //   setState(() {
  //     latitude = position.latitude;
  //     longitude = position.longitude;
  //   });
  //
  //   print("Latitude: $latitude, Longitude: $longitude");
  // }
  String lat = "Latitude";
  String long = "Longitude";

  double distancemeter = 0.0;

  Future<void> checkPermission() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      getCurrentLocation();
    } else {
      lat = "Permission Denied!";
      long = "Permission Denied!";
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      // Check and request location permissions
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied. Enable manually in settings.');
      }

      lat = '${position.latitude}';
      long = '${position.longitude}';

      print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
    } catch (e) {
      lat = "Error getting location: $e";
      long = "Error getting location: $e";
    }
  }

  TextEditingController latController2 = TextEditingController();
  TextEditingController lonController2 = TextEditingController();
  double distance = 0.0;

  void calculateDistance() {
    double startLatitude = 12.9716;
    double startLongitude = 77.5946;
    double endLatitude = 13.0827;
    double endLongitude = 80.2707;

    double distanceInMeters = Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);

    print("Distance: ${(distanceInMeters / 1000).toStringAsFixed(2)} km");
    // double lat1 = double.tryParse(LatitudeController.text) ?? 0.0;
    // double lon1 = double.tryParse(LongitudeController.text) ?? 0.0;
    // double lat2 = double.tryParse(latController2.text) ?? 0.0;
    // double lon2 = double.tryParse(lonController2.text) ?? 0.0;
    //
    // // Check if both locations are the same
    // if (lat1 == lat2 && lon1 == lon2) {
    //   setState(() {
    //     distance = 0.0; // Same location, distance should be 0
    //   });
    //   return;
    // }
    //
    // // Calculate the distance between two locations
    // double calculatedDistance =
    //     Geolocator.distanceBetween(lat1, lon1, lat2, lon2);

    distance = distanceInMeters; // Distance in meters
  }
}
