/// Base class for AuthState
abstract class AuthState {}

/// Initial state - app just started
class AuthInitial extends AuthState {}

/// Loading state - login/logout in progress
class AuthLoading extends AuthState {}

/// Authenticated state - user is logged in
class Authenticated extends AuthState {}

/// email onayı
///class AuthEmailNeedVerified extends AuthState {}
/// Unauthenticated state - user is logged out
class Unauthenticated extends AuthState {}

/// Error state - login/logout failed
class AuthError extends AuthState {
  /// Constructor
  AuthError(this.message);
  /// Fail Message
  final String message;
}
