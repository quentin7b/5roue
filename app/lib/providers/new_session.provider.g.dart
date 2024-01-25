// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_session.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newSessionHash() => r'3c62ed741503c3d490301beed1a4f5eb7ed7e8fd';

/// See also [NewSession].
@ProviderFor(NewSession)
final newSessionProvider =
    AutoDisposeNotifierProvider<NewSession, GameSession>.internal(
  NewSession.new,
  name: r'newSessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewSession = AutoDisposeNotifier<GameSession>;
String _$newSessionCreatorHash() => r'1a78c4583ba2b49e0cb4a6f6beb38bcb97f9f67f';

/// See also [NewSessionCreator].
@ProviderFor(NewSessionCreator)
final newSessionCreatorProvider = AutoDisposeNotifierProvider<NewSessionCreator,
    AsyncValue<GameSession>>.internal(
  NewSessionCreator.new,
  name: r'newSessionCreatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newSessionCreatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewSessionCreator = AutoDisposeNotifier<AsyncValue<GameSession>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
