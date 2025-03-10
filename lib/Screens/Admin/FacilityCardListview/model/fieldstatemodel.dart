// class Fieldstatemodel {
//   int iD;
//   String fieldName;
//   double latitude;
//   double longitude;
//   double proximity;
//   String headName;
//   String mobileNumber;
//   String? fieldImage;
//
//   Fieldstatemodel(
//       {required this.iD,
//       required this.fieldName,
//       required this.latitude,
//       required this.longitude,
//       required this.proximity,
//       required this.headName,
//       required this.mobileNumber,
//       required this.fieldImage});
//
//   Fieldstatemodel.fromJson(Map<String, dynamic> json) {
//     iD:
//     json['ID'];
//     fieldName = json['FieldName'];
//     latitude = json['Latitude'];
//     longitude = json['Longitude'];
//     proximity = json['Proximity'];
//     headName = json['HeadName'];
//     mobileNumber = json['MobileNumber'];
//     fieldImage = json['FieldImage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['FieldName'] = this.fieldName;
//     data['Latitude'] = this.latitude;
//     data['Longitude'] = this.longitude;
//     data['Proximity'] = this.proximity;
//     data['HeadName'] = this.headName;
//     data['MobileNumber'] = this.mobileNumber;
//     data['FieldImage'] = this.fieldImage;
//     return data;
//   }
// }

// class Fieldstatemodel {
//   final int id;
//   final String fieldName;
//   final double latitude;
//   final double longitude;
//   final double proximity;
//   final String headName;
//   final String mobileNumber;
//   final String? fieldImage;
//
//   Fieldstatemodel({
//     required this.id,
//     required this.fieldName,
//     required this.fieldImage,
//     required this.latitude,
//     required this.longitude,
//     required this.proximity,
//     required this.headName,
//     required this.mobileNumber,
//   });
//
//   factory Fieldstatemodel.fromJson(Map<String, dynamic> json) {
//     return Fieldstatemodel(
//       id: json["ID"],
//       fieldName: json["FieldName"] ?? "",
//       latitude: json["Latitude"].toDouble(),
//       longitude: json["Longitude"].toDouble(),
//       proximity: json["Proximity"].toDouble(),
//       headName: json["HeadName"] ?? "",
//       mobileNumber: json["MobileNumber"],
//       fieldImage: json["FieldImage"],
//     );
//   }
// }
class Fieldstatemodel {
  final int id;
  final int? fieldId;
  final String fieldName;
  final double latitude;
  final double longitude;
  final double proximity;
  final String headName;
  final String mobileNumber;
  final String fieldImage;

  Fieldstatemodel({
    required this.id,
    required this.fieldId,
    required this.fieldName,
    required this.latitude,
    required this.longitude,
    required this.proximity,
    required this.headName,
    required this.mobileNumber,
    required this.fieldImage,
  });

  // Convert JSON to FacilityModel
  factory Fieldstatemodel.fromJson(Map<String, dynamic> json) {
    return Fieldstatemodel(
      id: json['ID'],
      fieldId: json['FieldID'],
      fieldName: json['FieldName'],
      latitude: json['Latitude'].toDouble(),
      longitude: json['Longitude'].toDouble(),
      proximity: json['Proximity'].toDouble(),
      headName: json['HeadName'],
      mobileNumber: json['MobileNumber'],
      fieldImage: json['FieldImage'],
    );
  }
}
