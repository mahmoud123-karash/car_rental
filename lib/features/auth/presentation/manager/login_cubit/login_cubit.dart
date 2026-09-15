import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/features/auth/domain/repo/login_repo.dart';
import 'package:car_rental/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepo) : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginRepo loginRepo;

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());

    var result = await loginRepo.signIn(
      email: email,
      password: password,
    );

    result.fold((error) {
      emit(ErrorLoginState(error));
    }, (uid) {
      saveUid(uid);
      emit(SuccessLoginState());
    });
  }
}
