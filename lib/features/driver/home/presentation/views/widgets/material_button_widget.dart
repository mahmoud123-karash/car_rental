import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/home/presentation/manager/complete_cubit/complete_cubit.dart';
import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        color: appColor,
        onPressed: () {
          bool mission = CacheHelper.getData(key: 'mission') ?? false;
          if (!mission) {
            CompleteCubit.get(context).getData();
          } else {
            showSnackBar(context, 'please finish your mission first');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
