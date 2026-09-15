import 'package:car_rental/features/auth/presentation/manager/obscure_cubit/obscure_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ObscureCubit extends Cubit<ObscureStates> {
  ObscureCubit() : super(InitialObscureState());
  static ObscureCubit get(context) => BlocProvider.of(context);

  bool hidden = true;

  void hidePassText() {
    hidden = !hidden;
    emit(HodePassTextState());
  }
}
