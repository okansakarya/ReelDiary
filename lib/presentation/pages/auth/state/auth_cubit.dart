import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/data/repository/auth_repository.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthInitial());
  final AuthRepository _authRepository;

  supabase.User? get currentUser => _authRepository.currentUser;

  // Email login
  Future<void> loginWithEmail({required BuildContext context,required String email, required String password}) async {
    try {
      emit(AuthLoading());
      await _authRepository.signInWithEmail(email: email, password: password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Google login
  Future<void> loginWithGoogle() async {
    try {
      emit(AuthLoading());
      await _authRepository.signInWithGoogle();
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> registerWithEmail({required String email, required String password, required String displayName}) async {
    try {
      emit(AuthLoading());
      await _authRepository.signUpWithEmail(email: email, password: password, displayName: displayName);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      emit(AuthLoading());
      await _authRepository.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

}
