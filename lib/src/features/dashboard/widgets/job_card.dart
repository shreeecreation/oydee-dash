import 'package:flutter/material.dart';
import 'package:oydeeedashboard/src/core/core.dart';

import '../dashboard.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.jobModel, required this.onTap});

  final GetJobModel jobModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.textLight.withOpacity(.5),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withAlpha(10),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              10.verticalSpace,
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AppCacheImageViewer(
                    imageUrl: "",
                    imageTypeEnum: ImageTypeEnum.assets,
                  ),
                ),
                title: Text(
                  jobModel.title,
                  overflow: TextOverflow.clip,
                  style: AppTextStyles.text18PxBold,
                  maxLines: 2,
                ),
                subtitle: Text(
                  jobModel.location,
                  overflow: TextOverflow.clip,
                  style: AppTextStyles.text12Px,
                  maxLines: 2,
                ),
              ),
              4.verticalSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    4.horizontalSpace,
                    Tag(title: '\$${jobModel.salaryRange}'),
                    4.horizontalSpace,
                    Tag(title: jobModel.workspace),
                    4.horizontalSpace,
                    Tag(title: jobModel.employementType),
                    4.horizontalSpace,
                  ],
                ),
              ),
              13.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
