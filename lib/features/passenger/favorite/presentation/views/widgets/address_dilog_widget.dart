import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/favorite/presentation/views/widgets/dialog_text_filed_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'dialog_title_widget.dart';
import 'map_location_picker_widget.dart';

class AddressDilogWidget extends StatefulWidget {
  const AddressDilogWidget({super.key, required this.address});
  final String address;

  @override
  State<AddressDilogWidget> createState() => _AddressDilogWidgetState();
}

class _AddressDilogWidgetState extends State<AddressDilogWidget> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: DialogTextWidget(address: widget.address),
      content: DialogTextFiledWidget(controller: controller),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            if (controller.text != '') {
              Navigator.pop(context);
              navigateTo(
                context,
                MapLocationPickerWidget(
                  controller: controller,
                ),
              );
            } else {
              showToast(S.of(context).please_enter_name_first);
            }
          },
          child: Text(S.of(context).next),
        ),
      ],
    );
  }
}
