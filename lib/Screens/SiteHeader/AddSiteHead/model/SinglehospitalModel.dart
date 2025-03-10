class SiteheadModel {
  int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String field;
  String fieldSiteName;
  String password;
  String confirmPassword;
  String? image;

  SiteheadModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.field,
    required this.fieldSiteName,
    required this.password,
    required this.confirmPassword,
    required this.image,

  });

  factory SiteheadModel.fromMap(Map<String, dynamic> json) =>
      SiteheadModel(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        mobileNumber: json["MobileNumber"],
        field: json["Field"],
        fieldSiteName: json["FieldSiteName"],
        password: json["Password"],
        confirmPassword: json["ConfirmPassword"],
        image: json["Image"],
      );

  Map<String, dynamic> toMap() =>
      {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "MobileNumber": mobileNumber,
        "Field": field,
        "FieldSiteName": fieldSiteName,
        "Password": password,
        "ConfirmPassword": confirmPassword,
        "Image": image,
      };
}
