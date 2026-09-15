import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/auth/domain/use_cases/driver_register_use_case.dart';
import 'package:car_rental/features/auth/domain/use_cases/passenger_register_use_case.dart';
import 'package:car_rental/features/auth/presentation/manager/register_cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(
    this.driverRegisterUseCase,
    this.passengerRegisterUseCase,
  ) : super(InitialRegistertate());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final DriverRegisterUseCase driverRegisterUseCase;
  final PassengerRegisterUseCase passengerRegisterUseCase;

  void registerDriver({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(LoadingRegistertate());
    String userType = CacheHelper.getData(key: 'usertype');
    if (userType == 'driver') {
      var result = await driverRegisterUseCase.register(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );
      result.fold((error) {
        emit(ErrorRegistertate(error));
      }, (uid) {
        emit(SuccessRegistertate());
      });
    } else {
      var result = await passengerRegisterUseCase.register(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );
      result.fold((error) {
        emit(ErrorRegistertate(error));
      }, (uid) {
        emit(SuccessRegistertate());
      });
    }
  }
}
