import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/car/presentation/manager/car_cubit.dart';
import 'package:car_rental/features/driver/car/presentation/manager/car_states.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/material_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialButtonBuiLderWidget extends StatelessWidget {
  const MaterialButtonBuiLderWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarStates>(
      listener: (context, state) {
        if (state is SuccessUpdteCarDataState) {
          Navigator.pop(context);
          showToast('updated');
        }
        if (state is ErrorUpdteCarDataCarState) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is LoadingUpdteCarDataState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return MaterialButtonWidget(text: text, onPressed: onPressed);
        }
      },
    );
  }
}
