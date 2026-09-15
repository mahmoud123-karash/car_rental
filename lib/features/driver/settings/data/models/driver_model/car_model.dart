import 'package:hive/hive.dart';
part 'car_model.g.dart';

@HiveType(typeId: 1)
class CarModel {
  @HiveField(0)
  String? type;
  @HiveField(1)
  String? brand;
  @HiveField(2)
  int? color;
  @HiveField(3)
  String? engineType;
  @HiveField(4)
  String? model;
  @HiveField(5)
  int? year;
  @HiveField(6)
  int? cc;

  CarModel({
    this.type,
    this.brand,
    this.cc,
    this.color,
    this.engineType,
    this.model,
    this.year,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        type: json['type'] ?? '',
        brand: json['brand'] ?? '',
        cc: json['cc'] ?? 0,
        engineType: json['engineType'] ?? '',
        color: json['color'] ?? 0,
        model: json['model'] ?? '',
        year: json['year'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'brand': brand,
        'cc': cc,
        'year': year,
        'model': model,
        'engineType': engineType,
        'color': color,
      };
}
