abstract class AuthService {
  Future<bool> isSignedIn();
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  });
  Future<void> logIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
