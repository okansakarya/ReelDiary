
import 'package:flutter/material.dart';
import 'package:movieapp/data/repository/auth_repository.dart';
import 'package:movieapp/data/services/auth_service.dart';
import 'package:movieapp/presentation/pages/auth/welcome/welcome_page.dart';
import 'package:movieapp/presentation/pages/homePage/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// App Auth Management
class AuthWrapper extends StatelessWidget {
  /// Constructor
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final authRepository = AuthRepository(authService);

    return StreamBuilder<AuthState>(
      stream: authRepository.userStream,
      builder: (BuildContext context, AsyncSnapshot<AuthState> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        /// Veri alınamadı
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(child: Text('Something went wrong!')),
          );
        }

        /// Giriş yapıldı
        if (snapshot.hasData) {
          final session = snapshot.data!.session;
          if(session != null) {
            /// Main sayfasına yönlendirecek
            return const HomePage();
          }
        }

        /// Giriş yapılmadı veya geçersiz token
        /// Welcome sayfasına yönlendiricek
        return const WelcomePage();
      },
    );
  }
}
