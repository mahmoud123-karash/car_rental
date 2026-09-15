import 'package:car_rental/features/driver/edit_profile/domain/use_cases/update_use_case.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/manager/update_cubit/update_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../settings/domain/entities/driver_entity.dart';

class UpdateCubit extends Cubit<UpdateStates> {
  UpdateCubit(this.updateUseCase) : super(InitialUpdateState());
  static UpdateCubit get(context) => BlocProvider.of(context);

  final UpdateUseCase updateUseCase;

  void updateProfile({
    required String name,
    required String birth,
    required String gender,
    required String job,
    required String phone,
    required String image,
  }) async {
    emit(LoadingUpdateState());
    String message = await updateUseCase.update(
      name: name,
      birth: birth,
      gender: gender,
      job: job,
      phone: phone,
      image: image,
    );
    if (message == 'updated') {
      var box = Hive.box<DriverEntity>(driverBox);
      box.clear();
      emit(SuccessUpdateState());
    } else {
      emit(ErrorUpdateState(message));
    }
  }
}
