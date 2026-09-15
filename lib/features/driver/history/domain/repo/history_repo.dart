import 'package:car_rental/features/driver/history/data/models/history_model.dart';
import 'package:dartz/dartz.dart';

abstract class HistoryRepo {
  Future<Either<String, List<HistoryModel>>> get();
}
