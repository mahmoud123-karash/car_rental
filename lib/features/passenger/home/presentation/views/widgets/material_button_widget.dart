import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/location_cubit/location_cubit.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: appColor),
      ),
      onPressed: () {
        LocationCubit.get(context).getMylocation();
      },
      child: Text(
        S.of(context).try_again,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
