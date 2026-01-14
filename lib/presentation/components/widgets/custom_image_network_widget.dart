

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../animations/shimmer_effect.dart';

class CustomImageNetworkWidget extends StatelessWidget {
  const CustomImageNetworkWidget({super.key, required this.photoUrl, this.color, this.fit = BoxFit.cover});
  final String photoUrl;
  final Color? color;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl,
      color: color,
      fit: fit,
      placeholder: (context, url) => const ShimmerEffect(),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.broken_image,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
