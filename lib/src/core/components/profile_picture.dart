import 'package:flutter/material.dart';
import 'package:oydeeedashboard/src/core/core.dart';

String profileImages =
    "https://scontent.fktm14-1.fna.fbcdn.net/v/t39.30808-6/431070107_1787882881694665_5444016008094056896_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=_PPFWhNviTgQ7kNvgGfLCQw&_nc_ht=scontent.fktm14-1.fna&oh=00_AfCGPJV_VagH6A-INI5jLLPIjDBSnxlxZu8ejOIOyv8mhg&oe=663D53B9";
String name = "Dharbendra Prasad Yadav";
Widget profilePicture(double radius) {
  return GradientCircle(
    showGradient: true,
    radius: radius,
    child: profileImages != null
        ? AppCacheImageViewer(
            imageUrl: profileImages,
            imageTypeEnum: ImageTypeEnum.network,
          )
        : Builder(
            builder: (context) {
              final userName = name.trim().split(' ');
              final firstName = userName.isNotEmpty ? userName[0] : '';
              final lastName = userName.length > 1 ? userName[1][0] : null;
              return Center(
                child: Text(
                  '${firstName[0]}${lastName ?? ''}',
                  style: AppTextStyles.text12PxSemiBold.copyWith(
                    color: AppColors.softBlack,
                  ),
                ),
              );
            },
          ),
  );
}
