import 'package:five_wheel/models/user.model.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  User? build() {
    return null;
  }

  Future<void> load() async {
    try {
      state = await ref.read(userServiceProvider).getMe();
    } catch (e) {
      debugPrint('User is null');
    }
  }
}
