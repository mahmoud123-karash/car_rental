import 'package:car_rental/features/passenger/favorite/presentation/views/widgets/favorite_list_builder_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'widgets/icons_row_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favorite),
      ),
      body: const Column(
        children: [
          IconsRowWidget(),
          FavoriteListBuilderWidget(),
        ],
      ),
    );
  }
}
