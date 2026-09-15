import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/get_it.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/edit_profile/data/repo/profile_repo_impl.dart';
import 'package:car_rental/features/driver/edit_profile/domain/use_cases/update_use_case.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/manager/image_cubit/image_cubit.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/manager/update_cubit/update_cubit.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/views/widgets/app_bar_tilte_text_widget.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/views/widgets/save_button_widget.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/views/widgets/stack_driver_image_widget.dart';
import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/profile_expanded_container_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.driver});
  final DriverEntity driver;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dateController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    CacheHelper.removeData(key: 'imagepath');
    nameController.text = widget.driver.driverName ?? '';
    phoneController.text = widget.driver.driverPhone ?? '';
    jobController.text = widget.driver.driverJob ?? '';
    dateController.text = widget.driver.driverBirth ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateCubit(
        getIt.get<UpdateUseCase>(),
      ),
      child: Scaffold(
        backgroundColor: appColor,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: whiteColor),
          centerTitle: true,
          backgroundColor: appColor,
          title: const AppBarTitleWidget(),
          actions: [
            SaveButtonWidget(
              onPressed: () {
                String gender = CacheHelper.getData(key: 'gender') ?? '';
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  if (gender == '') {
                    showSnackBar(context, 'Please select your gender');
                  } else {
                    UpdateCubit.get(context).updateProfile(
                      name: nameController.text,
                      birth: dateController.text,
                      gender: gender,
                      job: jobController.text,
                      phone: phoneController.text,
                      image: widget.driver.driverImage ?? '',
                    );
                  }
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            )
          ],
        ),
        body: Column(
          children: [
            BlocProvider(
              create: (context) => ImageCubit(
                ProfileRepoImpl(),
              ),
              child: StackDriverImageWidget(
                image: widget.driver.driverImage ?? '',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ProfileExpandedContainerWidget(
              autovalidateMode: autovalidateMode,
              formKey: formKey,
              gender: widget.driver.driverGender ?? '',
              dateController: dateController,
              jobController: jobController,
              nameController: nameController,
              phoneController: phoneController,
            ),
          ],
        ),
      ),
    );
  }
}
