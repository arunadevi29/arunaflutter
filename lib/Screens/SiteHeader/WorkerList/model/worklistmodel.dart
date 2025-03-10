// class User {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String mobileNumber;
//
//   User({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.mobileNumber,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['Id'],
//       firstName: json['FirstName'],
//       lastName: json['LastName'],
//       mobileNumber: json['MobileNumber'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'Id': id,
//       'FirstName': firstName,
//       'LastName': lastName,
//       'MobileNumber': mobileNumber,
//     };
//   }
// }
class Worklistmodel {
  int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String work;
  String workType;
  String? image;

  Worklistmodel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.work,
    required this.workType,
    required this.image,
  });

  factory Worklistmodel.fromJson(Map<String, dynamic> json) {
    return Worklistmodel(
      id: json['Id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      mobileNumber: json['MobileNumber'],
      work: json['Work'],
      workType: json['WorkType'],
      image: json['Image'],
    );
  }
}
