class Fieldstatemodeldata {
  final int id;
  final int fieldId;
  final String fieldName;
  final double latitude;
  final double longitude;
  final double proximity;
  final String headName;
  final String mobileNumber;
  final String fieldImage;

  Fieldstatemodeldata({
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
  factory Fieldstatemodeldata.fromJson(Map<String, dynamic> json) {
    return Fieldstatemodeldata(
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
