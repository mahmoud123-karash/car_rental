import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/features/passenger/find_driver/data/data_sources/remote_data_source/travel_info_remote_data_source.dart';
import 'package:car_rental/features/passenger/find_driver/domain/entities/travel_entity.dart';
import 'package:car_rental/features/passenger/find_driver/domain/repo/travel_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelRepoImpl extends TravelRepo {
  final TravelInfoRemoteDataSource travelInfoRemoteDataSource;

  TravelRepoImpl(this.travelInfoRemoteDataSource);

  @override
  Future<Either<Failure, TravelEntity>> getTravelInfo({
    required LatLng source,
    required LatLng destination,
  }) async {
    try {
      TravelEntity model = await travelInfoRemoteDataSource.get(
          source: source, destination: destination);
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
