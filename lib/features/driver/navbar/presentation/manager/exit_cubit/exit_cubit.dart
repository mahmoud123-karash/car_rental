import 'package:car_rental/features/driver/navbar/domain/navbar_repo.dart';
import 'package:car_rental/features/driver/navbar/presentation/manager/exit_cubit/exit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExitCubit extends Cubit<ExitStates> {
  ExitCubit(this.navBarRepo) : super(InitialExitState());
  static ExitCubit get(context) => BlocProvider.of(context);

  final NavBarRepo navBarRepo;

  void updateAndExit(context) async {
    emit(LoadingExitState());
    var result = await navBarRepo.update();

    result.fold((error) {
      emit(ErroExitState(error));
    }, (message) {
      Navigator.pop(context);

      SystemNavigator.pop();
      emit(SuccessExitState());
    });
  }
}
