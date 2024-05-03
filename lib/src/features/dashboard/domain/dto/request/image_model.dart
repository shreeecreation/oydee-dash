import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.g.dart';
part 'image_model.freezed.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel(
      {required String id,
      required String url,
      required String type}) = _ImageModel;
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
