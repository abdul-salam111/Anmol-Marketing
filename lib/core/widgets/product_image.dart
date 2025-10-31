import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:anmol_marketing/core/core.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final String? cacheKey;

  const ProductImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.padding,
    this.border,
    this.cacheKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            border ??
            Border.all(
              color: AppColors.darkGreyColor.withAlpha((0.6 * 255).toInt()),
            ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          cacheKey: cacheKey,
          height: height ?? context.screenHeight * 0.1,
          width: width ?? context.screenWidth * 0.25,
          fit: BoxFit.fill,
          placeholder: (context, url) => const Center(),
          errorWidget: (context, url, error) =>
              const Icon(Icons.broken_image, size: 40),
          useOldImageOnUrlChange: true,
          maxWidthDiskCache: 200,
          maxHeightDiskCache: 200,
        ),
      ),
    );
  }
}
