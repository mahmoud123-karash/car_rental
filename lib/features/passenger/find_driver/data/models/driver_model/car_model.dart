class CarModel {
  String? type;
  String? brand;
  int? color;
  String? engineType;
  String? model;
  int? year;
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
