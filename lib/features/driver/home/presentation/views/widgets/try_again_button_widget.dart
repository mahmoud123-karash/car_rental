import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../manager/location_cubit/location_cubit.dart';

class TryAgainButtonWidget extends StatelessWidget {
  const TryAgainButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      color: appColor,
      onPressed: () {
        LoctionCubit.get(context).getLocation();
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text("Try Again"),
      ),
    );
  }
}
