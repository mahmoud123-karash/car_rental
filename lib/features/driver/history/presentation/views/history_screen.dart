import 'package:car_rental/features/driver/history/data/repo/history_repo_impl.dart';
import 'package:car_rental/features/driver/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/remote_data_source/history_remote_data_source.dart';
import 'widgets/history_list_view_builder_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(
        HistoryRepoImpl(
          HistoryRemoteDataSourceImpl(),
        ),
      )..getRides(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).history),
        ),
        body: const HistoryListViewBuilderWidget(),
      ),
    );
  }
}
