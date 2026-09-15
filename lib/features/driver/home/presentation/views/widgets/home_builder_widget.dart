import 'package:car_rental/features/driver/home/presentation/views/widgets/earing_and_request_buider_widget.dart';
import 'package:flutter/material.dart';
import 'start_consumer_builder_widget.dart';

class HomeBuilderWidget extends StatelessWidget {
  const HomeBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 10,
        ),
        EaringAndRequestBuilderWidget(),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: StartConsumerBuilderWidget(),
        ),
      ],
    );
  }
}
