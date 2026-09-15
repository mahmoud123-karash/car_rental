import 'dart:io';
import 'dart:math';

import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/edit_profile/data/models/profile_model.dart';
import 'package:car_rental/features/driver/edit_profile/domain/repo/edit_profile_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileRepoImpl extends EditProfileRepo {
  @override
  void updateProfile({
    required String name,
    required String birth,
    required String gender,
    required String job,
    required String phone,
    required String image,
  }) async {
    String uid = CacheHelper.getData(key: 'uid');
    ProfileModel model = ProfileModel(
      name: name,
      birth: birth,
      gender: gender,
      image: image,
      job: job,
      phone: phone,
      profileCompleted: true,
    );
    await FirebaseFirestore.instance
        .collection('Drivers')
        .doc(uid)
        .update(model.toJson());
  }

  @override
  Future<Either<String, XFile>> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return right(image);
    }
    return left('No Image');
  }

  @override
  Future<String> uploadImge({required File imageFile}) async {
    int num = Random().nextInt(500);
    var data = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images')
        .child('$num$num.jpg')
        .putFile(imageFile);

    String uri = await data.ref.getDownloadURL();
    return uri;
  }
}
