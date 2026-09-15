import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/features/passenger/ride/domain/repo/payment_repo.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/payment_cubit/payment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.paymentRepo) : super(InitialPaymentState());
  static PaymentCubit get(context) => BlocProvider.of(context);
  final PaymentRepo paymentRepo;
  void saveMethod({
    required String method,
    required String uid,
  }) {
    paymentRepo.updatePaumentMethod(method: method, uid: uid);
    savePaymentMethod(method);
    emit(SavingPaymentMethodState());
  }
}
