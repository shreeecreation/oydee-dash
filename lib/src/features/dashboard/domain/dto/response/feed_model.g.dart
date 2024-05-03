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
          FeedType.post,
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String,
      commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
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
    };

const _$FeedTypeEnumMap = {
  FeedType.post: 'post',
  FeedType.room: 'room',
  FeedType.job: 'job',
  FeedType.ads: 'ads',
};
