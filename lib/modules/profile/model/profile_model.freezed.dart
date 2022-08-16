// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  String? get last_name => throw _privateConstructorUsedError;
  String? get first_name => throw _privateConstructorUsedError;
  String? get emaill => throw _privateConstructorUsedError;
  String? get image_profile => throw _privateConstructorUsedError;
  String? get pincode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res>;
  $Res call(
      {String? last_name,
      String? first_name,
      String? emaill,
      String? image_profile,
      String? pincode});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res> implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  final ProfileModel _value;
  // ignore: unused_field
  final $Res Function(ProfileModel) _then;

  @override
  $Res call({
    Object? last_name = freezed,
    Object? first_name = freezed,
    Object? emaill = freezed,
    Object? image_profile = freezed,
    Object? pincode = freezed,
  }) {
    return _then(_value.copyWith(
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String?,
      emaill: emaill == freezed
          ? _value.emaill
          : emaill // ignore: cast_nullable_to_non_nullable
              as String?,
      image_profile: image_profile == freezed
          ? _value.image_profile
          : image_profile // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: pincode == freezed
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$_ProfileModelCopyWith(
          _$_ProfileModel value, $Res Function(_$_ProfileModel) then) =
      __$$_ProfileModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? last_name,
      String? first_name,
      String? emaill,
      String? image_profile,
      String? pincode});
}

/// @nodoc
class __$$_ProfileModelCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res>
    implements _$$_ProfileModelCopyWith<$Res> {
  __$$_ProfileModelCopyWithImpl(
      _$_ProfileModel _value, $Res Function(_$_ProfileModel) _then)
      : super(_value, (v) => _then(v as _$_ProfileModel));

  @override
  _$_ProfileModel get _value => super._value as _$_ProfileModel;

  @override
  $Res call({
    Object? last_name = freezed,
    Object? first_name = freezed,
    Object? emaill = freezed,
    Object? image_profile = freezed,
    Object? pincode = freezed,
  }) {
    return _then(_$_ProfileModel(
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String?,
      emaill: emaill == freezed
          ? _value.emaill
          : emaill // ignore: cast_nullable_to_non_nullable
              as String?,
      image_profile: image_profile == freezed
          ? _value.image_profile
          : image_profile // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: pincode == freezed
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileModel implements _ProfileModel {
  _$_ProfileModel(
      {this.last_name,
      this.first_name,
      this.emaill,
      this.image_profile,
      this.pincode});

  factory _$_ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileModelFromJson(json);

  @override
  final String? last_name;
  @override
  final String? first_name;
  @override
  final String? emaill;
  @override
  final String? image_profile;
  @override
  final String? pincode;

  @override
  String toString() {
    return 'ProfileModel(last_name: $last_name, first_name: $first_name, emaill: $emaill, image_profile: $image_profile, pincode: $pincode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileModel &&
            const DeepCollectionEquality().equals(other.last_name, last_name) &&
            const DeepCollectionEquality()
                .equals(other.first_name, first_name) &&
            const DeepCollectionEquality().equals(other.emaill, emaill) &&
            const DeepCollectionEquality()
                .equals(other.image_profile, image_profile) &&
            const DeepCollectionEquality().equals(other.pincode, pincode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(last_name),
      const DeepCollectionEquality().hash(first_name),
      const DeepCollectionEquality().hash(emaill),
      const DeepCollectionEquality().hash(image_profile),
      const DeepCollectionEquality().hash(pincode));

  @JsonKey(ignore: true)
  @override
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      __$$_ProfileModelCopyWithImpl<_$_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileModelToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  factory _ProfileModel(
      {final String? last_name,
      final String? first_name,
      final String? emaill,
      final String? image_profile,
      final String? pincode}) = _$_ProfileModel;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileModel.fromJson;

  @override
  String? get last_name;
  @override
  String? get first_name;
  @override
  String? get emaill;
  @override
  String? get image_profile;
  @override
  String? get pincode;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
