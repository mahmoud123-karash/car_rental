import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/widgets.dart';

class AddressColumWidget extends StatelessWidget {
  const AddressColumWidget(
      {super.key, required this.text, required this.address});
  final String text;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyles.style20Bold,
        ),
        Container(
          constraints: BoxConstraints(maxWidth: appSize(context).width - 115),
          child: Text(
            address,
            style: TextStyles.style15.copyWith(
              color: gryColor,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
