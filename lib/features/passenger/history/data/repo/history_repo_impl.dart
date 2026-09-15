import 'package:car_rental/features/passenger/history/data/data_sources/remote_data_source/history_remote_data_source.dart';
import 'package:car_rental/features/passenger/history/data/models/history_model.dart';
import 'package:car_rental/features/passenger/history/domain/repo/history_repo.dart';
import 'package:dartz/dartz.dart';

class HistoryRepoImpl extends HistoryRepo {
  final HistoryRemoteDataSource historyRemoteDataSource;

  HistoryRepoImpl(this.historyRemoteDataSource);
  @override
  Future<Either<String, List<HistoryModel>>> getRides() async {
    try {
      List<HistoryModel> models = await historyRemoteDataSource.get();
      // models.sort((a, b) => a.time.compareTo(b.time));

      return right(models);
    } catch (e) {
      return left(e.toString());
    }
  }
}
