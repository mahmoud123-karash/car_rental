import 'package:car_rental/features/driver/settings/domain/use_cases/logout_use_case.dart';
import 'package:car_rental/features/driver/settings/presentation/manager/logout_cubit/logout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit(this.logoutUseCase) : super(InitialLogoutState());
  static LogoutCubit get(context) => BlocProvider.of(context);
  final LogoutUseCase logoutUseCase;

  void logout() async {
    emit(LoadingLogoutState());
    var result = await logoutUseCase.logout();
    result.fold((error) {
      emit(ErrorLogoutState(error));
    }, (message) {
      emit(SuccessLogoutState());
    });
  }
}
