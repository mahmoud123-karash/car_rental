import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_cubit.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/map_cubit/map_states.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/constants.dart';
import 'address_row_widget.dart';
import 'spacer_address_widget.dart';

class AddressTextBuilderWidget extends StatelessWidget {
  const AddressTextBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapStates>(
      builder: (context, state) {
        MapCubit cubit = MapCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: gryColor.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: Column(
              children: [
                AddressRowWidget(
                  address:
                      cubit.sAddress != '' ? cubit.sAddress : S.of(context).current_location,
                  text: S.of(context).from,
                  color: appColor,
                ),
                const SpacerAddressWidget(),
                AddressRowWidget(
                  address: cubit.dAddress != ''
                      ? cubit.dAddress
                      : S.of(context).where_to_go,
                  text: S.of(context).to,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
