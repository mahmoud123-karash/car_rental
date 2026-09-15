import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/favorite/presentation/manager/favorite_cubit.dart';
import 'package:car_rental/features/passenger/favorite/presentation/manager/favorite_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_list_view_widget.dart';
import 'message_favorite_widget.dart';

class FavoriteListBuilderWidget extends StatelessWidget {
  const FavoriteListBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        if (state is SuccessFavoriteState) {
          if (state.list.isEmpty) {
            return const MessageFavoriteWidget(text: 'Try Add Some');
          } else {
            return FavoriteListViewWidget(list: state.list);
          }
        } else if (state is ErrorFavoriteState) {
          return MessageFavoriteWidget(text: state.error);
        } else {
          return Padding(
            padding: EdgeInsets.only(
              top: appSize(context).height / 2 - 200,
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: gryColor.withOpacity(0.3),
              ),
            ),
          );
        }
      },
    );
  }
}
