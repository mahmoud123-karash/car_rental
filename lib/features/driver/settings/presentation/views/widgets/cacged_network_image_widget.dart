import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/features/driver/settings/presentation/views/widgets/circle_avatar_image_widget.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(image),
      ),
      placeholder: (context, url) => const CiecleAvatarimageWidget(),
      errorWidget: (context, url, error) => const CiecleAvatarimageWidget(),
    );
  }
}
