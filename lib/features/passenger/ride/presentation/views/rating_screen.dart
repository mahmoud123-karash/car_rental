import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/features/passenger/ride/domain/use_cases/rating_use_case.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/rating_cubit/rating_cubit.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/rating_container_widget.dart';
import 'widgets/rating_driver_image_widget.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({
    super.key,
    required this.image,
    required this.name,
    required this.driverUid,
    required this.rideUid,
    required this.date,
    required this.source,
    required this.destination,
    required this.method,
    required this.price,
  });
  final String image,
      name,
      driverUid,
      rideUid,
      date,
      source,
      destination,
      method,
      price;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingCubit(
        getIt.get<RatingUseCase>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).rating),
          centerTitle: true,
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            RatingContaiberWidget(
              name: name,
              driverUid: driverUid,
              rideUid: rideUid,
              date: date,
              source: source,
              destination: destination,
              method: method,
              price: price,
            ),
            RatingDriverImageWidget(image: image),
          ],
        ),
      ),
    );
  }
}
