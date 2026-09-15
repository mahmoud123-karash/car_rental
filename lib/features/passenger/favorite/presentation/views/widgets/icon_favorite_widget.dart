import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/favorite/presentation/views/widgets/address_dilog_widget.dart';
import 'package:flutter/material.dart';

class IconFavoriteWidget extends StatelessWidget {
  const IconFavoriteWidget({
    super.key,
    required this.icon,
    required this.address,
  });
  final IconData icon;
  final String address;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: gryColor,
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        saveAdress(address);
        showDialog(
          context: context,
          builder: (context) => AddressDilogWidget(
            address: address,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: appColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            icon,
            color: appColor,
            size: 40,
          ),
        ),
      ),
    );
  }
}
