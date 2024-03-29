// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_level.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameLevel _$GameLevelFromJson(Map<String, dynamic> json) {
  return _GameLevel.fromJson(json);
}

/// @nodoc
mixin _$GameLevel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'game_order')
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameLevelCopyWith<GameLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameLevelCopyWith<$Res> {
  factory $GameLevelCopyWith(GameLevel value, $Res Function(GameLevel) then) =
      _$GameLevelCopyWithImpl<$Res, GameLevel>;
  @useResult
  $Res call({String id, String name, @JsonKey(name: 'game_order') int order});
}

/// @nodoc
class _$GameLevelCopyWithImpl<$Res, $Val extends GameLevel>
    implements $GameLevelCopyWith<$Res> {
  _$GameLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? order = null,
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
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameLevelImplCopyWith<$Res>
    implements $GameLevelCopyWith<$Res> {
  factory _$$GameLevelImplCopyWith(
          _$GameLevelImpl value, $Res Function(_$GameLevelImpl) then) =
      __$$GameLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, @JsonKey(name: 'game_order') int order});
}

/// @nodoc
class __$$GameLevelImplCopyWithImpl<$Res>
    extends _$GameLevelCopyWithImpl<$Res, _$GameLevelImpl>
    implements _$$GameLevelImplCopyWith<$Res> {
  __$$GameLevelImplCopyWithImpl(
      _$GameLevelImpl _value, $Res Function(_$GameLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? order = null,
  }) {
    return _then(_$GameLevelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$GameLevelImpl implements _GameLevel {
  const _$GameLevelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'game_order') required this.order});

  factory _$GameLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameLevelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'game_order')
  final int order;

  @override
  String toString() {
    return 'GameLevel(id: $id, name: $name, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameLevelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameLevelImplCopyWith<_$GameLevelImpl> get copyWith =>
      __$$GameLevelImplCopyWithImpl<_$GameLevelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameLevelImplToJson(
      this,
    );
  }
}

abstract class _GameLevel implements GameLevel {
  const factory _GameLevel(
      {required final String id,
      required final String name,
      @JsonKey(name: 'game_order') required final int order}) = _$GameLevelImpl;

  factory _GameLevel.fromJson(Map<String, dynamic> json) =
      _$GameLevelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'game_order')
  int get order;
  @override
  @JsonKey(ignore: true)
  _$$GameLevelImplCopyWith<_$GameLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
