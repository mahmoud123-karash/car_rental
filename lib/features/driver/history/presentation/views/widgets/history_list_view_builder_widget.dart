// ignore_for_file: file_names

import 'package:car_rental/features/driver/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:car_rental/features/driver/history/presentation/manager/history_cubit/history_states.dart';
import 'package:car_rental/features/driver/history/presentation/views/widgets/message_builder_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_list_view_widget.dart';

class HistoryListViewBuilderWidget extends StatelessWidget {
  const HistoryListViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryStates>(
      builder: (context, state) {
        if (state is SuccessGetHistoryState) {
          if (state.list.isEmpty) {
            return const MessageBuilderWidget(message: 'No Rides');
          }
          return HistoryListViewWidget(list: state.list);
        } else if (state is ErrorGetHistoryState) {
          return MessageBuilderWidget(message: state.message);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
