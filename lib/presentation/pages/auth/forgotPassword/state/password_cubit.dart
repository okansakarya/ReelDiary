import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/data/repository/auth_repository.dart';
import 'package:movieapp/presentation/pages/auth/forgotPassword/state/password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit(this._authRepository) : super(PasswordStateInitial());

  final AuthRepository _authRepository;

  String? _userEmail;

  // (Opsiyonel) UI’da göstermek istersen
  String? get userEmail => _userEmail;

  Future<void> sendResetPasswordLink({required String email}) async {
    final trimmed = email.trim();
    _userEmail = trimmed;

    try {
      emit(PasswordStateLoading());
      await _authRepository.sendResetPasswordLink(email: trimmed);
      emit(PasswordResetLinkSended(trimmed)); // ✅ email state içinde
    } catch (e) {
      emit(PasswordResetLinkError(e.toString()));
    }
  }

  // ✅ UI artık email göndermeyecek
  Future<void> verifyUserCode({required String token}) async {
    final email = _userEmail;

    // Normal akışta düşmez, ama Cubit resetlenirse düşebilir.
    if (email == null || email.isEmpty) {
      emit(UserTokenVerifyError(
        "E-posta bilgisi bulunamadı. Lütfen tekrar e-posta girin.",
      ));
      return;
    }
    try {
      emit(PasswordStateLoading());
      await _authRepository.verifyUserCode(
        email: email,
        token: token.trim(),
      );
      emit(UserTokenVerified(email)); // ✅ token doğrulandı
    } catch (e) {
      emit(UserTokenVerifyError(e.toString()));
    }
  }
  Future<void> changeUserPassword({required String newPassword}) async {
    try {
      emit(PasswordStateLoading());
      await _authRepository.updateUserPassword(newPassword: newPassword);
      emit(PasswordUpdated()); // ✅ şifre güncellendi
    } catch (e) {
      emit(PasswordUpdateError(e.toString()));
    }
  }

  // (Opsiyonel) flow bitince temizle
  void clearResetFlow() {
    _userEmail = null;
    emit(PasswordStateInitial());
  }
}
