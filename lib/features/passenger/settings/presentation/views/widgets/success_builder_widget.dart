import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/auth/presentation/views/forget_pass_screen.dart';
import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/dialog_logout_widget.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/passenger_info_container_widget.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/public_text_widget.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/settings_tile_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'settings_spacer_widget.dart';
import 'settings_theme_widget.dart';

class SuccessBuilderWidget extends StatelessWidget {
  const SuccessBuilderWidget({super.key, required this.passenger});
  final PassangerModel passenger;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          PassengerInfoContainerWidegt(
            passenger: passenger,
          ),
          const PublicTextWidget(),
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
                builder: (context) => const DialogLogoutWidget(),
              );
            },
          ),
        ],
      ),
    );
  }
}
