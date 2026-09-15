import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/passenger_info_container_widget.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/public_text_widget.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/settings_tile_widget.dart';
import 'package:flutter/material.dart';
import 'settings_spacer_widget.dart';
import 'settings_theme_widget.dart';

class LoadingBuilderWidget extends StatelessWidget {
  const LoadingBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          PassengerInfoContainerWidegt(
            passenger: PassangerModel(
              email: '',
              name: 'name',
              phone: 'phone',
              job: 'job',
              gender: 'gender',
            ),
          ),
          const PublicTextWidget(),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: 'Edit Profile',
            icon: Icons.person_outlined,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
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
