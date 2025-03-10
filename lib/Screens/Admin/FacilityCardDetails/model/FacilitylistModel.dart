import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../../demo.dart';

// facility_data_model FacilityListData(String dynamic) =>
//     facility_data_model.fromJson(json.decode(dynamic));
//
// class facility_data_model {
//   int id;
//   String fieldName;
//   String fieldImage;
//   int count;
//
//   facility_data_model({
//     required this.id,
//     required this.fieldName,
//     required this.fieldImage,
//     required this.count,
//   });
//
//   // Convert JSON to Dart Model
//   factory facility_data_model.fromJson(Map<String, dynamic> json) {
//     return facility_data_model(
//         id: json["id"],
//         fieldName: json["fieldName"],
//         fieldImage: json["fieldImage"],
//         count: json["count"]);
//   }
// }

// class Facilitymodel {
//   int? id;
//   String? fieldName;
//   String? fieldImage;
//   int? count;
//
//   Facilitymodel({
//     required TextEditingController controller,
//     required this.fieldImage,
//     this.count = 0,
//   }) : fieldName = controller.text; // ✅ Assign in the initializer list
//
//   //Facilitymodel({this.id, this.fieldName, this.fieldImage, this.count});
//
//   Facilitymodel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fieldName = json['FieldName'];
//     fieldImage = json['FieldImage'];
//     count = json['Count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['FieldName'] = this.fieldName;
//     data['FieldImage'] = this.fieldImage;
//     data['Count'] = this.count;
//     return data;
//   }
// }

// class FacilityModel {
//   final int id;
//   final String fieldName;
//   final String fieldImage;
//   final int count;
//
//   FacilityModel({
//     required this.id,
//     required this.fieldName,
//     required this.fieldImage,
//     required this.count,
//   });
//
//   factory FacilityModel.fromJson(Map<String, dynamic> json) {
//     return FacilityModel(
//       id: json['id'],
//       fieldName: json['FieldName'],
//       fieldImage: json['FieldImage'],
//       count: json['Count'],
//     );
//   }
// }
// class FacilityModeldata {
//   final int id;
//   final String fieldName;
//   final String fieldImage;
//   final int ?entryCount;
//
//   FacilityModeldata({
//     required this.id,
//     required this.fieldName,
//     required this.fieldImage,
//     this.entryCount = 0,
//   });
//
//   factory FacilityModeldata.fromJson(Map<String, dynamic> json) {
//     return FacilityModeldata(
//       id: json['id'] ?? 0,
//       fieldName: json['FieldName'] ?? "Unknown",
//       fieldImage: json['FieldImage'] ?? "default.png",
//       entryCount: json['entryCount'] ?? 0,
//     );
//   }
// }
class FacilityModeldata {
  int? id;
  String? fieldName;
  String? fieldImage;
  int? entryCount;

  FacilityModeldata(
      {this.id, this.fieldName, this.fieldImage, this.entryCount});

  FacilityModeldata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fieldName = json['FieldName'];
    fieldImage = json['FieldImage'];
    entryCount = json['EntryCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['FieldName'] = this.fieldName;
    data['FieldImage'] = this.fieldImage;
    data['EntryCount'] = this.entryCount;
    return data;
  }
}