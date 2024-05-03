import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oydeeedashboard/src/core/core.dart';
part 'get_job_response.freezed.dart';
part 'get_job_response.g.dart';

@freezed
class GetJobModel with _$GetJobModel {
  const GetJobModel._();
  const factory GetJobModel(
      {required String id,
      required String title,
      required String company,
      required String location,
      required String salaryRange,
      required String postedOn,
      required String employementType,
      required String workspace,
      required List<String> tags}) = _GetJobModel;

  factory GetJobModel.fromJson(Map<String, dynamic> json) =>
      _$GetJobModelFromJson(json);

  // company profile
  Widget get companyProfile => Row(
        children: [
          const Icon(Icons.circle, color: Colors.green, size: 10),
          5.horizontalSpace,
          Text(
            company,
            style: AppTextStyles.text12PxMedium,
          ),
        ],
      );
}
