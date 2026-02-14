abstract class PasswordState {}

class PasswordStateInitial extends PasswordState {}

class PasswordStateLoading extends PasswordState {}

class PasswordResetLinkSended extends PasswordState {
  PasswordResetLinkSended(this.email);
  final String email;
}

class PasswordResetLinkError extends PasswordState {
  PasswordResetLinkError(this.error);
  final String error;
}

class UserTokenVerified extends PasswordState {
  UserTokenVerified(this.email);
  final String email;
}

class UserTokenVerifyError extends PasswordState {
  UserTokenVerifyError(this.error);
  final String error;
}

class PasswordUpdated extends PasswordState {}

class PasswordUpdateError extends PasswordState {
  PasswordUpdateError(this.error);
  final String error;
}
