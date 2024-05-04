// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationModelImpl _$$PaginationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationModelImpl(
      totalItems: (json['totalItems'] as num).toInt(),
      page: (json['page'] as num?)?.toInt(),
      hasNextPage: json['hasNextPage'] as bool,
    );

Map<String, dynamic> _$$PaginationModelImplToJson(
        _$PaginationModelImpl instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'page': instance.page,
      'hasNextPage': instance.hasNextPage,
    };
