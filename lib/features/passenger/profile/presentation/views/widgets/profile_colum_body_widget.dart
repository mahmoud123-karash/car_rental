import 'package:flutter/material.dart';

import 'gender_colum_widget.dart';
import 'profile_text_filed_widgte.dart';
import 'profile_text_widget.dart';

class ProfileColumBodyWidget extends StatelessWidget {
  const ProfileColumBodyWidget({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.jobController,
    required this.autovalidateMode,
    required this.gender,
  });
  final TextEditingController nameController, phoneController, jobController;
  final AutovalidateMode autovalidateMode;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileTextWidget(text: 'Name'),
        ProfileTextFiledWidget(
          autovalidateMode: autovalidateMode,
          controller: nameController,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        const ProfileTextWidget(text: 'Phone'),
        ProfileTextFiledWidget(
          autovalidateMode: autovalidateMode,
          controller: phoneController,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        const ProfileTextWidget(text: 'Job'),
        ProfileTextFiledWidget(
          autovalidateMode: autovalidateMode,
          controller: jobController,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        const ProfileTextWidget(text: 'Gender'),
        GenderColumWidget(gender: gender),
      ],
    );
  }
}
