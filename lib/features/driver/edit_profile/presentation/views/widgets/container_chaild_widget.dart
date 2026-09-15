import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'name_text_widget.dart';
import 'profile_gender_widget.dart';
import 'profile_text_field_widget.dart';

class ContainerChaildWidget extends StatelessWidget {
  const ContainerChaildWidget({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.dateController,
    required this.jobController,
    required this.gender,
    required this.autovalidateMode,
  });
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController dateController;
  final TextEditingController jobController;
  final String gender;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const NameTextWidget(text: 'Name'),
          ProfileTextFiledWidget(
            autovalidateMode: autovalidateMode,
            onTap: () {},
            controller: nameController,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 25,
          ),
          const NameTextWidget(text: 'Phone'),
          ProfileTextFiledWidget(
            autovalidateMode: autovalidateMode,
            onTap: () {},
            controller: phoneController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 25,
          ),
          const NameTextWidget(text: 'Job'),
          ProfileTextFiledWidget(
            autovalidateMode: autovalidateMode,
            onTap: () {},
            controller: jobController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 25,
          ),
          const NameTextWidget(text: 'Date Of Birth'),
          ProfileTextFiledWidget(
            autovalidateMode: autovalidateMode,
            onTap: () {
              showDatePicker(
                context: context,
                firstDate: DateTime(1700),
                lastDate: DateTime(2100),
              ).then(
                (value) {
                  if (value != null) {
                    String date = DateFormat('yyyy-MM-dd').format(value);
                    dateController.text = date;
                  }
                },
              );
            },
            controller: dateController,
            keyboardType: TextInputType.none,
          ),
          const SizedBox(
            height: 25,
          ),
          const NameTextWidget(text: 'Gender'),
          ProfileGenderWidget(gender: gender),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
