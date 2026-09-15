import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/navbar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:flutter/material.dart';

class BotttomNavBarWidget extends StatelessWidget {
  const BotttomNavBarWidget({super.key, required this.cubit});
  final NavBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.cIndex,
          onTap: (value) {
            cubit.changeIndex(value);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          fixedColor: appColor,
          backgroundColor: blackColor,
          unselectedItemColor: whiteColor.withOpacity(
            0.7,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none_outlined,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: '',
            )
          ],
        ),
      ),
    );
  }
}
