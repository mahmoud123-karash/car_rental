import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/manager/image_cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'profile_image_builder_widget.dart';

class StackDriverImageWidget extends StatelessWidget {
  const StackDriverImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ProfileImageBuilderWidget(image: image),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            hoverColor: appColor,
            onTap: () {
              ImageCubit.get(context).pichImage();
            },
            child: CircleAvatar(
              backgroundColor: whiteColor,
              child: Icon(
                Icons.camera_alt_outlined,
                color: appColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
