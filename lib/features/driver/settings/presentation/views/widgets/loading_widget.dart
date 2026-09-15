import 'package:car_rental/features/driver/settings/presentation/views/widgets/settings_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'driver_name_and_image_widget.dart';
import 'settings_tile_widget.dart';
import 'settings_spacer_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const DriverNameAndImageWidget(image: '', name: ''),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'Edit Profile',
            icon: Icons.person_outlined,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'Vehicle',
            icon: FontAwesomeIcons.carRear.data,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'Change Password',
            icon: Icons.lock_outline,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'Language',
            icon: Icons.language,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
          const SettingsThemeWidget(),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'Rate The app',
            icon: Icons.star_rate_outlined,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
              title: 'Share App', icon: Icons.share_outlined, onTap: () {}),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'About App',
            icon: Icons.info_outline_rounded,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'Contact Us',
            icon: Icons.email_outlined,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'Privacy',
            icon: Icons.privacy_tip_outlined,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'Logout',
            icon: Icons.logout_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
