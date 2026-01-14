
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movieapp/data/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Auth Repository
class AuthRepository {
  /// Constructor
  AuthRepository(this._authService);
  /// Auth Service Object
  final AuthService _authService;
  /// Live User State (return Stream type)
  Stream<AuthState> get userStream => _authService.userStream;
  /// User State
  User? get currentUser => _authService.currentUser;

  /// =========================
  /// Email Auth
  /// =========================
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _authService.signInWithEmail(email: email, password: password);
    } on AuthException catch (e) {
      throw Exception(_mapErrorMessage(e.code));
    } catch (e) {
      throw Exception('Beklenmeyen bir hata oluştu: $e');
    }
  }

  /// Kayıt ol
  Future<User?> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      return await _authService.signUpWithEmail(email: email, password: password,displayName: displayName);
    } on AuthException catch (e) {
      throw Exception(_mapErrorMessage(e.code));
    } catch (e) {
      throw Exception('Beklenmeyen bir hata oluştu: $e');
    }
  }


  /// =========================
  /// Google Auth
  /// =========================
  Future<AuthResponse> signInWithGoogle() async {
    try {
      return await _authService.signInWithGoogle();
    } on GoogleSignInException catch(e){
      throw Exception(_mapGoogleErrorMessage(e));
    } catch (e) {
      throw Exception('Beklenmeyen bir hata oluştu: $e');
    }
  }

  /// Çıkış yap
  Future<void> signOut() async {
    try {
      await _authService.signOut();
    } on AuthException catch (e) {
      throw Exception(_mapErrorMessage(e.code));
    } catch (e) {
      throw Exception('Beklenmeyen bir hata oluştu: $e');
    }
  }


  /// =========================
  /// Hata mesajları
  /// =========================

  String _mapErrorMessage(String? code) {
    switch (code) {
      case 'invalid_grant':
        return 'E-posta veya şifre hatalı.';
      case 'user_already_exists':
        return 'Bu e-posta adresiyle zaten bir hesap mevcut.';
      case 'weak_password':
        return 'Şifre çok zayıf. Daha güçlü bir şifre deneyin.';
      case 'invalid_request':
        return 'Geçersiz istek yapıldı.';
      case 'email_not_confirmed':
        return 'E-posta adresiniz doğrulanmamış. Lütfen e-postanızı kontrol edin.';
      case 'over_request_rate_limit':
        return 'Çok fazla deneme yaptınız. Lütfen daha sonra tekrar deneyin.';
      case 'network_error':
        return 'İnternet bağlantısı yok. Lütfen bağlantınızı kontrol edin.';
      case 'user_not_found':
        return 'Kullanıcı bulunamadı.';
      case 'session_expired':
        return 'Oturum süresi dolmuş. Lütfen tekrar giriş yapın.';
      default:
        return 'Bir hata oluştu. Lütfen tekrar deneyin. (Kod: $code)';
    }
  }
  String _mapGoogleErrorMessage(GoogleSignInException e) {
    switch (e.code) {
      case GoogleSignInExceptionCode.canceled:
        return 'Oturum açma işlemi kullanıcı tarafından iptal edildi.';
      case GoogleSignInExceptionCode.clientConfigurationError:
        return 'Uygulama yapılandırma hatası: google-services.json eksik veya yanlış.';
      case GoogleSignInExceptionCode.interrupted:
        return 'Oturum açma işlemi kesildi.';
      case GoogleSignInExceptionCode.providerConfigurationError:
        return 'Sağlayıcı yapılandırma hatası.';
      case GoogleSignInExceptionCode.uiUnavailable:
        return 'Kullanıcı arayüzü mevcut değil.';
      case GoogleSignInExceptionCode.unknownError:
        return 'Bilinmeyen bir hata oluştu.';
      case GoogleSignInExceptionCode.userMismatch:
        return 'Kullanıcı uyuşmazlığı hatası.';
    }
  }
}
