import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'email_auth_service.dart';
import 'google_auth_service.dart';

class AuthService {
  final _supabase = Supabase.instance.client;
  final _googleSignIn = GoogleSignIn.instance;
  final EmailAuthService _emailAuth = EmailAuthService();
  final GoogleAuthService _googleAuth = GoogleAuthService();

  Stream<AuthState> get userStream => _supabase.auth.onAuthStateChange;

  User? get currentUser => _supabase.auth.currentUser;

  // Email
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) => _emailAuth.signIn(email: email, password: password);

  Future<User?> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) => _emailAuth.signUp(
    email: email,
    password: password,
    displayName: displayName,
  );

  // Google
  Future<AuthResponse> signInWithGoogle() => _googleAuth.signInWithGoogle();

  // Sign Out
  Future<void> signOut() async {
    try {
      // Firebase çıkış
      await _supabase.auth.signOut();
      // Google çıkış
      await _googleSignIn.signOut();
    } on AuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> sendResetPasswordLink({required String email}) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
      return true;
    } on AuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> verifyUserCode({
    required String email,
    required String token,
  }) async {
    try {
      final res = await _supabase.auth.verifyOTP(
        type: OtpType.recovery,
        email: email,
        token: token,
      );
      final session = res.session ?? _supabase.auth.currentSession;
      if (session == null) {
        throw Exception("Token doğrulandı ama session oluşmadı.");
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateUserPassword({required String newPassword}) async {
    try {
      await _supabase.auth.updateUser(UserAttributes(password: newPassword));
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
