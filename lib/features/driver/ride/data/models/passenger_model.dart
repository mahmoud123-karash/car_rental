class PassengerModel {
  final String name;
  final String phone;
  final String image;

  PassengerModel({
    required this.name,
    required this.phone,
    required this.image,
  });

  factory PassengerModel.fromJson(Map<String, dynamic> json) => PassengerModel(
        name: json['name'] ?? "",
        phone: json['phone'] ?? "",
        image: json['image'] ?? "",
      );
}
