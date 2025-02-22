import 'dart:convert';

import '../../../../demo.dart';

facility_data_model FacilityListData(String dynamic) =>
    facility_data_model.fromJson(json.decode(dynamic));

class facility_data_model {
  int id;

  String fieldName;
  String fieldImage;
  int count;

  facility_data_model({
    required this.id,
    required this.fieldName,
    required this.fieldImage,
    required this.count,
  });

  // Convert JSON to Dart Model
  factory facility_data_model.fromJson(Map<String, dynamic> json) {
    return facility_data_model(
        id: json["id"],
        fieldName: json["fieldName"],
        fieldImage: json["fieldImage"],
        count: json["count"]);
  }
}
// class FieldItem {
//   int id;
//   String fieldName;
//   String fieldImage;
//   int count;
//
//   FieldItem({
//     required this.id,
//     required this.fieldName,
//     required this.fieldImage,
//     required this.count,
//   });
//
//   // Convert JSON to Dart Model
//   factory FieldItem.fromJson(Map<String, dynamic> json) {
//     return FieldItem(
//       id: json["Id"],
//       fieldName: json["fieldName"],
//       fieldImage: json["fieldImage"],
//       count: json["count"],
//     );
//   }
// }
// class FieldItem {
//   final int id;
//   final String fieldName;
//   final String fieldImage;
//   final int count;
//
//   // Constructor
//   FieldItem({required this.id, required this.fieldName, required this.fieldImage, required this.count});
//
//   // Factory constructor to create FieldItem from JSON
//   factory FieldItem.fromJson(Map<String, dynamic> json) {
//     return FieldItem(
//       id: json['id'],
//       fieldName: json['FieldName'],
//       fieldImage: json['FieldImage'],
//       count: json['Count'],
//     );
//   }
//
//   // Convert FieldItem back to JSON (optional)
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'FieldName': fieldName,
//       'FieldImage': fieldImage,
//       'Count': count,
//     };
//   }
// }
