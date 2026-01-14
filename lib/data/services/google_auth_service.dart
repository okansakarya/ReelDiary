import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleAuthService {
  final _supabase = Supabase.instance.client;
  final _googleSignIn = GoogleSignIn.instance;
  static const webClientId = '';
  static const iosClientId = '';
  static const androidClientId = '';
  /// Google ile giriş
  Future<AuthResponse> signInWithGoogle() async {
    try {
      // GoogleSignIn instance'ını clientId ile başlat
      await _googleSignIn.initialize(clientId: androidClientId ,serverClientId: webClientId);
      final googleSignIn = await _googleSignIn.authenticate();
      final googleUser = await googleSignIn.authentication;
      final String? idToken = googleUser.idToken;
      if (idToken != null) {
        return _supabase.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
        );
      }
      throw Exception('Giriş yapılamadı!');
    } on AuthException catch (e) {
      throw Exception('Google ile giriş başarısız: ${e.message}');
    } catch (e) {
      print(e);
      throw Exception('Beklenmeyen hata: $e');
    }
  }
}
