// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get pictureUrl => throw _privateConstructorUsedError;
  bool get isCrossPlatform => throw _privateConstructorUsedError;
  int get maxCoopPlayers =>
      throw _privateConstructorUsedError; // App specific fields
  bool get isFavorite => throw _privateConstructorUsedError;
  List<Platform> get platforms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {String id,
      String name,
      String pictureUrl,
      bool isCrossPlatform,
      int maxCoopPlayers,
      bool isFavorite,
      List<Platform> platforms});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pictureUrl = null,
    Object? isCrossPlatform = null,
    Object? maxCoopPlayers = null,
    Object? isFavorite = null,
    Object? platforms = null,
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
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isCrossPlatform: null == isCrossPlatform
          ? _value.isCrossPlatform
          : isCrossPlatform // ignore: cast_nullable_to_non_nullable
              as bool,
      maxCoopPlayers: null == maxCoopPlayers
          ? _value.maxCoopPlayers
          : maxCoopPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      platforms: null == platforms
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<Platform>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String pictureUrl,
      bool isCrossPlatform,
      int maxCoopPlayers,
      bool isFavorite,
      List<Platform> platforms});
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pictureUrl = null,
    Object? isCrossPlatform = null,
    Object? maxCoopPlayers = null,
    Object? isFavorite = null,
    Object? platforms = null,
  }) {
    return _then(_$GameImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isCrossPlatform: null == isCrossPlatform
          ? _value.isCrossPlatform
          : isCrossPlatform // ignore: cast_nullable_to_non_nullable
              as bool,
      maxCoopPlayers: null == maxCoopPlayers
          ? _value.maxCoopPlayers
          : maxCoopPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      platforms: null == platforms
          ? _value._platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<Platform>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$GameImpl implements _Game {
  const _$GameImpl(
      {required this.id,
      required this.name,
      required this.pictureUrl,
      required this.isCrossPlatform,
      required this.maxCoopPlayers,
      this.isFavorite = false,
      final List<Platform> platforms = const []})
      : _platforms = platforms;

  factory _$GameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String pictureUrl;
  @override
  final bool isCrossPlatform;
  @override
  final int maxCoopPlayers;
// App specific fields
  @override
  @JsonKey()
  final bool isFavorite;
  final List<Platform> _platforms;
  @override
  @JsonKey()
  List<Platform> get platforms {
    if (_platforms is EqualUnmodifiableListView) return _platforms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_platforms);
  }

  @override
  String toString() {
    return 'Game(id: $id, name: $name, pictureUrl: $pictureUrl, isCrossPlatform: $isCrossPlatform, maxCoopPlayers: $maxCoopPlayers, isFavorite: $isFavorite, platforms: $platforms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.isCrossPlatform, isCrossPlatform) ||
                other.isCrossPlatform == isCrossPlatform) &&
            (identical(other.maxCoopPlayers, maxCoopPlayers) ||
                other.maxCoopPlayers == maxCoopPlayers) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            const DeepCollectionEquality()
                .equals(other._platforms, _platforms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      pictureUrl,
      isCrossPlatform,
      maxCoopPlayers,
      isFavorite,
      const DeepCollectionEquality().hash(_platforms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameImplToJson(
      this,
    );
  }
}

abstract class _Game implements Game {
  const factory _Game(
      {required final String id,
      required final String name,
      required final String pictureUrl,
      required final bool isCrossPlatform,
      required final int maxCoopPlayers,
      final bool isFavorite,
      final List<Platform> platforms}) = _$GameImpl;

  factory _Game.fromJson(Map<String, dynamic> json) = _$GameImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get pictureUrl;
  @override
  bool get isCrossPlatform;
  @override
  int get maxCoopPlayers;
  @override // App specific fields
  bool get isFavorite;
  @override
  List<Platform> get platforms;
  @override
  @JsonKey(ignore: true)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
