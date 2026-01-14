import 'package:supabase_flutter/supabase_flutter.dart';

class EmailAuthService {
  final _supabase = Supabase.instance.client;

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _supabase.auth.signInWithPassword(email: email, password: password);
      return credential.user;
    } on AuthException {
      rethrow;
    } catch(e) {
      rethrow;
    }
  }

  Future<User?> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final credential = await _supabase.auth.signUp(
        email: email,
        password: password, data: {'display_name': displayName}
      );
      return credential.user;
    } on AuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

}
