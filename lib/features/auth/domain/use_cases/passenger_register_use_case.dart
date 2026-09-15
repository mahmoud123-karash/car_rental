import 'package:car_rental/features/auth/data/models/passenger_model.dart';
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

class PassengerRegisterUseCase extends UseCase {
  final RegisterRepo registerRepo;

  PassengerRegisterUseCase(this.registerRepo);
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

      PassengerModel passenger = PassengerModel(
        email: email,
        name: name,
        phone: phone,
        uid: uid,
        userType: 'Passenger',
      );
      registerRepo.addUserToCloud(
        uid: uid,
        collection: 'Passengers',
        data: passenger.toJson(),
      );
      return right(uid);
    } catch (e) {
      return left(e.toString());
    }
  }
}
