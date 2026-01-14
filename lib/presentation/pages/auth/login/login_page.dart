import 'package:flutter/material.dart';
import 'package:movieapp/presentation/pages/auth/login/components/widgets/login_header_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
        children: [
          LoginHeaderWidget()
      
      
      
      
        ],
        ),
      ),
    );
  }
}
