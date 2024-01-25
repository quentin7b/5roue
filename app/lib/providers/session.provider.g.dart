// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionHash() => r'b92e3fd012afa78ce00e208f8e9db55ae73da5c9';

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

abstract class _$Session
    extends BuildlessAutoDisposeStreamNotifier<GameSession> {
  late final String sessionId;
  late final GameSession? initialValue;

  Stream<GameSession> build({
    required String sessionId,
    GameSession? initialValue,
  });
}

/// See also [Session].
@ProviderFor(Session)
const sessionProvider = SessionFamily();

/// See also [Session].
class SessionFamily extends Family<AsyncValue<GameSession>> {
  /// See also [Session].
  const SessionFamily();

  /// See also [Session].
  SessionProvider call({
    required String sessionId,
    GameSession? initialValue,
  }) {
    return SessionProvider(
      sessionId: sessionId,
      initialValue: initialValue,
    );
  }

  @override
  SessionProvider getProviderOverride(
    covariant SessionProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
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
  String? get name => r'sessionProvider';
}

/// See also [Session].
class SessionProvider
    extends AutoDisposeStreamNotifierProviderImpl<Session, GameSession> {
  /// See also [Session].
  SessionProvider({
    required String sessionId,
    GameSession? initialValue,
  }) : this._internal(
          () => Session()
            ..sessionId = sessionId
            ..initialValue = initialValue,
          from: sessionProvider,
          name: r'sessionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sessionHash,
          dependencies: SessionFamily._dependencies,
          allTransitiveDependencies: SessionFamily._allTransitiveDependencies,
          sessionId: sessionId,
          initialValue: initialValue,
        );

  SessionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.initialValue,
  }) : super.internal();

  final String sessionId;
  final GameSession? initialValue;

  @override
  Stream<GameSession> runNotifierBuild(
    covariant Session notifier,
  ) {
    return notifier.build(
      sessionId: sessionId,
      initialValue: initialValue,
    );
  }

  @override
  Override overrideWith(Session Function() create) {
    return ProviderOverride(
      origin: this,
      override: SessionProvider._internal(
        () => create()
          ..sessionId = sessionId
          ..initialValue = initialValue,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        initialValue: initialValue,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<Session, GameSession>
      createElement() {
    return _SessionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionProvider &&
        other.sessionId == sessionId &&
        other.initialValue == initialValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, initialValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SessionRef on AutoDisposeStreamNotifierProviderRef<GameSession> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `initialValue` of this provider.
  GameSession? get initialValue;
}

class _SessionProviderElement
    extends AutoDisposeStreamNotifierProviderElement<Session, GameSession>
    with SessionRef {
  _SessionProviderElement(super.provider);

  @override
  String get sessionId => (origin as SessionProvider).sessionId;
  @override
  GameSession? get initialValue => (origin as SessionProvider).initialValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
