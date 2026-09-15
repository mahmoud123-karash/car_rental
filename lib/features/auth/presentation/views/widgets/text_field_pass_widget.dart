import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/auth/presentation/manager/obscure_cubit/obscure_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/obscure_cubit/obscure_states.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldPassWidget extends StatelessWidget {
  const TextFieldPassWidget({
    super.key,
    required this.textEditingController,
    required this.autovalidateMode,
  });
  final TextEditingController textEditingController;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObscureCubit, ObscureStates>(
      builder: (context, state) {
        var cubit = ObscureCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: gryColor.withOpacity(0.4),
          ),
          child: TextFormField(
            autovalidateMode: autovalidateMode,
            obscureText: cubit.hidden,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).field_required;
              }
              return null;
            },
            style: TextStyles.style20,
            keyboardType: TextInputType.text,
            controller: textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.lock,
                color: appColor,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  cubit.hidePassText();
                },
                icon: Icon(
                  cubit.hidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                ),
              ),
              label: Text(
                S.of(context).password,
              ),
            ),
          ),
        );
      },
    );
  }
}
