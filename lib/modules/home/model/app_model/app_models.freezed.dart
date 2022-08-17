// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return _HomeModel.fromJson(json);
}

/// @nodoc
mixin _$HomeModel {
  String? get app_name => throw _privateConstructorUsedError;
  String? get app_link => throw _privateConstructorUsedError;
  String? get link_image => throw _privateConstructorUsedError;
  String? get app_color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res>;
  $Res call(
      {String? app_name,
      String? app_link,
      String? link_image,
      String? app_color});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res> implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  final HomeModel _value;
  // ignore: unused_field
  final $Res Function(HomeModel) _then;

  @override
  $Res call({
    Object? app_name = freezed,
    Object? app_link = freezed,
    Object? link_image = freezed,
    Object? app_color = freezed,
  }) {
    return _then(_value.copyWith(
      app_name: app_name == freezed
          ? _value.app_name
          : app_name // ignore: cast_nullable_to_non_nullable
              as String?,
      app_link: app_link == freezed
          ? _value.app_link
          : app_link // ignore: cast_nullable_to_non_nullable
              as String?,
      link_image: link_image == freezed
          ? _value.link_image
          : link_image // ignore: cast_nullable_to_non_nullable
              as String?,
      app_color: app_color == freezed
          ? _value.app_color
          : app_color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
  factory _$$_HomeModelCopyWith(
          _$_HomeModel value, $Res Function(_$_HomeModel) then) =
      __$$_HomeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? app_name,
      String? app_link,
      String? link_image,
      String? app_color});
}

/// @nodoc
class __$$_HomeModelCopyWithImpl<$Res> extends _$HomeModelCopyWithImpl<$Res>
    implements _$$_HomeModelCopyWith<$Res> {
  __$$_HomeModelCopyWithImpl(
      _$_HomeModel _value, $Res Function(_$_HomeModel) _then)
      : super(_value, (v) => _then(v as _$_HomeModel));

  @override
  _$_HomeModel get _value => super._value as _$_HomeModel;

  @override
  $Res call({
    Object? app_name = freezed,
    Object? app_link = freezed,
    Object? link_image = freezed,
    Object? app_color = freezed,
  }) {
    return _then(_$_HomeModel(
      app_name: app_name == freezed
          ? _value.app_name
          : app_name // ignore: cast_nullable_to_non_nullable
              as String?,
      app_link: app_link == freezed
          ? _value.app_link
          : app_link // ignore: cast_nullable_to_non_nullable
              as String?,
      link_image: link_image == freezed
          ? _value.link_image
          : link_image // ignore: cast_nullable_to_non_nullable
              as String?,
      app_color: app_color == freezed
          ? _value.app_color
          : app_color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeModel implements _HomeModel {
  _$_HomeModel({this.app_name, this.app_link, this.link_image, this.app_color});

  factory _$_HomeModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomeModelFromJson(json);

  @override
  final String? app_name;
  @override
  final String? app_link;
  @override
  final String? link_image;
  @override
  final String? app_color;

  @override
  String toString() {
    return 'HomeModel(app_name: $app_name, app_link: $app_link, link_image: $link_image, app_color: $app_color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeModel &&
            const DeepCollectionEquality().equals(other.app_name, app_name) &&
            const DeepCollectionEquality().equals(other.app_link, app_link) &&
            const DeepCollectionEquality()
                .equals(other.link_image, link_image) &&
            const DeepCollectionEquality().equals(other.app_color, app_color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(app_name),
      const DeepCollectionEquality().hash(app_link),
      const DeepCollectionEquality().hash(link_image),
      const DeepCollectionEquality().hash(app_color));

  @JsonKey(ignore: true)
  @override
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      __$$_HomeModelCopyWithImpl<_$_HomeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeModelToJson(
      this,
    );
  }
}

abstract class _HomeModel implements HomeModel {
  factory _HomeModel(
      {final String? app_name,
      final String? app_link,
      final String? link_image,
      final String? app_color}) = _$_HomeModel;

  factory _HomeModel.fromJson(Map<String, dynamic> json) =
      _$_HomeModel.fromJson;

  @override
  String? get app_name;
  @override
  String? get app_link;
  @override
  String? get link_image;
  @override
  String? get app_color;
  @override
  @JsonKey(ignore: true)
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
