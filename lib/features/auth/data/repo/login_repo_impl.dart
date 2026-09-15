import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/auth/data/data_sources/remote_data_source/login_remote_data_source.dart';
import 'package:car_rental/features/auth/data/models/driver_model.dart';
import 'package:car_rental/features/auth/data/models/passenger_model.dart';
import 'package:car_rental/features/auth/domain/repo/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl(this.loginRemoteDataSource);
  @override
  Future<Either<String, String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userTpe = CacheHelper.getData(key: 'usertype');
      if (userTpe == 'driver') {
        List<DriverModel> drivers = await loginRemoteDataSource.getDrivers();
        bool contain = drivers.any((element) => element.uid == user.user!.uid);
        if (contain) {
          return right(user.user!.uid);
        } else {
          return left('There is no driver with this email');
        }
      } else {
        List<PassengerModel> passengers =
            await loginRemoteDataSource.getPassengers();
        bool contain =
            passengers.any((element) => element.uid == user.user!.uid);
        if (contain) {
          return right(user.user!.uid);
        } else {
          return left('There is no passenger with this email');
        }
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
