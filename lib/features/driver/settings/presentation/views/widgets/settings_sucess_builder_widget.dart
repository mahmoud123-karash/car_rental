import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/auth/presentation/views/forget_pass_screen.dart';
import 'package:car_rental/features/driver/car/presentation/views/edit_car_screen.dart';
import 'package:car_rental/features/driver/edit_profile/presentation/views/edit_profile_screen.dart';
import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';
import 'package:car_rental/features/driver/settings/presentation/views/widgets/logout_diolog_widget.dart';
import 'package:car_rental/features/driver/settings/presentation/views/widgets/settings_tile_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'driver_name_and_image_widget.dart';
import 'settings_spacer_widget.dart';
import 'settings_theme_widget.dart';

class SettingsSuccessBuilderWidget extends StatelessWidget {
  const SettingsSuccessBuilderWidget({
    super.key,
    required this.driver,
  });
  final DriverEntity driver;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          DriverNameAndImageWidget(
            image: driver.driverImage ?? '',
            name: driver.driverName!,
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).edit_profile,
            icon: Icons.person_outlined,
            onTap: () {
              navigateTo(context, EditProfileScreen(driver: driver));
            },
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).vehicle,
            icon: FontAwesomeIcons.carRear.data,
            onTap: () {
              navigateTo(context, EditCarScreen(driver: driver));
            },
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).change_password,
            icon: Icons.lock_outline,
            onTap: () {
              navigateTo(context, const ForgetPassScreen());
            },
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).language,
            icon: Icons.language,
            onTap: () {
              showSnackBar(context, S.of(context).soon);
            },
          ),
          const SettingsSpacerWidget(),
          const SettingsThemeWidget(),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).rate_app,
            icon: Icons.star_rate_outlined,
            onTap: () {
              final Uri url = Uri.parse(appLink);
              openUri(url: url);
            },
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).share_app,
            icon: Icons.share_outlined,
            onTap: () {
              share(
                title: 'OnTrack',
                text: 'Enjoy your trip with our app OnTrack',
              );
            },
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).about_app,
            icon: Icons.info_outline_rounded,
            onTap: () {},
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).contact_us,
            icon: Icons.email_outlined,
            onTap: () {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'karashmahmoud@gmail.com ',
              );
              openUri(url: emailLaunchUri);
            },
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).privacy,
            icon: Icons.privacy_tip_outlined,
            onTap: () {
              final Uri url = Uri.parse(appPrivacy);
              openUri(url: url);
            },
          ),
          const SettingsSpacerWidget(),
          SettingsListTileWidget(
            title: S.of(context).logout,
            icon: Icons.logout_outlined,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const LogoutDiologWidget(),
              );
            },
          ),
        ],
      ),
    );
  }
}
