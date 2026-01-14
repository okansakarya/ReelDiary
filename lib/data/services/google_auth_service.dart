import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleAuthService {
  final _supabase = Supabase.instance.client;
  final _googleSignIn = GoogleSignIn.instance;
  static const webClientId = '506184581424-3t1d49gh0biitb0nj8pu86bvkl7i4613.apps.googleusercontent.com';
  static const iosClientId = '506184581424-e8pbb3og97h5qclpl6ln8an79o6dkcj5.apps.googleusercontent.com';
  static const androidClientId = '506184581424-n6eh6caff2nqe4s2hg799htrcnfo4jf9.apps.googleusercontent.com';
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
