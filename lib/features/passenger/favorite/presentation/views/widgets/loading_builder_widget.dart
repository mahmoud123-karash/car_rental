import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/favorite/presentation/manager/favorite_cubit.dart';
import 'package:car_rental/features/passenger/favorite/presentation/manager/favorite_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingBuilderWidget extends StatelessWidget {
  const LoadingBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteStates>(
      listener: (context, state) {
        if (state is ErrorFavoriteState) {
          showSnackBar(context, state.error);
        }
        if (state is SuccessFavoriteState) {
          Navigator.pop(context);
          showSnackBar(context, 'Successfully added');
        }
      },
      builder: (context, state) {
        if (state is LoadingFavoriteState) {
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: appColor.withOpacity(0.5),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
