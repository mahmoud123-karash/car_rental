import 'package:car_rental/features/passenger/history/data/data_sources/remote_data_source/history_remote_data_source.dart';
import 'package:car_rental/features/passenger/history/data/repo/history_repo_impl.dart';
import 'package:car_rental/features/passenger/history/presentation/manager/history_cubit.dart';
import 'package:car_rental/features/passenger/history/presentation/views/widgets/history_list_view_builder_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(
        HistoryRepoImpl(
          HistoryRemoteDataSourceImpl(),
        ),
      )..getHistory(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).history),
        ),
        body: const HistoryListViewBuiderWidget(),
      ),
    );
  }
}
