// class HouseKeeping {
//   int? id;
//   String? workType;
//   String? shiftName;
//   String? shiftFrom;
//   String? shiftTo;
//
//   HouseKeeping(
//       {required this.id,
//       required this.workType,
//       required this.shiftName,
//       required this.shiftFrom,
//       required this.shiftTo});
//
//   factory HouseKeeping.fromMap(Map<String, dynamic> json) => HouseKeeping(
//         id: json["Id"],
//         workType: json["workType"],
//         shiftName: json["shiftName"],
//         shiftFrom: json["shiftFrom"],
//         shiftTo: json["shiftTo"],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "Id": id,
//         "workType": workType,
//         "shiftName": shiftName,
//         "shiftFrom": shiftFrom,
//         "shiftTo": shiftTo,
//       };
// }
class HouseKeeping {
  int? id;
  String? workType;
  String? shiftName;
  String? shiftFrom;
  String? shiftTo;

  HouseKeeping(
      {this.id, this.workType, this.shiftName, this.shiftFrom, this.shiftTo});

  HouseKeeping.fromJson(Map<String, dynamic> json) {
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
