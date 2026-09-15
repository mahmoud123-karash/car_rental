class RatingModel {
  final List<double>? rating;

  RatingModel({required this.rating});

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rating: (json['rating'] as List<dynamic>?)
            ?.map<double>((value) => value as double)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
      };
}
