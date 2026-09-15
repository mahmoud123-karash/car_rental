import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileGenderWidget extends StatefulWidget {
  const ProfileGenderWidget({super.key, required this.gender});
  final String gender;

  @override
  State<ProfileGenderWidget> createState() => _ProfileGenderWidgetState();
}

class _ProfileGenderWidgetState extends State<ProfileGenderWidget> {
  late String gValue;
  @override
  void initState() {
    gValue = widget.gender != ''
        ? widget.gender
        : CacheHelper.getData(key: 'gender') ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          secondary: const Icon(Icons.male),
          title: const Text(
            'Male',
            style: TextStyles.style20,
          ),
          value: 'Male',
          groupValue: gValue,
          onChanged: (value) {
            saveGender('Male');
            setState(() {
              gValue = value!;
            });
          },
        ),
        RadioListTile(
          secondary: const Icon(Icons.female_sharp),
          title: const Text(
            'Female',
            style: TextStyles.style20,
          ),
          value: 'Female',
          groupValue: gValue,
          onChanged: (value) {
            saveGender('Female');
            setState(() {
              gValue = value!;
            });
          },
        )
      ],
    );
  }
}
