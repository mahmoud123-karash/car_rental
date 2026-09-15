import 'package:car_rental/features/passenger/history/domain/repo/history_repo.dart';
import 'package:car_rental/features/passenger/history/presentation/manager/history_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<HistoryStates> {
  HistoryCubit(this.historyRepo) : super(InitialHistoryState());
  static HistoryCubit get(context) => BlocProvider.of(context);

  final HistoryRepo historyRepo;

  void getHistory() async {
    emit(LoadingGetHistoryState());
    var result = await historyRepo.getRides();
    result.fold((message) {
      emit(ErrorGetHistoryState(message));
    }, (list) {
      emit(SuccessGetHistoryState(list));
    });
  }
}
