// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sessions.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userSessionsHash() => r'90bc7670e15c0cc25ac1a7738d0c8ca8d877fa4d';

/// See also [UserSessions].
@ProviderFor(UserSessions)
final userSessionsProvider =
    NotifierProvider<UserSessions, AsyncValue<List<GameSession>>>.internal(
  UserSessions.new,
  name: r'userSessionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userSessionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserSessions = Notifier<AsyncValue<List<GameSession>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
