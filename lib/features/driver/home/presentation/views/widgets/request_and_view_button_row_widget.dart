import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/home/presentation/views/all_requests_screen.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class RequestAndViewButtonRowWidget extends StatelessWidget {
  const RequestAndViewButtonRowWidget({super.key, required this.requests});
  final List<RequestModel> requests;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).new_request,
          style: TextStyles.style18.copyWith(fontFamily: ''),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            navigateTo(
              context,
              AllRequestsScreen(requests: requests, title: S.of(context).new_requests),
            );
          },
          child: Text(
            S.of(context).view_all,
            textAlign: TextAlign.right,
            style: TextStyles.style14,
          ),
        )
      ],
    );
  }
}
