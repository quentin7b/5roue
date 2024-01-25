import 'package:five_wheel/providers/services.provider.dart';
import 'package:five_wheel/providers/user.provider.dart';
import 'package:five_wheel/router.dart';
import 'package:five_wheel/views/home/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRoute extends ConsumerStatefulWidget {
  static const routeName = '/auth';

  const AuthRoute({super.key});

  @override
  ConsumerState<AuthRoute> createState() => AuthRouteState();
}

class AuthRouteState extends ConsumerState<AuthRoute> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) {
    return ref.read(authServiceProvider).logIn(
          email: email,
          password: password,
        );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) {
    return ref.read(authServiceProvider).signUp(
          email: email,
          password: password,
          username: username,
        );
  }

  @override
  Widget build(BuildContext context) {
    final authService = ref.read(authServiceProvider);
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text('Auth'),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _emailController,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                ),
                TextField(
                  controller: _usernameController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final username = _usernameController.text;
                    await signUp(
                      email: email,
                      password: password,
                      username: username,
                    );

                    // Now the user has to confirm its email
                  },
                  child: const Text('Sign Up'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    await authService.logIn(
                      email: email,
                      password: password,
                    );
                    await ref.read(currentUserProvider.notifier).load();

                    ref.read(routerProvider).go(HomeRoute.routeName);
                  },
                  child: const Text('Log In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
