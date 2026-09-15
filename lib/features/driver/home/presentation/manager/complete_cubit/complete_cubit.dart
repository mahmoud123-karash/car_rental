import 'package:car_rental/features/driver/home/domain/repo/home_repo.dart';
import 'package:car_rental/features/driver/home/presentation/manager/complete_cubit/compplete_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteCubit extends Cubit<CompleteStates> {
  CompleteCubit(this.homeRepo) : super(InitialCompleteState());

  static CompleteCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;
  void getData() async {
    emit(LoadingGetDataState());
    var result = await homeRepo.getData();

    result.fold((message) {
      emit(ErrorGetDataState(message));
    }, (model) {
      emit(SuccessGetDataState(model));
    });
  }
}
