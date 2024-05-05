// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedModelImpl _$$FeedModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedModelImpl(
      id: json['id'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      postType: $enumDecodeNullable(_$FeedTypeEnumMap, json['postType']) ??
          FeedType.POST,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String,
      commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
      room: json['room'] == null
          ? null
          : RoomResponse.fromJson(json['room'] as Map<String, dynamic>),
      job: json['job'] == null
          ? null
          : GetJobModel.fromJson(json['job'] as Map<String, dynamic>),
      like: (json['like'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FeedModelImplToJson(_$FeedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'postType': _$FeedTypeEnumMap[instance.postType]!,
      'description': instance.description,
      'images': instance.images,
      'createdAt': instance.createdAt,
      'commentCount': instance.commentCount,
      'room': instance.room,
      'job': instance.job,
      'like': instance.like,
    };

const _$FeedTypeEnumMap = {
  FeedType.POST: 'POST',
  FeedType.ROOM: 'ROOM',
  FeedType.JOB: 'JOB',
  FeedType.ADS: 'ADS',
};
