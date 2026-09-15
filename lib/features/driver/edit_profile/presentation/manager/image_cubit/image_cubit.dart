import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/features/driver/edit_profile/domain/repo/edit_profile_repo.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/manager/image_cubit/image_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCubit extends Cubit<ImageStates> {
  ImageCubit(this.editProfileRepo) : super(InitialImageState());
  static ImageCubit get(context) => BlocProvider.of(context);
  final EditProfileRepo editProfileRepo;

  void pichImage() async {
    emit(LoadingPickImageState());
    var result = await editProfileRepo.pickProfileImage();
    result.fold((message) {
      emit(ErrorPickImageState());
    }, (pickedImage) {
      saveImagePath(pickedImage.path);
      emit(SuceesPickImageState(pickedImage));
    });
  }
}
