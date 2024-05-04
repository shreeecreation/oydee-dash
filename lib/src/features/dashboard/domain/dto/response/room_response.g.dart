// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomResponseImpl _$$RoomResponseImplFromJson(Map<String, dynamic> json) =>
    _$RoomResponseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      price: (json['price'] as num).toInt(),
      roomStatus:
          $enumDecodeNullable(_$RoomStatusEnumEnumMap, json['roomStatus']) ??
              RoomStatusEnum.available,
      currency: json['currency'] as String,
      paymentType: $enumDecodeNullable(
              _$RoomPaymentTypeEnumEnumMap, json['paymentType']) ??
          RoomPaymentTypeEnum.monthly,
      rentType: $enumDecodeNullable(_$RentTypeEnumEnumMap, json['rentType']) ??
          RentTypeEnum.week,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$RoomResponseImplToJson(_$RoomResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'price': instance.price,
      'roomStatus': _$RoomStatusEnumEnumMap[instance.roomStatus]!,
      'currency': instance.currency,
      'paymentType': _$RoomPaymentTypeEnumEnumMap[instance.paymentType]!,
      'rentType': _$RentTypeEnumEnumMap[instance.rentType]!,
      'image': instance.image,
    };

const _$RoomStatusEnumEnumMap = {
  RoomStatusEnum.available: 'available',
  RoomStatusEnum.notavailable: 'notavailable',
  RoomStatusEnum.booked: 'booked',
  RoomStatusEnum.deleted: 'deleted',
  RoomStatusEnum.interview: 'interview',
};

const _$RoomPaymentTypeEnumEnumMap = {
  RoomPaymentTypeEnum.monthly: 'monthly',
  RoomPaymentTypeEnum.weekly: 'weekly',
};

const _$RentTypeEnumEnumMap = {
  RentTypeEnum.week: 'week',
  RentTypeEnum.monthly: 'monthly',
};
