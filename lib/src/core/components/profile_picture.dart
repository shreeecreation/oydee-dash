import 'package:flutter/material.dart';
import 'package:oydeeedashboard/src/core/core.dart';

String profileImage =
    "https://scontent.fktm14-1.fna.fbcdn.net/v/t39.30808-6/431070107_1787882881694665_5444016008094056896_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Kr30rP-u1iIQ7kNvgG1hees&_nc_ht=scontent.fktm14-1.fna&oh=00_AfCR4G6NIEKqyvQPVcEHO6c6qG8wQEjvx5xih7XkT4B5cA&oe=6636BC39";
String name = "Dharbendra Prasad Yadav";
Widget profilePicture(double radius ) {
  return GradientCircle(
    showGradient: true,
    radius: radius,
    child: profileImage != null
        ? AppCacheImageViewer(
            imageUrl: profileImage!,
            imageTypeEnum: ImageTypeEnum.network,
          )
        : Builder(
            builder: (context) {
              final userName = name.trim().split(' ');
              final firstName = userName.length > 0 ? userName[0] : '';
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
