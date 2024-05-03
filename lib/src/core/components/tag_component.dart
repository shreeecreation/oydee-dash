import 'package:flutter/material.dart';
import 'package:oydeeedashboard/src/core/core.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(this.title, style: AppTextStyles.text12PxSemiBold),
      backgroundColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      side: const BorderSide(
        color: AppColors.textLight,
        width: 1,
      ),
      surfaceTintColor: AppColors.transparent,
      // labelPadding: const EdgeInsets.,
      autofocus: true,
      elevation: 0,
      shadowColor: AppColors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
    );
  }
}
