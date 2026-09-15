class PassengerModel {
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? userType;

  PassengerModel({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.userType,
  });

  factory PassengerModel.fromJson(Map<String, dynamic> json) {
    return PassengerModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      userType: json['userType'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'phone': phone,
        'userType': userType,
      };
}
