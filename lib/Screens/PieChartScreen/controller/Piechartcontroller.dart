import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PiechartController extends GetxController {
  TextEditingController dateFromtocontroller = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // Minimum selectable date
      lastDate: DateTime(2100), // Maximum selectable date
    );

    if (pickedDate != null) {
      controller.text =
          "${pickedDate.toLocal()}".split(' ')[0]; // Format the date
    }
  }

// DateTime? FromDate;
// DateTime? ToDate;
//
// Future<void> SelectFromDate(BuildContext context) async {
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: FromDate ?? DateTime.now(),
//     firstDate: DateTime(2000),
//     lastDate: DateTime(2101),
//   );
//
//   if (picked != null && picked != FromDate) {
//     FromDate = picked;
//   }
// }
//
// Future<void> SelectToDate(BuildContext context) async {
//   if (FromDate == null) {
//     // Show an error if "From Date" is not selected yet.
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Please select a "From Date" first.')),
//     );
//     return;
//   }
//
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: ToDate ?? FromDate!, // Default to "From Date" if not set
//     firstDate: FromDate!, // "To Date" should be after "From Date"
//     lastDate: DateTime(2101),
//   );
//
//   if (picked != null && picked != ToDate) {
//     ToDate = picked;
//   }
// }
}
