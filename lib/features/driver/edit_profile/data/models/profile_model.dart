class ProfileModel {
  String? image;
  String? name;
  String? phone;
  String? job;
  String? birth;
  String? gender;
  bool? profileCompleted;

  ProfileModel({
    this.gender,
    this.name,
    this.birth,
    this.phone,
    this.job,
    this.image,
    this.profileCompleted,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        gender: json['gender'] ?? '',
        name: json['name'] ?? '',
        birth: json['birth'] ?? '',
        phone: json['phone'] ?? '',
        job: json['job'] ?? '',
        image: json['image'] ?? false,
        profileCompleted: json['profileCompleted'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'name': name,
        'birth': birth,
        'phone': phone,
        'job': job,
        'image': image,
        'profileCompleted': profileCompleted,
      };
}
