import 'package:car_rental/features/driver/car/domain/repo/car_repo.dart';
import 'package:car_rental/features/driver/car/presentation/manager/car_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../core/constants/constants.dart';
import '../../../settings/domain/entities/driver_entity.dart';

class CarCubit extends Cubit<CarStates> {
  CarCubit(this.carRepo) : super(InitialCarState());
  static CarCubit get(context) => BlocProvider.of(context);
  final CarRepo carRepo;

  void update({
    required String brand,
    required int color,
    required String carModel,
    required int year,
  }) async {
    emit(LoadingUpdteCarDataState());
    String message = await carRepo.updateCar(
      brand: brand,
      color: color,
      carModel: carModel,
      year: year,
    );
    if (message == 'updated') {
      var box = Hive.box<DriverEntity>(driverBox);
      box.clear();
      emit(SuccessUpdteCarDataState());
    } else {
      emit(ErrorUpdteCarDataCarState(message));
    }
  }
}
