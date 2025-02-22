import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class SiteheadModeldata {
//   int id;
//   String firstName;
//   String lastName;
//   String mobileNumber;
//   String field;
//   String fieldSiteName;
//   String password;
//   String confirmPassword;
//   String? image;
//
//   SiteheadModeldata({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.mobileNumber,
//     required this.field,
//     required this.fieldSiteName,
//     required this.password,
//     required this.confirmPassword,
//     required this.image,
//   });
//
//   factory SiteheadModeldata.fromMap(Map<String, dynamic> json) =>
//       SiteheadModeldata(
//         id: json["Id"],
//         firstName: json["FirstName"],
//         lastName: json["LastName"],
//         mobileNumber: json["MobileNumber"],
//         field: json["Field"],
//         fieldSiteName: json["FieldSiteName"],
//         password: json["Password"],
//         confirmPassword: json["ConfirmPassword"],
//         image: json["Image"],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "Id": id,
//         "FirstName": firstName,
//         "LastName": lastName,
//         "MobileNumber": mobileNumber,
//         "Field": field,
//         "FieldSiteName": fieldSiteName,
//         "Password": password,
//         "ConfirmPassword": confirmPassword,
//         "Image": image,
//       };
// }

Hospital SiteheadModelListData(String str) =>
    Hospital.fromJson(json.decode(str));

class Hospital {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? mobileNumber;
  final String? field;
  final String? fieldSiteName;
  final String? password;
  final String? confirmPassword;
  final String? image;

  Hospital(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.field,
      this.fieldSiteName,
      this.password,
      this.confirmPassword,
      this.image});

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json["Id"],
      firstName: json["FirstName"],
      lastName: json["LastName"],
      mobileNumber: json["MobileNumber"],
      field: json["Field"],
      fieldSiteName: json["FieldSiteName"],
      password: json["Password"],
      confirmPassword: json["ConfirmPassword"],
      image: json["Image"], // Handles null automatically
    );

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['Id'] = this.id;
//   data['FirstName'] = this.firstName;
//   data['LastName'] = this.lastName;
//   data['MobileNumber'] = this.mobileNumber;
//   data['Field'] = this.field;
//   data['FieldSiteName'] = this.fieldSiteName;
//   data['Password'] = this.password;
//   data['ConfirmPassword'] = this.confirmPassword;
//   data['Image'] = this.image;
//   return data;
  }

// class Siteheadmodeldata {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String mobileNumber;
//   final String field;
//   final String fieldSiteName;
//   final String password;
//   final String confirmPassword;
//   final String? image;
//
//   Siteheadmodeldata({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.mobileNumber,
//     required this.field,
//     required this.fieldSiteName,
//     required this.password,
//     required this.confirmPassword,
//     this.image,
//   });
//
//   // Convert JSON to Dart Model
//   factory Siteheadmodeldata.fromJson(Map<String, dynamic> json) {
//     return Siteheadmodeldata(
//       id: json["Id"],
//       firstName: json["FirstName"],
//       lastName: json["LastName"],
//       mobileNumber: json["MobileNumber"],
//       field: json["Field"],
//       fieldSiteName: json["FieldSiteName"],
//       password: json["Password"],
//       confirmPassword: json["ConfirmPassword"],
//       image: json["Image"], // Handles null automatically
//     );
//   }
// }
}
