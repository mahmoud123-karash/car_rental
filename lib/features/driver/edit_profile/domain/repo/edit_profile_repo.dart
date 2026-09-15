import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditProfileRepo {
  Future<Either<String, XFile>> pickProfileImage();

  void updateProfile({
    required String name,
    required String birth,
    required String gender,
    required String job,
    required String phone,
    required String image,
  });

  Future<String> uploadImge({required File imageFile});
}
