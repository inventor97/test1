class RegionModel {
  RegionModel({
    required this.id,
    required this.title,
  });

  int id;
  String title;


  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}