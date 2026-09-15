import 'package:car_rental/features/driver/history/data/data_sources/remote_data_source/history_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repo/history_repo.dart';
import '../models/history_model.dart';

class HistoryRepoImpl extends HistoryRepo {
  final HistoryRemoteDataSource historyRemoteDataSource;

  HistoryRepoImpl(this.historyRemoteDataSource);
  @override
  Future<Either<String, List<HistoryModel>>> get() async {
    try {
      List<HistoryModel> list = await historyRemoteDataSource.get();

      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }
}
