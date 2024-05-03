// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_job_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetJobModel _$GetJobModelFromJson(Map<String, dynamic> json) {
  return _GetJobModel.fromJson(json);
}

/// @nodoc
mixin _$GetJobModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get salaryRange => throw _privateConstructorUsedError;
  String get postedOn => throw _privateConstructorUsedError;
  String get employementType => throw _privateConstructorUsedError;
  String get workspace => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetJobModelCopyWith<GetJobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetJobModelCopyWith<$Res> {
  factory $GetJobModelCopyWith(
          GetJobModel value, $Res Function(GetJobModel) then) =
      _$GetJobModelCopyWithImpl<$Res, GetJobModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String company,
      String location,
      String salaryRange,
      String postedOn,
      String employementType,
      String workspace,
      List<String> tags});
}

/// @nodoc
class _$GetJobModelCopyWithImpl<$Res, $Val extends GetJobModel>
    implements $GetJobModelCopyWith<$Res> {
  _$GetJobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? company = null,
    Object? location = null,
    Object? salaryRange = null,
    Object? postedOn = null,
    Object? employementType = null,
    Object? workspace = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      salaryRange: null == salaryRange
          ? _value.salaryRange
          : salaryRange // ignore: cast_nullable_to_non_nullable
              as String,
      postedOn: null == postedOn
          ? _value.postedOn
          : postedOn // ignore: cast_nullable_to_non_nullable
              as String,
      employementType: null == employementType
          ? _value.employementType
          : employementType // ignore: cast_nullable_to_non_nullable
              as String,
      workspace: null == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetJobModelImplCopyWith<$Res>
    implements $GetJobModelCopyWith<$Res> {
  factory _$$GetJobModelImplCopyWith(
          _$GetJobModelImpl value, $Res Function(_$GetJobModelImpl) then) =
      __$$GetJobModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String company,
      String location,
      String salaryRange,
      String postedOn,
      String employementType,
      String workspace,
      List<String> tags});
}

/// @nodoc
class __$$GetJobModelImplCopyWithImpl<$Res>
    extends _$GetJobModelCopyWithImpl<$Res, _$GetJobModelImpl>
    implements _$$GetJobModelImplCopyWith<$Res> {
  __$$GetJobModelImplCopyWithImpl(
      _$GetJobModelImpl _value, $Res Function(_$GetJobModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? company = null,
    Object? location = null,
    Object? salaryRange = null,
    Object? postedOn = null,
    Object? employementType = null,
    Object? workspace = null,
    Object? tags = null,
  }) {
    return _then(_$GetJobModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      salaryRange: null == salaryRange
          ? _value.salaryRange
          : salaryRange // ignore: cast_nullable_to_non_nullable
              as String,
      postedOn: null == postedOn
          ? _value.postedOn
          : postedOn // ignore: cast_nullable_to_non_nullable
              as String,
      employementType: null == employementType
          ? _value.employementType
          : employementType // ignore: cast_nullable_to_non_nullable
              as String,
      workspace: null == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetJobModelImpl extends _GetJobModel {
  const _$GetJobModelImpl(
      {required this.id,
      required this.title,
      required this.company,
      required this.location,
      required this.salaryRange,
      required this.postedOn,
      required this.employementType,
      required this.workspace,
      required final List<String> tags})
      : _tags = tags,
        super._();

  factory _$GetJobModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetJobModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String company;
  @override
  final String location;
  @override
  final String salaryRange;
  @override
  final String postedOn;
  @override
  final String employementType;
  @override
  final String workspace;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'GetJobModel(id: $id, title: $title, company: $company, location: $location, salaryRange: $salaryRange, postedOn: $postedOn, employementType: $employementType, workspace: $workspace, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetJobModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.salaryRange, salaryRange) ||
                other.salaryRange == salaryRange) &&
            (identical(other.postedOn, postedOn) ||
                other.postedOn == postedOn) &&
            (identical(other.employementType, employementType) ||
                other.employementType == employementType) &&
            (identical(other.workspace, workspace) ||
                other.workspace == workspace) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      company,
      location,
      salaryRange,
      postedOn,
      employementType,
      workspace,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetJobModelImplCopyWith<_$GetJobModelImpl> get copyWith =>
      __$$GetJobModelImplCopyWithImpl<_$GetJobModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetJobModelImplToJson(
      this,
    );
  }
}

abstract class _GetJobModel extends GetJobModel {
  const factory _GetJobModel(
      {required final String id,
      required final String title,
      required final String company,
      required final String location,
      required final String salaryRange,
      required final String postedOn,
      required final String employementType,
      required final String workspace,
      required final List<String> tags}) = _$GetJobModelImpl;
  const _GetJobModel._() : super._();

  factory _GetJobModel.fromJson(Map<String, dynamic> json) =
      _$GetJobModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get company;
  @override
  String get location;
  @override
  String get salaryRange;
  @override
  String get postedOn;
  @override
  String get employementType;
  @override
  String get workspace;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$GetJobModelImplCopyWith<_$GetJobModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
