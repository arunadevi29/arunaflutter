import 'package:get/get.dart';

import '../../../../widgets/AppBarSample.dart';

class FacilityCardListviewController extends GetxController {
  List Hospital = [
    "Appolo",
    "East Coast Hospitals",
    "JIPMER Hospital",
    "A.G. Padmavati's Hospital Ltd"
  ];
  final List<Map<String, dynamic>> FirstList = [
    {
      "image": "assets/images/first.png",
      "name": "Hospital",
      "des": "3 Hospital",
    },
    {
      "image": "assets/images/second.png",
      "name": "Autdiotorium",
      "des": "3 Autdiotorium",
    },
    {
      "image": "assets/images/third.png",
      "name": "College",
      "des": "3 College",
    },
  ];
  List NewFieldsList = [];
  int index = 0;

  bool isSwitched = false;
}
