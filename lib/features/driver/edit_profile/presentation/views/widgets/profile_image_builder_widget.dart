import 'dart:io';

import 'package:car_rental/core/shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/image_cubit/image_cubit.dart';
import '../../manager/image_cubit/image_states.dart';
import 'circle_avatar_image_profile_widget.dart';

class ProfileImageBuilderWidget extends StatelessWidget {
  const ProfileImageBuilderWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageStates>(
      builder: (context, state) {
        if (state is SuceesPickImageState) {
          return CircleAvatarImageProfileWidget(
            backgroundImage: FileImage(
              File(state.image.path),
            ),
          );
        } else {
          return CircleAvatarImageProfileWidget(
            backgroundImage: image != ''
                ? NetworkImage(image) as ImageProvider
                : const AssetImage(Assets.imagesProfile),
          );
        }
      },
    );
  }
}
