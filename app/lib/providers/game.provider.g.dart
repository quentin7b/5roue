// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameInfoHash() => r'12b82e6c8803b7d6ff447593009f09c46fc4d921';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$GameInfo extends BuildlessAutoDisposeAsyncNotifier<Game> {
  late final String gameId;
  late final Game? initialValue;

  FutureOr<Game> build({
    required String gameId,
    Game? initialValue,
  });
}

/// See also [GameInfo].
@ProviderFor(GameInfo)
const gameInfoProvider = GameInfoFamily();

/// See also [GameInfo].
class GameInfoFamily extends Family<AsyncValue<Game>> {
  /// See also [GameInfo].
  const GameInfoFamily();

  /// See also [GameInfo].
  GameInfoProvider call({
    required String gameId,
    Game? initialValue,
  }) {
    return GameInfoProvider(
      gameId: gameId,
      initialValue: initialValue,
    );
  }

  @override
  GameInfoProvider getProviderOverride(
    covariant GameInfoProvider provider,
  ) {
    return call(
      gameId: provider.gameId,
      initialValue: provider.initialValue,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gameInfoProvider';
}

/// See also [GameInfo].
class GameInfoProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GameInfo, Game> {
  /// See also [GameInfo].
  GameInfoProvider({
    required String gameId,
    Game? initialValue,
  }) : this._internal(
          () => GameInfo()
            ..gameId = gameId
            ..initialValue = initialValue,
          from: gameInfoProvider,
          name: r'gameInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameInfoHash,
          dependencies: GameInfoFamily._dependencies,
          allTransitiveDependencies: GameInfoFamily._allTransitiveDependencies,
          gameId: gameId,
          initialValue: initialValue,
        );

  GameInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gameId,
    required this.initialValue,
  }) : super.internal();

  final String gameId;
  final Game? initialValue;

  @override
  FutureOr<Game> runNotifierBuild(
    covariant GameInfo notifier,
  ) {
    return notifier.build(
      gameId: gameId,
      initialValue: initialValue,
    );
  }

  @override
  Override overrideWith(GameInfo Function() create) {
    return ProviderOverride(
      origin: this,
      override: GameInfoProvider._internal(
        () => create()
          ..gameId = gameId
          ..initialValue = initialValue,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gameId: gameId,
        initialValue: initialValue,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GameInfo, Game> createElement() {
    return _GameInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameInfoProvider &&
        other.gameId == gameId &&
        other.initialValue == initialValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gameId.hashCode);
    hash = _SystemHash.combine(hash, initialValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GameInfoRef on AutoDisposeAsyncNotifierProviderRef<Game> {
  /// The parameter `gameId` of this provider.
  String get gameId;

  /// The parameter `initialValue` of this provider.
  Game? get initialValue;
}

class _GameInfoProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GameInfo, Game>
    with GameInfoRef {
  _GameInfoProviderElement(super.provider);

  @override
  String get gameId => (origin as GameInfoProvider).gameId;
  @override
  Game? get initialValue => (origin as GameInfoProvider).initialValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
