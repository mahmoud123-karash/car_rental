import 'package:car_rental/features/passenger/ride/data/models/manage_model/manage_model.dart';
import 'package:dartz/dartz.dart';

abstract class ManageRepo {
  Future<Either<String, ManageModel>> get({required String uid});
}
