import 'package:car_rental/features/driver/history/domain/repo/history_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_states.dart';

class HistoryCubit extends Cubit<HistoryStates> {
  HistoryCubit(this.historyRepo) : super(InitialHistorytate());
  static HistoryCubit get(context) => BlocProvider.of(context);

  final HistoryRepo historyRepo;

  void getRides() async {
    emit(LoadingGetHistoryState());
    var result = await historyRepo.get();
    result.fold(
      (message) {
        emit(ErrorGetHistoryState(message));
      },
      (list) {
        emit(
          SuccessGetHistoryState(list),
        );
      },
    );
  }
}
