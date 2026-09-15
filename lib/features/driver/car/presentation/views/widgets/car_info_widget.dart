import 'package:car_rental/features/driver/car/presentation/views/widgets/text_filed_widget.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/text_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class CarInfoWidget extends StatelessWidget {
  const CarInfoWidget({
    super.key,
    required this.yearController,
    required this.formKey,
    required this.modelController,
    required this.autovalidateMode,
  });
  final TextEditingController yearController;
  final TextEditingController modelController;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          TextWidget(text: S.of(context).car_model),
          TextFieldWidget(
            autovalidateMode: autovalidateMode,
            controller: modelController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 15,
          ),
          TextWidget(text: S.of(context).manufacture_year),
          TextFieldWidget(
            autovalidateMode: autovalidateMode,
            controller: yearController,
            textInputType: TextInputType.number,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
