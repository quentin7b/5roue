// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_levels.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$levelsForGameHash() => r'181d9979e22379371b57c4e6ec9b3fbc30b24220';

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

/// See also [levelsForGame].
@ProviderFor(levelsForGame)
const levelsForGameProvider = LevelsForGameFamily();

/// See also [levelsForGame].
class LevelsForGameFamily extends Family<AsyncValue<List<GameLevel>>> {
  /// See also [levelsForGame].
  const LevelsForGameFamily();

  /// See also [levelsForGame].
  LevelsForGameProvider call({
    required String gameId,
  }) {
    return LevelsForGameProvider(
      gameId: gameId,
    );
  }

  @override
  LevelsForGameProvider getProviderOverride(
    covariant LevelsForGameProvider provider,
  ) {
    return call(
      gameId: provider.gameId,
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
  String? get name => r'levelsForGameProvider';
}

/// See also [levelsForGame].
class LevelsForGameProvider extends AutoDisposeFutureProvider<List<GameLevel>> {
  /// See also [levelsForGame].
  LevelsForGameProvider({
    required String gameId,
  }) : this._internal(
          (ref) => levelsForGame(
            ref as LevelsForGameRef,
            gameId: gameId,
          ),
          from: levelsForGameProvider,
          name: r'levelsForGameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$levelsForGameHash,
          dependencies: LevelsForGameFamily._dependencies,
          allTransitiveDependencies:
              LevelsForGameFamily._allTransitiveDependencies,
          gameId: gameId,
        );

  LevelsForGameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gameId,
  }) : super.internal();

  final String gameId;

  @override
  Override overrideWith(
    FutureOr<List<GameLevel>> Function(LevelsForGameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LevelsForGameProvider._internal(
        (ref) => create(ref as LevelsForGameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gameId: gameId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GameLevel>> createElement() {
    return _LevelsForGameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LevelsForGameProvider && other.gameId == gameId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gameId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LevelsForGameRef on AutoDisposeFutureProviderRef<List<GameLevel>> {
  /// The parameter `gameId` of this provider.
  String get gameId;
}

class _LevelsForGameProviderElement
    extends AutoDisposeFutureProviderElement<List<GameLevel>>
    with LevelsForGameRef {
  _LevelsForGameProviderElement(super.provider);

  @override
  String get gameId => (origin as LevelsForGameProvider).gameId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
