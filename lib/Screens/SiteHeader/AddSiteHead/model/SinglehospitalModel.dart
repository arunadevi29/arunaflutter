import 'dart:convert';

class SiteheadDetails {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? field;
  String? fieldSiteName;
  String? password;
  String? confirmPassword;
  String? image;

  SiteheadDetails(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.field,
      this.fieldSiteName,
      this.password,
      this.confirmPassword,
      this.image});

  factory SiteheadDetails.fromJson(Map<String, dynamic> json) {
    return SiteheadDetails(
      id: json['id'] ?? 0,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      field: json['field'] ?? '',
      fieldSiteName: json['fieldSiteName'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? field;
  String? fieldSiteName;
  String? password;
  String? confirmPassword;
  String? image;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.field,
      this.fieldSiteName,
      this.password,
      this.confirmPassword,
      this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json['LastName'],
        mobileNumber: json['MobileNumber'],
        field: json['Field'],
        fieldSiteName: json['FieldSiteName'],
        password: json['Password'],
        confirmPassword: json['ConfirmPassword'],
        image: json['Image'].toString());
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => User.fromJson(e)).toList();
  }
}

// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? mobileNumber;
//   String? field;
//   String? fieldSiteName;
//   String? password;
//   String? confirmPassword;
//   String? image;
//
//   User(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.mobileNumber,
//       this.field,
//       this.fieldSiteName,
//       this.password,
//       this.confirmPassword,
//       this.image});
//
//   // Convert JSON Map to User Object
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//         id: json["id"],
//         firstName: json["firstName"],
//         lastName: json['LastName'],
//         mobileNumber: json['MobileNumber'],
//         field: json['Field'],
//         fieldSiteName: json['FieldSiteName'],
//         password: json['Password'],
//         confirmPassword: json['ConfirmPassword'],
//         image: json['Image'].toString());
//   }
//
//   // Convert User Object to JSON Map
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "firstName": firstName,
//       "lastName": lastName,
//       "mobileNumber": mobileNumber,
//       "field": field,
//       "fieldSiteName": fieldSiteName,
//       "password": password,
//       "confirmPassword": confirmPassword,
//       "image": image.toString()
//     };
//   }
// }
//
// class UserResponse {
//   bool? success;
//   List<User>? users;
//
//   UserResponse({this.success, this.users});
//
//   // Convert JSON Map to UserResponse Object
//   UserResponse.fromJson(Map<String, dynamic> json) {
//     var userList = json["users"] as List; // Extract the list from the JSON
//     List<User> usersList = userList.map((user) => User.fromJson(user)).toList();
//
//     success = json['success'];
//     if (json['data'] != null) {
//       users = <User>[];
//       json['data'].forEach((v) {
//         users!.add(new User.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.users != null) {
//       data['data'] = this.users!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class SingleSiteheadmodel {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? mobileNumber;
//   String? field;
//   String? fieldSiteName;
//   String? password;
//   String? confirmPassword;
//   String? image;
//
//   SingleSiteheadmodel(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.mobileNumber,
//       this.field,
//       this.fieldSiteName,
//       this.password,
//       this.confirmPassword,
//       this.image});
//
//   SingleSiteheadmodel.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     firstName = json['FirstName'];
//     lastName = json['LastName'];
//     mobileNumber = json['MobileNumber'];
//     field = json['Field'];
//     fieldSiteName = json['FieldSiteName'];
//     password = json['Password'];
//     confirmPassword = json['ConfirmPassword'];
//     image = json['Image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['FirstName'] = this.firstName;
//     data['LastName'] = this.lastName;
//     data['MobileNumber'] = this.mobileNumber;
//     data['Field'] = this.field;
//     data['FieldSiteName'] = this.fieldSiteName;
//     data['Password'] = this.password;
//     data['ConfirmPassword'] = this.confirmPassword;
//     data['Image'] = this.image;
//     return data;
//   }
// }
