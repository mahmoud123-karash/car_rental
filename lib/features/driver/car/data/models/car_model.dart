class CarModel {
  String? brand;
  int? color;
  String? model;
  int? year;

  CarModel({
    this.brand,
    this.color,
    this.model,
    this.year,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        brand: json['brand'] ?? '',
        color: json['color'] ?? 0,
        model: json['model'] ?? '',
        year: json['year'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'brand': brand,
        'year': year,
        'model': model,
        'color': color,
      };
}
