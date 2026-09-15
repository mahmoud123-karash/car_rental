import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/driver/car/presentation/manager/car_cubit.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/brand_step_widget.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/car_color_widget.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/car_info_widget.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/material_button_builder_widget.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/step_text_widget.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/steper_widget.dart';
import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditCarScreen extends StatefulWidget {
  const EditCarScreen({super.key, required this.driver});
  final DriverEntity driver;

  @override
  State<EditCarScreen> createState() => _EditCarScreenState();
}

class _EditCarScreenState extends State<EditCarScreen> {
  int step = 1;
  final TextEditingController yearController = TextEditingController();
  final TextEditingController modelController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    yearController.dispose();
    modelController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    yearController.text = widget.driver.driverCar == null
        ? ''
        : widget.driver.driverCar!.year.toString();
    modelController.text = widget.driver.driverCar == null
        ? ''
        : widget.driver.driverCar!.model.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).vehicle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepTextWidget(text: S.of(context).step_of_three(step)),
            SteperWidget(
              step: step,
              onTap1: () {
                setState(() {
                  step = 1;
                });
              },
              onTap2: () {
                setState(() {
                  step = 2;
                });
              },
              onTap3: () {
                setState(() {
                  step = 3;
                });
              },
            ),
            if (step == 1)
              Expanded(
                child: BrandStepWidget(
                  carBrand: widget.driver.driverCar == null
                      ? ''
                      : widget.driver.driverCar!.brand ?? '',
                ),
              ),
            if (step == 2)
              Expanded(
                child: CarColorWidget(
                  carColor: widget.driver.driverCar == null
                      ? 0
                      : widget.driver.driverCar!.color ?? 0,
                ),
              ),
            if (step == 3)
              Expanded(
                child: CarInfoWidget(
                  autovalidateMode: autovalidateMode,
                  yearController: yearController,
                  modelController: modelController,
                  formKey: formKey,
                ),
              ),
            MaterialButtonBuiLderWidget(
              text: step != 3 ? S.of(context).next : S.of(context).done,
              onPressed: () {
                setState(
                  () {
                    String carBrand =
                        CacheHelper.getData(key: 'carbrand') ?? '';
                    int carColor = CacheHelper.getData(key: 'color') ?? 0;

                    if (step == 1) {
                      if (carBrand != '') {
                        step = 2;
                      } else {
                        showSnackBar(context, S.of(context).select_car_brand);
                      }
                    } else if (step == 2) {
                      if (carColor != 0) {
                        step = 3;
                      } else {
                        showSnackBar(context, S.of(context).select_car_color);
                      }
                    } else {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        CarCubit.get(context).update(
                          brand: carBrand,
                          color: carColor,
                          carModel: modelController.text,
                          year: int.parse(yearController.text),
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
