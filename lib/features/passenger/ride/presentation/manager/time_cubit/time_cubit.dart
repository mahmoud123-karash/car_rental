import 'package:car_rental/features/passenger/ride/domain/use_cases/time_use_case.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/time_cubit/time_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

class TimeCubit extends Cubit<TimeStates> {
  TimeCubit(this.timeUseCase) : super(InitialTimeState());
  static TimeCubit get(context) => BlocProvider.of(context);

  final TimeUseCase timeUseCase;

  void getTime({
    required String uid,
    required LatLng source,
  }) async {
    emit(LoadingGetTimeState());
    var result = await timeUseCase.get(uid: uid, source: source);
    result.fold((message) {
      emit(ErrorGetTimeState(message));
    }, (time) {
      emit(SuceesGetTimeState(time));
    });
  }
}
