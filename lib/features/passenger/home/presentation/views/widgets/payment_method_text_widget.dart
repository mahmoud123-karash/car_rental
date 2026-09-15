import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class PaymentMethodTextWidget extends StatelessWidget {
  const PaymentMethodTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        bottom: 20,
      ),
      child: Text(
        S.of(context).select_payment_method,
        style: TextStyles.style20,
      ),
    );
  }
}
