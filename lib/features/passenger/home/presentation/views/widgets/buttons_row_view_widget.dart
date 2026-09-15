import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/find_driver_screen.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/custom_button_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsRowViewWidget extends StatefulWidget {
  const ButtonsRowViewWidget({
    super.key,
    required this.latD,
    required this.lngD,
    required this.latS,
    required this.lngS,
  });
  final double latD, lngD, latS, lngS;

  @override
  State<ButtonsRowViewWidget> createState() => _ButtonsRowViewWidgetState();
}

class _ButtonsRowViewWidgetState extends State<ButtonsRowViewWidget> {
  @override
  void initState() {
    CacheHelper.removeData(key: 'method');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomButtonWidget(
        text: S.of(context).next,
        onPressed: () {
          String method = CacheHelper.getData(key: 'method') ?? '';
          if (method != '') {
            Navigator.pop(context);
            navigateTo(
              context,
              FindDriverScreen(
                latD: widget.latD,
                latS: widget.latS,
                lngD: widget.lngD,
                lngS: widget.lngS,
              ),
            );
          } else {
            showToast(
              S.of(context).please_select_payment_method,
              gravity: ToastGravity.TOP,
            );
          }
        },
      ),
    );
  }
}
