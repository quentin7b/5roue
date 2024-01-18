import 'package:five_wheel/providers/services.provider.dart';
import 'package:five_wheel/providers/user.provider.dart';
import 'package:five_wheel/router.dart';
import 'package:five_wheel/views/auth/auth.screen.dart';
import 'package:five_wheel/views/home/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashRoute extends ConsumerWidget {
  static const routeName = '/splash';

  const SplashRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future(() async {
      await init();
      final authService = ref.read(authServiceProvider);
      final isUserConnected = await authService.isSignedIn();
      if (isUserConnected) {
        await ref.read(currentUserProvider.notifier).load();
      }
      ref.read(routerProvider).go(
            isUserConnected ? HomeRoute.routeName : AuthRoute.routeName,
          );
    });
    return const Scaffold(
      body: Center(
        child: Text('SplashScreen'),
      ),
    );
  }

  Future<void> init() async {
    // Load any data you need or init any database you need to
  }
}
