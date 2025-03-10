// // class FacilityModelData {
// //   List<Field>? field;
// //
// //   FacilityModelData({this.field});
// //
// //   FacilityModelData.fromJson(Map<String, dynamic> json) {
// //     if (json['Field'] != null) {
// //       field = <Field>[];
// //       json['Field'].forEach((v) {
// //         field!.add(Field.fromJson(v));
// //       });
// //     }
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     if (this.field != null) {
// //       data['Field'] = this.field!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Field {
// //   int? id;
// //   String? fieldName;
// //   String? fieldImage;
// //
// //   Field({this.id, this.fieldName, this.fieldImage});
// //
// //   Field.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     fieldName = json['FieldName'];
// //     fieldImage = json['FieldImage'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['id'] = this.id;
// //     data['FieldName'] = this.fieldName;
// //     data['FieldImage'] = this.fieldImage;
// //     return data;
// //   }
// // }
// class FacilityModel {
//   final int id;
//   final String fieldName;
//   final String fieldImage;
//
//   FacilityModel({
//     required this.id,
//     required this.fieldName,
//     required this.fieldImage,
//   });
//
//   factory FacilityModel.fromJson(Map<String, dynamic> json) {
//     return FacilityModel(
//       id: int.tryParse(json['id'].toString()) ?? 0, // Converts "1" to 1
//       fieldName: json['fieldName'] ?? '',
//       fieldImage: json['fieldImage'] ?? '',
//     );
//   }
// }
class FacilityModels {
  final int id;
  final String fieldName;
  final String fieldImage;
  final int entryCount;

  FacilityModels({
    required this.id,
    required this.fieldName,
    required this.fieldImage,
    required this.entryCount,
  });

  // Factory constructor to convert JSON to FacilityModel
  factory FacilityModels.fromJson(Map<String, dynamic> json) {
    return FacilityModels(
      id: json['id'],
      fieldName: json['FieldName'],
      fieldImage: json['FieldImage'],
      entryCount: json['EntryCount'],
    );
  }
}
