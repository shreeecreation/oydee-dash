// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomResponse _$RoomResponseFromJson(Map<String, dynamic> json) {
  return _RoomResponse.fromJson(json);
}

/// @nodoc
mixin _$RoomResponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  RoomStatusEnum get roomStatus => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  RoomPaymentTypeEnum get paymentType => throw _privateConstructorUsedError;
  RentTypeEnum get rentType => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomResponseCopyWith<RoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomResponseCopyWith<$Res> {
  factory $RoomResponseCopyWith(
          RoomResponse value, $Res Function(RoomResponse) then) =
      _$RoomResponseCopyWithImpl<$Res, RoomResponse>;
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      int price,
      RoomStatusEnum roomStatus,
      String currency,
      RoomPaymentTypeEnum paymentType,
      RentTypeEnum rentType,
      String image});
}

/// @nodoc
class _$RoomResponseCopyWithImpl<$Res, $Val extends RoomResponse>
    implements $RoomResponseCopyWith<$Res> {
  _$RoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? price = null,
    Object? roomStatus = null,
    Object? currency = null,
    Object? paymentType = null,
    Object? rentType = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      roomStatus: null == roomStatus
          ? _value.roomStatus
          : roomStatus // ignore: cast_nullable_to_non_nullable
              as RoomStatusEnum,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as RoomPaymentTypeEnum,
      rentType: null == rentType
          ? _value.rentType
          : rentType // ignore: cast_nullable_to_non_nullable
              as RentTypeEnum,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomResponseImplCopyWith<$Res>
    implements $RoomResponseCopyWith<$Res> {
  factory _$$RoomResponseImplCopyWith(
          _$RoomResponseImpl value, $Res Function(_$RoomResponseImpl) then) =
      __$$RoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      int price,
      RoomStatusEnum roomStatus,
      String currency,
      RoomPaymentTypeEnum paymentType,
      RentTypeEnum rentType,
      String image});
}

/// @nodoc
class __$$RoomResponseImplCopyWithImpl<$Res>
    extends _$RoomResponseCopyWithImpl<$Res, _$RoomResponseImpl>
    implements _$$RoomResponseImplCopyWith<$Res> {
  __$$RoomResponseImplCopyWithImpl(
      _$RoomResponseImpl _value, $Res Function(_$RoomResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? price = null,
    Object? roomStatus = null,
    Object? currency = null,
    Object? paymentType = null,
    Object? rentType = null,
    Object? image = null,
  }) {
    return _then(_$RoomResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      roomStatus: null == roomStatus
          ? _value.roomStatus
          : roomStatus // ignore: cast_nullable_to_non_nullable
              as RoomStatusEnum,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as RoomPaymentTypeEnum,
      rentType: null == rentType
          ? _value.rentType
          : rentType // ignore: cast_nullable_to_non_nullable
              as RentTypeEnum,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomResponseImpl implements _RoomResponse {
  const _$RoomResponseImpl(
      {required this.id,
      required this.name,
      required this.location,
      required this.price,
      this.roomStatus = RoomStatusEnum.available,
      required this.currency,
      this.paymentType = RoomPaymentTypeEnum.monthly,
      this.rentType = RentTypeEnum.week,
      required this.image});

  factory _$RoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String location;
  @override
  final int price;
  @override
  @JsonKey()
  final RoomStatusEnum roomStatus;
  @override
  final String currency;
  @override
  @JsonKey()
  final RoomPaymentTypeEnum paymentType;
  @override
  @JsonKey()
  final RentTypeEnum rentType;
  @override
  final String image;

  @override
  String toString() {
    return 'RoomResponse(id: $id, name: $name, location: $location, price: $price, roomStatus: $roomStatus, currency: $currency, paymentType: $paymentType, rentType: $rentType, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.roomStatus, roomStatus) ||
                other.roomStatus == roomStatus) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.rentType, rentType) ||
                other.rentType == rentType) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location, price,
      roomStatus, currency, paymentType, rentType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomResponseImplCopyWith<_$RoomResponseImpl> get copyWith =>
      __$$RoomResponseImplCopyWithImpl<_$RoomResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomResponseImplToJson(
      this,
    );
  }
}

abstract class _RoomResponse implements RoomResponse {
  const factory _RoomResponse(
      {required final String id,
      required final String name,
      required final String location,
      required final int price,
      final RoomStatusEnum roomStatus,
      required final String currency,
      final RoomPaymentTypeEnum paymentType,
      final RentTypeEnum rentType,
      required final String image}) = _$RoomResponseImpl;

  factory _RoomResponse.fromJson(Map<String, dynamic> json) =
      _$RoomResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get location;
  @override
  int get price;
  @override
  RoomStatusEnum get roomStatus;
  @override
  String get currency;
  @override
  RoomPaymentTypeEnum get paymentType;
  @override
  RentTypeEnum get rentType;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$RoomResponseImplCopyWith<_$RoomResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
