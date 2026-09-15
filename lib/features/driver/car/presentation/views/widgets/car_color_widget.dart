import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class CarColorWidget extends StatefulWidget {
  const CarColorWidget({super.key, required this.carColor});
  final int carColor;

  @override
  State<CarColorWidget> createState() => _CarColorWidgetState();
}

class _CarColorWidgetState extends State<CarColorWidget> {
  late int color;
  @override
  void initState() {
    color = widget.carColor != 0
        ? widget.carColor
        : CacheHelper.getData(key: 'color') ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Card(
          elevation: 0,
          child: ColorPicker(
            color: color != 0 ? Color(color) : Colors.amber,
            onColorChanged: (Color color) {
              saveCarColor(color.value);
            },
            width: 44,
            height: 44,
            borderRadius: 22,
            heading: Text(
              'Select your car color',
              style: TextStyles.style20.copyWith(
                color: gryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            subheading: Text(
              'Select color shade',
              style: TextStyles.style20.copyWith(
                color: gryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
