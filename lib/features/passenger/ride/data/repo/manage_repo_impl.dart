import 'package:car_rental/features/passenger/ride/data/data_sources/remote_data_source/manage_remote_data_source.dart';
import 'package:car_rental/features/passenger/ride/data/models/manage_model/manage_model.dart';
import 'package:car_rental/features/passenger/ride/domain/repo/manage_repo.dart';
import 'package:dartz/dartz.dart';

class ManageRepoImpl extends ManageRepo {
  final ManageRemoteDataSource manageRemoteDataSource;

  ManageRepoImpl(this.manageRemoteDataSource);
  @override
  Future<Either<String, ManageModel>> get({required String uid}) async {
    try {
      ManageModel model = await manageRemoteDataSource.get(uid: uid);
      return right(model);
    } catch (e) {
      return left(e.toString());
    }
  }
}
