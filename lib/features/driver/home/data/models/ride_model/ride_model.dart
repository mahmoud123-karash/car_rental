import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';

class RideModel {
  final List<RequestModel> completedRides;
  final List<RequestModel> todayRides;

  RideModel({
    required this.completedRides,
    required this.todayRides,
  });
}
