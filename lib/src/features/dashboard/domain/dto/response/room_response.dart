import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../dashboard.dart';

part 'room_response.g.dart';
part 'room_response.freezed.dart';

@freezed
class RoomResponse with _$RoomResponse {
  const factory RoomResponse({
    required String id,
    required String name,
    required String location,
    required int price,
    @Default(RoomStatusEnum.available) RoomStatusEnum roomStatus,
    required String currency,
    @Default(RoomPaymentTypeEnum.monthly) RoomPaymentTypeEnum paymentType,
    @Default(RentTypeEnum.week) RentTypeEnum rentType,
    required String image,
  }) = _RoomResponse;

  factory RoomResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomResponseFromJson(json);
}
