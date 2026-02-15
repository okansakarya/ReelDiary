import 'package:supabase_flutter/supabase_flutter.dart';

extension UserInitialsExtension on User? {
  /// Returns up to two uppercase initials from user_metadata (full_name / display_name) or email.
  String getInitials() {
    final user = this;
    if (user == null) return '?';

    final meta = user.userMetadata;
    if (meta != null) {
      final fullName = meta['full_name'] as String? ?? meta['display_name'] as String?;
      if (fullName != null && fullName.trim().isNotEmpty) {
        final parts = fullName.trim().split(RegExp(r'\s+'));
        if (parts.length >= 2) {
          final a = parts[0].isNotEmpty ? parts[0][0].toUpperCase() : '';
          final b = parts[1].isNotEmpty ? parts[1][0].toUpperCase() : '';
          return (a + b).trim();
        }
        if (parts.isNotEmpty && parts[0].length >= 2) {
          return parts[0].substring(0, 2).toUpperCase();
        }
        if (parts.isNotEmpty && parts[0].length == 1) {
          return parts[0].toUpperCase();
        }
      }
    }

    final email = user.email;
    if (email != null && email.isNotEmpty) {
      final beforeAt = email.split('@').first;
      if (beforeAt.length >= 2) return beforeAt.substring(0, 2).toUpperCase();
      if (beforeAt.length == 1) return beforeAt.toUpperCase();
    }

    return '?';
  }

  /// Returns display name from user_metadata (full_name or display_name), or null.
  String? get displayNameOrNull {
    final user = this;
    if (user == null) return null;
    final meta = user.userMetadata;
    if (meta == null) return null;
    return meta['full_name'] as String? ?? meta['display_name'] as String?;
  }
}
