import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/core/extensions/string_extension.dart';
import 'package:movieapp/presentation/components/widgets/custom_circular_widget.dart';
import 'package:movieapp/presentation/pages/auth/components/widgets/custom_elevated_button_widget.dart';
import 'package:movieapp/presentation/pages/auth/components/widgets/custom_textfield_widget.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_cubit.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_state.dart';
import 'package:movieapp/utils/pop_up_utils.dart';
import 'package:movieapp/utils/screen_utils.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().loginWithEmail(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  void _navigateBack() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFieldWidget(
              controller: _emailController,
              label: 'E-Mail',
              hintText: 'E-Mail girin',
              icon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) return 'E-Mail boş';
                if (!value.isValidEmail) return 'Geçerli e-mail gir';
                return null;
              },
            ),
            SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.03),
            CustomTextFieldWidget(
              controller: _passwordController,
              label: 'Şifre',
              hintText: 'Şifrenizi girin',
              icon: Icons.lock_outline,
              isPassword: true, // ✅
              validator: (value) {
                if (value == null || value.isEmpty) return 'Şifre boş';
                if (value.length < 6) return 'Şifre en az 6 karakter';
                return null;
              },
            ),
            SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.001),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.push('/forgot_password'),
                child: const Text(
                  'Şifremi unuttum',
                  style: TextStyle(color: AppColors.primaryColor), // ✅ link rengi
                ),
              ),
            ),
            SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.02),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  _navigateBack();
                  PopUpUtils.showPopup(
                    context,
                    true,
                    successMessage: 'Giriş Başarılı!',
                    failureMessage: '',
                  );
                } else if (state is AuthError) {
                  PopUpUtils.showPopup(
                    context,
                    false,
                    successMessage: '',
                    failureMessage: state.message,
                  );
                }
              },
              builder: (context, state) {
                return CustomElevatedButtonWidget(
                  onPressed: state is AuthLoading ? null : _handleLogin,
                  backgroundColor: AppColors.primaryColor, // ✅
                  child: state is AuthLoading
                      ? const CustomCircularWidget()
                      : const Text(
                    'Giriş yap',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
