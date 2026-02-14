import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/core/extensions/string_extension.dart';
import 'package:movieapp/presentation/components/widgets/custom_circular_widget.dart';
import 'package:movieapp/presentation/components/widgets/custom_elevated_button_widget.dart';
import 'package:movieapp/presentation/components/widgets/custom_textfield_widget.dart';
import 'package:movieapp/presentation/pages/auth/forgotPassword/sendResetPasswordCode/reset_password.dart';
import 'package:movieapp/presentation/pages/auth/login/components/widgets/custom_divider_widget.dart';
import 'package:movieapp/presentation/pages/auth/login/components/widgets/custom_google_button_widget.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_cubit.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_state.dart';
import 'package:movieapp/utils/pop_up_utils.dart';

class LoginFormWidget extends StatefulWidget {
  final VoidCallback onGooglePressed;

  final VoidCallback onApplePressed;

  const LoginFormWidget({
    required this.onApplePressed,
    required this.onGooglePressed,
    super.key,
  });

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

  void resetPassword(BuildContext context) {
    context.push('/forgotPassword');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Spacer(flex: 2),
          // Email
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: CustomTextFieldWidget(
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
            ),
          ),
          // Password
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: CustomTextFieldWidget(
                controller: _passwordController,
                label: 'Şifre',
                hintText: 'Şifrenizi girin',
                icon: Icons.lock_outline,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Şifre boş';
                  if (value.length < 6) return 'Şifre en az 6 karakter';
                  return null;
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Hesabın Mı Yok?'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => context.push('/register'),
                        child: const Text(
                          'Kayıt Ol',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Forgot password
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => resetPassword(context),
                    child: const Text(
                      'Şifremi unuttum',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),

                // Forgot password
              ],
            ),
          ),
          // Button area: Expanded doğrudan Column çocuğu (doğru)
          Expanded(
            flex: 2,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  // pop + popup hatasını önlemek için: popup önce, pop sonra (frame)
                  FocusManager.instance.primaryFocus?.unfocus();

                  PopUpUtils.showPopup(
                    context,
                    true,
                    successMessage: 'Giriş Başarılı!',
                    failureMessage: '',
                  );

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!context.mounted) return;
                    context.pop();
                  });
                } else if (state is AuthError) {
                  FocusManager.instance.primaryFocus?.unfocus();
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
                  backgroundColor: AppColors.primaryColor,
                  child: state is AuthLoading
                      ? const CustomCircularWidget()
                      : const Text('Giriş yap', style: TextStyle(fontSize: 18)),
                );
              },
            ),
          ),
          Expanded(child: CustomDividerWidget()),
          Expanded(
            flex: 2,
            child: CustomDifferentLoginTypeButton(
              onPressed: widget.onGooglePressed,
              buttonIcon: FontAwesomeIcons.google,
              buttonText: 'Google İle Devam Et',
            ),
          ),
          Spacer(flex: 2,),
        ],
      ),
    );
  }
}
