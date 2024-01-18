// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameHash() => r'44dbe72b06640898d7d564cfdf22ebd3d8405147';

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

/// See also [game].
@ProviderFor(game)
const gameProvider = GameFamily();

/// See also [game].
class GameFamily extends Family<AsyncValue<Game>> {
  /// See also [game].
  const GameFamily();

  /// See also [game].
  GameProvider call({
    required String gameId,
    Game? initialValue,
  }) {
    return GameProvider(
      gameId: gameId,
      initialValue: initialValue,
    );
  }

  @override
  GameProvider getProviderOverride(
    covariant GameProvider provider,
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
  String? get name => r'gameProvider';
}

/// See also [game].
class GameProvider extends AutoDisposeFutureProvider<Game> {
  /// See also [game].
  GameProvider({
    required String gameId,
    Game? initialValue,
  }) : this._internal(
          (ref) => game(
            ref as GameRef,
            gameId: gameId,
            initialValue: initialValue,
          ),
          from: gameProvider,
          name: r'gameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$gameHash,
          dependencies: GameFamily._dependencies,
          allTransitiveDependencies: GameFamily._allTransitiveDependencies,
          gameId: gameId,
          initialValue: initialValue,
        );

  GameProvider._internal(
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
  Override overrideWith(
    FutureOr<Game> Function(GameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameProvider._internal(
        (ref) => create(ref as GameRef),
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
  AutoDisposeFutureProviderElement<Game> createElement() {
    return _GameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameProvider &&
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

mixin GameRef on AutoDisposeFutureProviderRef<Game> {
  /// The parameter `gameId` of this provider.
  String get gameId;

  /// The parameter `initialValue` of this provider.
  Game? get initialValue;
}

class _GameProviderElement extends AutoDisposeFutureProviderElement<Game>
    with GameRef {
  _GameProviderElement(super.provider);

  @override
  String get gameId => (origin as GameProvider).gameId;
  @override
  Game? get initialValue => (origin as GameProvider).initialValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
