class FavoriteModel {
  final String? name;
  final double? lat;
  final double? lng;
  final String? uid;
  final String? type;

  FavoriteModel({
    required this.name,
    required this.lat,
    required this.lng,
    required this.uid,
    required this.type,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        lat: json['lat'] ?? 0,
        uid: json['uid'] ?? '',
        lng: json['lng'] ?? 0,
        name: json['name'] ?? '',
        type: json['type'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'uid': uid,
        'lng': lng,
        'name': name,
        'type': type,
      };
}
