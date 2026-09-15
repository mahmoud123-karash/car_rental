import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/history/presentation/manager/history_cubit.dart';
import 'package:car_rental/features/passenger/history/presentation/manager/history_states.dart';
import 'package:car_rental/features/passenger/history/presentation/views/widgets/empty_history_widget.dart';
import 'package:car_rental/features/passenger/history/presentation/views/widgets/history_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'message_builder_widget.dart';

class HistoryListViewBuiderWidget extends StatelessWidget {
  const HistoryListViewBuiderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryStates>(
      builder: (context, state) {
        if (state is SuccessGetHistoryState) {
          if (state.history.isEmpty) {
            return const EmptyHistoryWidget();
          }
          return HistoryListViewWidget(models: state.history);
        } else if (state is ErrorGetHistoryState) {
          return MessageBuilderWidget(message: state.message);
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: gryColor.withOpacity(0.5),
            ),
          );
        }
      },
    );
  }
}
