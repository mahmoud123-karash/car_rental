import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/profile/data/repo/profile_repo_impl.dart';
import 'package:car_rental/features/passenger/profile/presentation/manager/profile_cubit.dart';
import 'package:car_rental/features/passenger/profile/presentation/manager/profile_states.dart';
import 'package:car_rental/features/passenger/profile/presentation/views/widgets/material_button_builder_widget.dart';
import 'package:car_rental/features/passenger/profile/presentation/views/widgets/profile_colum_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../settings/data/models/passanger_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.passenger});
  final PassangerModel passenger;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    nameController.text = widget.passenger.name;
    phoneController.text = widget.passenger.phone;
    jobController.text = widget.passenger.job;

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        ProfileRepoImpl(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ProfileColumBodyWidget(
                  nameController: nameController,
                  phoneController: phoneController,
                  jobController: jobController,
                  autovalidateMode: autovalidateMode,
                  gender: widget.passenger.gender,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocBuilder<ProfileCubit, ProfileStates>(
                    builder: (context, state) => MaterialButtonBuilderWidget(
                      onPressed: () {
                        String gender =
                            CacheHelper.getData(key: 'pgender') ?? '';
                        if (formKey.currentState!.validate()) {
                          if (gender != '') {
                            ProfileCubit.get(context).update(
                              name: nameController.text,
                              phone: phoneController.text,
                              job: jobController.text,
                              gender: gender,
                            );
                          } else {
                            showSnackBar(context, 'Please select your gender');
                          }
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
