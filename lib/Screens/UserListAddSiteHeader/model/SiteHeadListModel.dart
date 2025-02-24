// // To parse this JSON data, do
// //
// //     final siteheadModel = siteheadModelFromMap(jsonString);
//
// import 'dart:convert';
//
// import 'dart:convert';
// import 'package:get/get.dart';
//
// List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
//
// String productToJson(List<Product> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Product {
//   Product({
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
//   int id;
//
//   String firstName;
//   String lastName;
//   String mobileNumber;
//   String field;
//   String fieldSiteName;
//   String password;
//   String confirmPassword;
//   String image;
//
//   var isFavorite = false.obs;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         mobileNumber: json["mobileNumber"],
//         field: json["field"],
//         fieldSiteName: json["fieldSiteName"],
//         password: json["password"],
//         confirmPassword: json["confirmPassword"],
//         image: json["image"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "firstName": firstName,
//         "lastName": lastName,
//         "mobileNumber": mobileNumber,
//         "field": field,
//         "fieldSiteName": fieldSiteName,
//         "password": password,
//         "confirmPassword": confirmPassword,
//         "image": image,
//       };
// }
