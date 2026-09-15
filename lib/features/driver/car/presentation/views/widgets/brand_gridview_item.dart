import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/gen/assets.gen.dart';

class BrandGridViewItem extends StatelessWidget {
  const BrandGridViewItem({
    super.key,
    required this.e,
    required this.brand,
  });
  final AssetGenImage e;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: brand == e.keyName
              ? Border.all(color: appColor, width: 2.5)
              : Border.all(),
        ),
        child: e.image(),
      ),
    );
  }
}
