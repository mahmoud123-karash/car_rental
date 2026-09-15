import 'package:car_rental/features/driver/home/domain/repo/home_repo.dart';
import 'package:car_rental/features/driver/home/presentation/manager/request_cubit/request_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestCubit extends Cubit<RequestStates> {
  RequestCubit(this.homeRepo) : super(InitialRequestState());
  static RequestCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  void getRequests() async {
    emit(LoadingRequestState());

    var result = await homeRepo.getRequest();

    result.fold((message) {
      emit(ErrorRequestState(message));
    }, (requests) {
      emit(SuccessRequestState(requests));
    });
  }

  void cancelRequest({required String uid}) async {
    var result = await homeRepo.cancelRequest(uid: uid);
    result.fold((message) {
      emit(ErrorRequestState(message));
    }, (requests) {
      emit(SuccessRequestState(requests));
    });
  }

  void confirmRequest({
    required String uid,
    required String driverUid,
  }) async {
    emit(LoadingRequestState());
    var result = await homeRepo.confirmRequest(uid: uid, driverUid: driverUid);
    result.fold((message) {
      emit(ErrorRequestState(message));
    }, (model) {
      emit(SuccessConfirmedRequestState(model));
    });
  }
}
