import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/map_cubit/map_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/map_cubit/map_states.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/driver_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverBuilderWidget extends StatefulWidget {
  const DriverBuilderWidget(
      {super.key,
      required this.rideUid,
      required this.source,
      required this.driverUid});
  final String rideUid, driverUid;
  final LatLng source;

  @override
  State<DriverBuilderWidget> createState() => _DriverBuilderWidgetState();
}

class _DriverBuilderWidgetState extends State<DriverBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapStates>(
      listener: (context, state) async {
        if (state is SuceesGetLocationState) {
          Future.delayed(const Duration(seconds: 60)).then((value) {
            if (mounted && context.mounted) {
              MapCubit.get(context).getLocation(
                uid: widget.driverUid,
                source: widget.source,
              );
            }
          });
        }
      },
      builder: (context, state) {
        if (state is SuceesGetLocationState) {
          String rating = getDriverRating(state.model.rating ?? []);
          saveDriverName(state.model.name);
          saveDriverImage(state.model.image);
          saveDriverRating(rating);
          return DriverWidget(
            name: state.model.name,
            phone: state.model.phone,
            image: state.model.image,
            rating: '${state.model.rating == null ? 0 : rating}',
            driverUid: widget.driverUid,
            uid: widget.rideUid,
          );
        } else {
          String name = CacheHelper.getData(key: 'dName') ?? 'Driver Name';
          String image = CacheHelper.getData(key: 'dImage') ?? '';
          String rating = CacheHelper.getData(key: 'dRating') ?? '0';
          return DriverWidget(
            name: name,
            phone: '',
            image: image,
            rating: rating,
            driverUid: widget.driverUid,
            uid: widget.rideUid,
          );
        }
      },
    );
  }
}
