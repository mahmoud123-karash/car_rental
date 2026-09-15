import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/navbar/presentation/manager/navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key, required this.cubit});
  final NavBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: BottomNavigationBar(
        currentIndex: cubit.cIndex,
        selectedItemColor: appColor,
        unselectedItemColor: Colors.white54,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          cubit.changeIndex(value);
        },
        backgroundColor: blackColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house.data,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 27,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.history_rounded,
              size: 27,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 27,
            ),
            label: '',
          )
        ],
      ),
    );
  }
}
