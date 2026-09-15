import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/map_builder_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/home_builder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
            onPressed: () {
              showAppBottomSheet(context, const MapBuilderWidget());
            },
            child: const Icon(
              Icons.location_history_outlined,
            ),
          )
        ],
      ),
      body: const HomeBuilderWidget(),
    );
  }
}
