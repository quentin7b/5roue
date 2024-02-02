// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_level_widget_builder.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemBuilderForGameHash() =>
    r'da889752d3bf63f431ac5cd6cfd7b51410729736';

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

/// See also [itemBuilderForGame].
@ProviderFor(itemBuilderForGame)
const itemBuilderForGameProvider = ItemBuilderForGameFamily();

/// See also [itemBuilderForGame].
class ItemBuilderForGameFamily extends Family<GameLevelItemBuilder?> {
  /// See also [itemBuilderForGame].
  const ItemBuilderForGameFamily();

  /// See also [itemBuilderForGame].
  ItemBuilderForGameProvider call({
    required String gameId,
  }) {
    return ItemBuilderForGameProvider(
      gameId: gameId,
    );
  }

  @override
  ItemBuilderForGameProvider getProviderOverride(
    covariant ItemBuilderForGameProvider provider,
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
  String? get name => r'itemBuilderForGameProvider';
}

/// See also [itemBuilderForGame].
class ItemBuilderForGameProvider
    extends AutoDisposeProvider<GameLevelItemBuilder?> {
  /// See also [itemBuilderForGame].
  ItemBuilderForGameProvider({
    required String gameId,
  }) : this._internal(
          (ref) => itemBuilderForGame(
            ref as ItemBuilderForGameRef,
            gameId: gameId,
          ),
          from: itemBuilderForGameProvider,
          name: r'itemBuilderForGameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$itemBuilderForGameHash,
          dependencies: ItemBuilderForGameFamily._dependencies,
          allTransitiveDependencies:
              ItemBuilderForGameFamily._allTransitiveDependencies,
          gameId: gameId,
        );

  ItemBuilderForGameProvider._internal(
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
    GameLevelItemBuilder? Function(ItemBuilderForGameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ItemBuilderForGameProvider._internal(
        (ref) => create(ref as ItemBuilderForGameRef),
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
  AutoDisposeProviderElement<GameLevelItemBuilder?> createElement() {
    return _ItemBuilderForGameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemBuilderForGameProvider && other.gameId == gameId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gameId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ItemBuilderForGameRef on AutoDisposeProviderRef<GameLevelItemBuilder?> {
  /// The parameter `gameId` of this provider.
  String get gameId;
}

class _ItemBuilderForGameProviderElement
    extends AutoDisposeProviderElement<GameLevelItemBuilder?>
    with ItemBuilderForGameRef {
  _ItemBuilderForGameProviderElement(super.provider);

  @override
  String get gameId => (origin as ItemBuilderForGameProvider).gameId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
