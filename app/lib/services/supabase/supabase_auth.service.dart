import 'package:five_wheel/services/auth.service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService implements AuthService {
  final SupabaseClient client;

  SupabaseAuthService(this.client);

  @override
  Future<bool> isSignedIn() async {
    return client.auth.currentSession != null;
  }

  @override
  Future<void> logIn({required String email, required String password}) async {
    await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await client.auth.signOut(
      scope: SignOutScope.local,
    );
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    // See https://github.com/supabase/gotrue#post-signup
    // And https://supabase.com/docs/reference/dart/auth-signup?example=sign-up-with-redirect-url
    final signupResponse = await client.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: 'app.perfectmates.mobile://auth-callback',
    );

    await client.from('user').insert({
      'id': signupResponse.user!.id,
      'username': username,
    });
  }
}
