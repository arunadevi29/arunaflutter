// class ReportManagers {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? mobileNumber;
//   String? password;
//   String? confirmPassword;
//   String? image;
//
//   ReportManagers(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.mobileNumber,
//       this.password,
//       this.confirmPassword,
//       this.image});
//
//   ReportManagers.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     firstName = json['FirstName'];
//     lastName = json['LastName'];
//     mobileNumber = json['MobileNumber'];
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
//     data['Password'] = this.password;
//     data['ConfirmPassword'] = this.confirmPassword;
//     data['Image'] = this.image;
//     return data;
//   }
// }
class ReportManagers {
  int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String password;
  String confirmPassword;
  String? image;

  ReportManagers({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.password,
    required this.confirmPassword,
    required this.image,
  });

  factory ReportManagers.fromMap(Map<String, dynamic> json) => ReportManagers(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        mobileNumber: json["MobileNumber"],
        password: json["Password"],
        confirmPassword: json["ConfirmPassword"],
        image: json["Image"],
      );

  Map<String, dynamic> toMap() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "MobileNumber": mobileNumber,
        "Password": password,
        "ConfirmPassword": confirmPassword,
        "Image": image,
      };
}
