import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:oydeeedashboard/src/core/core.dart';

part 'user_response.g.dart';
part 'user_response.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required String id,
    required String name,
    String? lastName,
    String? profileImage,
    String? email,
    String? phoneNumber,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Widget get profilePicture {
    return GradientCircle(
      showGradient: true,
      radius: 40,
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
}
