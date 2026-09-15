import 'package:car_rental/features/passenger/profile/domain/repo/profile_repo.dart';
import 'package:car_rental/features/passenger/profile/presentation/manager/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(InitialProfileState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  final ProfileRepo profileRepo;
  void update({
    required String name,
    required String phone,
    required String job,
    required String gender,
  }) async {
    emit(LoadingUpdateProfileState());
    String message = await profileRepo.updatePassenger(
      name: name,
      phone: phone,
      job: job,
      gender: gender,
    );
    if (message == '') {
      emit(SucessUpdateProfileState());
    } else {
      emit(ErrroUpdateProfileState(message));
    }
  }
}
