// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_game.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserGame _$UserGameFromJson(Map<String, dynamic> json) {
  return _UserGame.fromJson(json);
}

/// @nodoc
mixin _$UserGame {
  String get id => throw _privateConstructorUsedError;
  String get gameId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  Platform get platform => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserGameCopyWith<UserGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGameCopyWith<$Res> {
  factory $UserGameCopyWith(UserGame value, $Res Function(UserGame) then) =
      _$UserGameCopyWithImpl<$Res, UserGame>;
  @useResult
  $Res call({String id, String gameId, String userId, Platform platform});
}

/// @nodoc
class _$UserGameCopyWithImpl<$Res, $Val extends UserGame>
    implements $UserGameCopyWith<$Res> {
  _$UserGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameId = null,
    Object? userId = null,
    Object? platform = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserGameImplCopyWith<$Res>
    implements $UserGameCopyWith<$Res> {
  factory _$$UserGameImplCopyWith(
          _$UserGameImpl value, $Res Function(_$UserGameImpl) then) =
      __$$UserGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String gameId, String userId, Platform platform});
}

/// @nodoc
class __$$UserGameImplCopyWithImpl<$Res>
    extends _$UserGameCopyWithImpl<$Res, _$UserGameImpl>
    implements _$$UserGameImplCopyWith<$Res> {
  __$$UserGameImplCopyWithImpl(
      _$UserGameImpl _value, $Res Function(_$UserGameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameId = null,
    Object? userId = null,
    Object? platform = null,
  }) {
    return _then(_$UserGameImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserGameImpl implements _UserGame {
  const _$UserGameImpl(
      {required this.id,
      required this.gameId,
      required this.userId,
      required this.platform});

  factory _$UserGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGameImplFromJson(json);

  @override
  final String id;
  @override
  final String gameId;
  @override
  final String userId;
  @override
  final Platform platform;

  @override
  String toString() {
    return 'UserGame(id: $id, gameId: $gameId, userId: $userId, platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, gameId, userId, platform);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGameImplCopyWith<_$UserGameImpl> get copyWith =>
      __$$UserGameImplCopyWithImpl<_$UserGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGameImplToJson(
      this,
    );
  }
}

abstract class _UserGame implements UserGame {
  const factory _UserGame(
      {required final String id,
      required final String gameId,
      required final String userId,
      required final Platform platform}) = _$UserGameImpl;

  factory _UserGame.fromJson(Map<String, dynamic> json) =
      _$UserGameImpl.fromJson;

  @override
  String get id;
  @override
  String get gameId;
  @override
  String get userId;
  @override
  Platform get platform;
  @override
  @JsonKey(ignore: true)
  _$$UserGameImplCopyWith<_$UserGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
