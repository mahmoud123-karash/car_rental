class DriverModel {
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? userType;
  bool? profileCompleted;
  bool? carCompleted;

  DriverModel({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.userType,
    this.carCompleted,
    this.profileCompleted,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        uid: json['uid'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        userType: json['userType'] ?? '',
        carCompleted: json['carCompleted'] ?? false,
        profileCompleted: json['profileCompleted'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'phone': phone,
        'userType': userType,
        'carCompleted': carCompleted,
        'profileCompleted': profileCompleted,
      };
}
