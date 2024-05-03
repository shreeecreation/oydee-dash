
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../enum/feed_type_enum.dart';
import '../request/image_model.dart';
import '../../../../auth/domain/dto/response/user_response.dart';

part 'feed_model.g.dart';
part 'feed_model.freezed.dart';

@freezed
class FeedModel with _$FeedModel {
  const factory FeedModel({
    required String id,
    required UserModel user,
    @Default(FeedType.post) FeedType postType,
    String? description,
    @Default([]) List<ImageModel> images,
    required String createdAt,
    @Default(0) int commentCount,
  }) = _FeedModel;
  factory FeedModel.fromJson(Map<String, dynamic> json) => _$FeedModelFromJson(json);
}
