import 'package:car_rental/features/driver/settings/domain/repo/profile_repo.dart';
import 'package:car_rental/features/driver/settings/presentation/manager/settings_cubit/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit(this.settingsRepo) : super(InitialSettingsState());
  static SettingsCubit get(context) => BlocProvider.of(context);

  final SettingsRepo settingsRepo;

  void getDriverData() async {
    emit(LoadingGetProfileDataState());
    var result = await settingsRepo.getDriverData();
    result.fold(
      (message) {
        emit(ErrorGetProfileDataState(message));
      },
      (driver) {
        emit(SuccessGetProfileDataState(driver));
      },
    );
  }
}
