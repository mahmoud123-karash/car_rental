import 'dart:io';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/edit_profile/domain/repo/edit_profile_repo.dart';

abstract class UseCase {
  Future<String> update({
    required String name,
    required String birth,
    required String gender,
    required String job,
    required String phone,
    required String image,
  });
}

class UpdateUseCase extends UseCase {
  final EditProfileRepo editProfileRepo;

  UpdateUseCase(this.editProfileRepo);
  @override
  Future<String> update({
    required String name,
    required String birth,
    required String gender,
    required String job,
    required String phone,
    required String image,
  }) async {
    try {
      String path = CacheHelper.getData(key: 'imagepath') ?? '';
      if (path == '') {
        editProfileRepo.updateProfile(
          name: name,
          birth: birth,
          gender: gender,
          job: job,
          phone: phone,
          image: image,
        );
      } else {
        String uri = await editProfileRepo.uploadImge(
          imageFile: File(path),
        );
        editProfileRepo.updateProfile(
          name: name,
          birth: birth,
          gender: gender,
          job: job,
          phone: phone,
          image: uri,
        );
      }
      return 'updated';
    } catch (e) {
      return e.toString();
    }
  }
}
