import 'package:car_rental/features/passenger/ride/domain/repo/manage_repo.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/manage_cubit.dart/manage_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageCubit extends Cubit<ManageStates> {
  ManageCubit(this.manageRepo) : super(InitialManageState());
  static ManageCubit get(context) => BlocProvider.of(context);

  final ManageRepo manageRepo;

  void getData({required String uid}) async {
    emit(LoadingManageState());
    var result = await manageRepo.get(uid: uid);
    result.fold((message) {
      emit(ErrorManageState(message));
    }, (model) {
      emit(SuccessManageState(model));
    });
  }
}
