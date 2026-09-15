import 'package:car_rental/features/auth/data/models/driver_model.dart';
import 'package:car_rental/features/auth/domain/repo/register_repo.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {
  Future<Either<String, String>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  });
}

class DriverRegisterUseCase extends UseCase {
  final RegisterRepo registerRepo;

  DriverRegisterUseCase(this.registerRepo);
  @override
  Future<Either<String, String>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      String uid = await registerRepo.signUp(
        email: email,
        password: password,
      );

      DriverModel driver = DriverModel(
        email: email,
        name: name,
        phone: phone,
        uid: uid,
        userType: 'Driver',
        carCompleted: false,
        profileCompleted: false,
      );
      registerRepo.addUserToCloud(
        uid: uid,
        collection: 'Drivers',
        data: driver.toJson(),
      );
      return right(uid);
    } catch (e) {
      return left(e.toString());
    }
  }
}
