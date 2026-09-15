import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<String, String>> signIn({
    required String email,
    required String password,
  });
}
