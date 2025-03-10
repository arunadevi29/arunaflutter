class WorkTypeModeldata {
  final int id;
  final String workType;

  WorkTypeModeldata({required this.id, required this.workType});

  factory WorkTypeModeldata.fromJson(Map<String, dynamic> json) {
    return WorkTypeModeldata(
      id: json["Id"] ?? 0,
      workType: json["WorkType"] ?? "No Work Type",
    );
  }
}
