import 'dart:convert';
import 'dart:convert';

ShiftTimeModel ShiftTimeListData(String str) =>
    ShiftTimeModel.fromJson(json.decode(str));

class ShiftTimeModel {
  bool? success;
  List<Data>? data;

  ShiftTimeModel({this.success, this.data});

  ShiftTimeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late final int? id;
  late final workType;
  late final shiftName;
  late final shiftFrom;
  late final shiftTo;

  Data({
    this.id,
    this.workType,
    this.shiftName,
    this.shiftFrom,
    this.shiftTo,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    workType = json['WorkType'];
    shiftName = json['ShiftName'];
    shiftFrom = json['ShiftFrom'];
    shiftTo = json['ShiftTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['WorkType'] = this.workType;
    data['ShiftName'] = this.shiftName;
    data['ShiftFrom'] = this.shiftFrom;
    data['ShiftTo'] = this.shiftTo;
    return data;
  }
}

// class ShiftTimeModel {
//   final List<HouseKeeping> houseKeeping;
//   final List<HouseKeeping> security;
//
//   ShiftTimeModel({
//     required this.houseKeeping,
//     required this.security,
//   });
//
//   ShiftTimeModel copyWith({
//     List<HouseKeeping>? houseKeeping,
//     List<HouseKeeping>? security,
//   }) =>
//       ShiftTimeModel(
//         houseKeeping: houseKeeping ?? this.houseKeeping,
//         security: security ?? this.security,
//       );
// }
//
// class HouseKeeping {
//   final int id;
//   final WorkType workType;
//   final ShiftName shiftName;
//   final DateTime shiftFrom;
//   final DateTime shiftTo;
//
//   HouseKeeping({
//     required this.id,
//     required this.workType,
//     required this.shiftName,
//     required this.shiftFrom,
//     required this.shiftTo,
//   });
//
//   HouseKeeping copyWith({
//     int? id,
//     WorkType? workType,
//     ShiftName? shiftName,
//     DateTime? shiftFrom,
//     DateTime? shiftTo,
//   }) =>
//       HouseKeeping(
//         id: id ?? this.id,
//         workType: workType ?? this.workType,
//         shiftName: shiftName ?? this.shiftName,
//         shiftFrom: shiftFrom ?? this.shiftFrom,
//         shiftTo: shiftTo ?? this.shiftTo,
//       );
// }
//
// enum ShiftName { MORNING_SHIFT }
//
// enum WorkType { HOUSE_KEEPING, SECURITY }
