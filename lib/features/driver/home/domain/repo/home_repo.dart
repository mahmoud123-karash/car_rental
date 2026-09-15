import 'package:car_rental/features/driver/home/data/models/complete_model/complete_model.dart';
import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

abstract class HomeRepo {
  Future<Either<String, CompelteModel>> getData();
  Stream<LocationData> getMylocation();
  void updateLocation({
    required double lat,
    required double lng,
    required double heading,
  });

  Future<Either<String, List<RequestModel>>> getRequest();
  Future<Either<String, List<RequestModel>>> getRides();

  Future<Either<String, List<RequestModel>>> cancelRequest({
    required String uid,
  });
  Future<Either<String, RequestModel>> confirmRequest({
    required String uid,
    required String driverUid,
  });
}
