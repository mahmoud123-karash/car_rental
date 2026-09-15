class DriverModel {
  final double lat;
  final double lng;
  final String name;
  final String phone;
  final String image;
  final List<double>? rating;

  DriverModel({
    required this.lat,
    required this.lng,
    required this.name,
    required this.phone,
    required this.image,
    required this.rating,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        lat: json['lat'] ?? 0.0,
        lng: json['lng'] ?? 0.0,
        name: json['name'] ?? '',
        phone: json['phone'] ?? '',
        image: json['image'] ?? '',
        rating: (json['rating'] as List<dynamic>?)
            ?.map<double>((value) => value as double)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
        'name': name,
        'phone': phone,
        'image': image,
        'rating': rating,
      };
}
