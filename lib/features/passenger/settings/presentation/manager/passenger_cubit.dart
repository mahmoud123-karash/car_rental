import 'package:car_rental/features/passenger/settings/domain/repo/settings_repo.dart';
import 'package:car_rental/features/passenger/settings/presentation/manager/passenger_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassengerCubit extends Cubit<PassengerStates> {
  PassengerCubit(this.settingsRepo) : super(InitialPassengerState());
  static PassengerCubit get(context) => BlocProvider.of(context);

  final SettingsRepo settingsRepo;

  void getData() async {
    emit(LoadingGetPassengerDataState());
    var result = await settingsRepo.getPassenger();
    result.fold((error) {
      emit(ErrorGetPassengerDataState(error));
    }, (passenger) {
      emit(SuccessGetPassengerDataState(passenger));
    });
  }
}
