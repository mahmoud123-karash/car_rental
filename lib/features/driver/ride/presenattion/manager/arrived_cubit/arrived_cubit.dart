import 'package:car_rental/features/driver/ride/presenattion/manager/arrived_cubit/arrived_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArrivedCubit extends Cubit<ArrivedStates> {
  ArrivedCubit() : super(InitialArrivedState());
  static ArrivedCubit get(context) => BlocProvider.of(context);

  void updateRide({required String uid}) {
    emit(LoadingUpdateState());
    try {
      FirebaseFirestore.instance.collection('Rides').doc(uid).update({
        "isArrived": true,
      });
      emit(SucessUpdateState());
    } catch (e) {
      emit(ErrorUpdateState());
    }
  }
}
