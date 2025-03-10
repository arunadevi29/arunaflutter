class Contractorsmodel {
  int id;
  String firstName;
  String lastName;
  String mobileNumber;

  String password;
  String confirmPassword;
  String? image;

  Contractorsmodel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.password,
    required this.confirmPassword,
    required this.image,
  });

  factory Contractorsmodel.fromMap(Map<String, dynamic> json) =>
      Contractorsmodel(
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
