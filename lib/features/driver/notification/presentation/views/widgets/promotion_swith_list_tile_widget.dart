import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PromotionSwitchListTileWidget extends StatefulWidget {
  const PromotionSwitchListTileWidget({super.key});

  @override
  State<PromotionSwitchListTileWidget> createState() =>
      _PromotionSwitchListTileWidgetState();
}

class _PromotionSwitchListTileWidgetState
    extends State<PromotionSwitchListTileWidget> {
  late bool isActive;
  @override
  void initState() {
    isActive = CacheHelper.getData(key: 'promotion') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: const Icon(Icons.notifications_active_outlined),
      title: const Text(
        'Promotion',
        style: TextStyles.style16,
      ),
      value: isActive,
      onChanged: (value) {
        savePromotion(value);
        isActive = value;
        setState(() {});
      },
    );
  }
}
