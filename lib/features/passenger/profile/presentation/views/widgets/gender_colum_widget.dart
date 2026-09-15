import 'package:car_rental/core/cache/save_data.dart';
import 'package:flutter/material.dart';

import 'gender_radio_widget.dart';

class GenderColumWidget extends StatefulWidget {
  const GenderColumWidget({
    super.key,
    required this.gender,
  });
  final String gender;

  @override
  State<GenderColumWidget> createState() => _GenderColumWidgetState();
}

class _GenderColumWidgetState extends State<GenderColumWidget> {
  late String gValue;
  @override
  void initState() {
    gValue = widget.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderRadioWidget(
          gValue: gValue,
          value: 'Male',
          icon: Icons.male,
          onChange: (value) {
            savePGender('Male');
            setState(() {
              gValue = value!;
            });
          },
        ),
        GenderRadioWidget(
          gValue: gValue,
          value: 'Female',
          icon: Icons.female,
          onChange: (value) {
            savePGender('Female');
            setState(() {});
            gValue = value!;
          },
        )
      ],
    );
  }
}
