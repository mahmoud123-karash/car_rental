import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/car/presentation/views/widgets/brand_gridview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';

class BrandGridViewWidget extends StatefulWidget {
  const BrandGridViewWidget({super.key, required this.carBrand});
  final String carBrand;

  @override
  State<BrandGridViewWidget> createState() => _BrandGridViewWidgetState();
}

class _BrandGridViewWidgetState extends State<BrandGridViewWidget> {
  late String brand;
  @override
  void initState() {
    brand = widget.carBrand != ''
        ? widget.carBrand
        : CacheHelper.getData(key: 'carbrand') ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 4 / 6,
          children: [
            ...AnyLogo.auto.values
                .map(
                  (e) => InkWell(
                    borderRadius: BorderRadius.circular(10),
                    hoverColor: gryColor,
                    onTap: () {
                      saveCarBrand(e.keyName);
                      setState(() {
                        brand = e.keyName;
                      });
                    },
                    child: BrandGridViewItem(
                      e: e,
                      brand: brand,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
