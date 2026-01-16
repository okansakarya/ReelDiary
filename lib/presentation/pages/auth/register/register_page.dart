import 'package:flutter/material.dart';
import 'package:movieapp/presentation/components/widgets/custom_back_button_widget.dart';
import 'package:movieapp/presentation/pages/auth/register/components/widgets/register_form_widget.dart';
import 'package:movieapp/presentation/pages/auth/register/components/widgets/register_header_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: AlignmentGeometry.topLeft,
                child: CustomBackButtonWidget()),
            RegisterHeaderWidget(),
            RegisterFormWidget(),
          ],
        ),
      ),
    );
  }
}
