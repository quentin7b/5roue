// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_session.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameSession _$GameSessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$GameSession {
  String get id => throw _privateConstructorUsedError;
  Game? get game => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'search_player_max_count')
  int get maxPlayersCount =>
      throw _privateConstructorUsedError; // Session is full or not
  bool get isOpen =>
      throw _privateConstructorUsedError; // User keep the session running
  bool get isActive => throw _privateConstructorUsedError; // Criterias
  List<Language> get languagesCriteria => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameSessionCopyWith<GameSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSessionCopyWith<$Res> {
  factory $GameSessionCopyWith(
          GameSession value, $Res Function(GameSession) then) =
      _$GameSessionCopyWithImpl<$Res, GameSession>;
  @useResult
  $Res call(
      {String id,
      Game? game,
      String ownerId,
      @JsonKey(name: 'search_player_max_count') int maxPlayersCount,
      bool isOpen,
      bool isActive,
      List<Language> languagesCriteria});

  $GameCopyWith<$Res>? get game;
}

/// @nodoc
class _$GameSessionCopyWithImpl<$Res, $Val extends GameSession>
    implements $GameSessionCopyWith<$Res> {
  _$GameSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? game = freezed,
    Object? ownerId = null,
    Object? maxPlayersCount = null,
    Object? isOpen = null,
    Object? isActive = null,
    Object? languagesCriteria = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      game: freezed == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      maxPlayersCount: null == maxPlayersCount
          ? _value.maxPlayersCount
          : maxPlayersCount // ignore: cast_nullable_to_non_nullable
              as int,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      languagesCriteria: null == languagesCriteria
          ? _value.languagesCriteria
          : languagesCriteria // ignore: cast_nullable_to_non_nullable
              as List<Language>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameCopyWith<$Res>? get game {
    if (_value.game == null) {
      return null;
    }

    return $GameCopyWith<$Res>(_value.game!, (value) {
      return _then(_value.copyWith(game: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res>
    implements $GameSessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Game? game,
      String ownerId,
      @JsonKey(name: 'search_player_max_count') int maxPlayersCount,
      bool isOpen,
      bool isActive,
      List<Language> languagesCriteria});

  @override
  $GameCopyWith<$Res>? get game;
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$GameSessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? game = freezed,
    Object? ownerId = null,
    Object? maxPlayersCount = null,
    Object? isOpen = null,
    Object? isActive = null,
    Object? languagesCriteria = null,
  }) {
    return _then(_$SessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      game: freezed == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      maxPlayersCount: null == maxPlayersCount
          ? _value.maxPlayersCount
          : maxPlayersCount // ignore: cast_nullable_to_non_nullable
              as int,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      languagesCriteria: null == languagesCriteria
          ? _value._languagesCriteria
          : languagesCriteria // ignore: cast_nullable_to_non_nullable
              as List<Language>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SessionImpl implements _Session {
  const _$SessionImpl(
      {required this.id,
      this.game,
      required this.ownerId,
      @JsonKey(name: 'search_player_max_count') required this.maxPlayersCount,
      this.isOpen = true,
      this.isActive = true,
      final List<Language> languagesCriteria = const []})
      : _languagesCriteria = languagesCriteria;

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  final String id;
  @override
  final Game? game;
  @override
  final String ownerId;
  @override
  @JsonKey(name: 'search_player_max_count')
  final int maxPlayersCount;
// Session is full or not
  @override
  @JsonKey()
  final bool isOpen;
// User keep the session running
  @override
  @JsonKey()
  final bool isActive;
// Criterias
  final List<Language> _languagesCriteria;
// Criterias
  @override
  @JsonKey()
  List<Language> get languagesCriteria {
    if (_languagesCriteria is EqualUnmodifiableListView)
      return _languagesCriteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languagesCriteria);
  }

  @override
  String toString() {
    return 'GameSession(id: $id, game: $game, ownerId: $ownerId, maxPlayersCount: $maxPlayersCount, isOpen: $isOpen, isActive: $isActive, languagesCriteria: $languagesCriteria)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.game, game) || other.game == game) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.maxPlayersCount, maxPlayersCount) ||
                other.maxPlayersCount == maxPlayersCount) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._languagesCriteria, _languagesCriteria));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      game,
      ownerId,
      maxPlayersCount,
      isOpen,
      isActive,
      const DeepCollectionEquality().hash(_languagesCriteria));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(
      this,
    );
  }
}

abstract class _Session implements GameSession {
  const factory _Session(
      {required final String id,
      final Game? game,
      required final String ownerId,
      @JsonKey(name: 'search_player_max_count')
      required final int maxPlayersCount,
      final bool isOpen,
      final bool isActive,
      final List<Language> languagesCriteria}) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  String get id;
  @override
  Game? get game;
  @override
  String get ownerId;
  @override
  @JsonKey(name: 'search_player_max_count')
  int get maxPlayersCount;
  @override // Session is full or not
  bool get isOpen;
  @override // User keep the session running
  bool get isActive;
  @override // Criterias
  List<Language> get languagesCriteria;
  @override
  @JsonKey(ignore: true)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
