// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_session.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newSessionCreatorHash() => r'649ef78147edc2443fdf68adc7f7bfaf10248e29';

/// See also [newSessionCreator].
@ProviderFor(newSessionCreator)
final newSessionCreatorProvider =
    AutoDisposeFutureProvider<GameSession>.internal(
  newSessionCreator,
  name: r'newSessionCreatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newSessionCreatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewSessionCreatorRef = AutoDisposeFutureProviderRef<GameSession>;
String _$newSessionHash() => r'63ff35506dc94c9b9965de37b17cbed2949dd637';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
