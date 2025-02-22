class User {
  final int id;
  final String firstName;
  final String lastName;
  final String mobileNumber;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['Id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      mobileNumber: json['MobileNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'FirstName': firstName,
      'LastName': lastName,
      'MobileNumber': mobileNumber,
    };
  }
}
