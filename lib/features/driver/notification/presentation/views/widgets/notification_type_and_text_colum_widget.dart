import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class NotificationTypeAndTextColumWidget extends StatelessWidget {
  const NotificationTypeAndTextColumWidget(
      {super.key, required this.text, required this.type});
  final String text, type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: TextStyles.style17,
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: appSize(context).width - (60 + 40 + 25 + 24),
          ),
          child: Text(
            text,
            style: TextStyles.style15.copyWith(
              fontFamily: '',
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        )
      ],
    );
  }
}
