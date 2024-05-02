import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oydeeedashboard/src/core/core.dart';

class AppCacheImageViewer extends CachedNetworkImage {
  AppCacheImageViewer({
    super.key,
    required super.imageUrl,
    BoxFit super.fit = BoxFit.cover,
    required this.imageTypeEnum,
  });
  final ImageTypeEnum imageTypeEnum;

  @override
  Widget build(BuildContext context) {
    switch (imageTypeEnum) {
      case ImageTypeEnum.assets:
        return Image.asset(imageUrl, fit: fit);
      case ImageTypeEnum.svg:
        return SvgPicture.asset(imageUrl);

      case ImageTypeEnum.file:
        return Image.file(File(imageUrl), fit: fit);

      case ImageTypeEnum.network:
        return CachedNetworkImage(
          fit: fit,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) {
            return const Text("");
          },
        );
    }
  }
}
