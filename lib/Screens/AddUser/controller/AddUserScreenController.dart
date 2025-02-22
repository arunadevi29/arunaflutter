import 'package:get/get.dart';

class AddUserScreenController extends GetxController {
  String? selectedOption;

  // Options for the dropdown
  final List<String> options = [
    'Site Head',
    'Report Manager',
    'Add Contractor',
    'Site Worker'
  ];
}
