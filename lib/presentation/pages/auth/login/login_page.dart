import 'package:flutter/material.dart';
import 'package:movieapp/presentation/pages/auth/login/components/widgets/login_form_widget.dart';
import 'package:movieapp/presentation/pages/auth/login/components/widgets/login_header_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _onGooglePressed() {}

  void _onApplePressed() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const Expanded(flex: 2, child: LoginHeaderWidget()),
            Expanded(
              flex: 6,
              child: LoginFormWidget(
                onGooglePressed: _onGooglePressed,
                onApplePressed: _onApplePressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
