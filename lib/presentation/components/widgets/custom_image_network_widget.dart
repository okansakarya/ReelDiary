import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movieapp/core/constants/app_colors.dart';

class CustomImageNetworkWidget extends StatelessWidget {
  const CustomImageNetworkWidget({
    super.key,
    required this.photoUrl,
    this.color,
    this.fit = BoxFit.cover,
  });
  final String photoUrl;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl,
      color: color,
      fit: fit,
      placeholder: (context, url) => Container(
        color: AppColors.surfaceVariant(context),
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.textPrimary(context)),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.broken_image,
          color: AppColors.textPrimary(context),
          size: 50,
        ),
      ),
    );
  }
}
