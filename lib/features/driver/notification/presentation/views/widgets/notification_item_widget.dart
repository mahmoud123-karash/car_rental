import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/assets.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/notification/data/models/notification_model.dart';
import 'package:car_rental/features/driver/notification/presentation/views/notification_details_screen.dart';
import 'package:car_rental/features/driver/notification/presentation/views/widgets/notification_type_and_text_colum_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key, required this.model});
  final NotificationModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: gryColor,
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        navigateTo(context, NotificationDetailsScreen(model: model));
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: appColor.withOpacity(0.1),
                child: SvgPicture.asset(
                  model.type == 'System'
                      ? Assets.imagesSystem
                      : Assets.imagesPromo,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              NotificationTypeAndTextColumWidget(
                text: model.text,
                type: model.type,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
