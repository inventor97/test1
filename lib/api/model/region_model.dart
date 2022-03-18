
import 'package:hive/hive.dart';

part 'region_model.g.dart';
@HiveType(typeId: 1)
class RegionModel extends HiveObject {
  RegionModel({
    required this.id,
    required this.title,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
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