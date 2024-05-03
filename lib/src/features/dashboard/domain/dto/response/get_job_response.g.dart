// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_job_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetJobModelImpl _$$GetJobModelImplFromJson(Map<String, dynamic> json) =>
    _$GetJobModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      salaryRange: json['salaryRange'] as String,
      postedOn: json['postedOn'] as String,
      employementType: json['employementType'] as String,
      workspace: json['workspace'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$GetJobModelImplToJson(_$GetJobModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'company': instance.company,
      'location': instance.location,
      'salaryRange': instance.salaryRange,
      'postedOn': instance.postedOn,
      'employementType': instance.employementType,
      'workspace': instance.workspace,
      'tags': instance.tags,
    };
