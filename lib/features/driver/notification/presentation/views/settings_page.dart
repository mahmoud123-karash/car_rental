import 'package:car_rental/features/driver/notification/presentation/views/widgets/promotion_swith_list_tile_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Column(
        children: [
          PromotionSwitchListTileWidget(),
        ],
      ),
    );
  }
}
