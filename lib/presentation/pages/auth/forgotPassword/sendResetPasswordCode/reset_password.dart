import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/core/extensions/string_extension.dart';
import 'package:movieapp/presentation/components/widgets/custom_back_button_widget.dart';
import 'package:movieapp/presentation/components/widgets/custom_circular_widget.dart';
import 'package:movieapp/presentation/components/widgets/custom_textfield_widget.dart';
import 'package:movieapp/presentation/pages/auth/forgotPassword/state/password_cubit.dart';
import 'package:movieapp/presentation/pages/auth/forgotPassword/state/password_state.dart';
import 'package:movieapp/utils/pop_up_utils.dart';
import 'package:movieapp/utils/screen_utils.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({
    super.key,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<PasswordCubit>().sendResetPasswordLink(
          email: _emailController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final w = ScreenUtils.getScreenWidth(context);
    final h = ScreenUtils.getScreenHeight(context);
    final textTheme = Theme.of(context).textTheme;

    final fieldBg = AppColors.backgroundLight;
    final fieldText = AppColors.backgroundDark;
    final fieldIcon = AppColors.backgroundDarkLogin;
    final fieldBorder = AppColors.primaryColor.withValues(alpha: 0.18);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: BlocConsumer<PasswordCubit, PasswordState>(
        listener: (context, state) {
          if (state is PasswordResetLinkSended) {
            context.push('/verifyCodePage');
          }
          if (state is PasswordResetLinkError) {
            PopUpUtils.showPopup(
              context,
              false,
              successMessage: '',
              failureMessage: state.error,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is PasswordStateLoading;

          return Scaffold(
            body: Column(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.backgroundDark,
                                AppColors.secondaryColor,
                              ],
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.08,
                              vertical: h * 0.04,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const CustomBackButtonWidget(),
                                    const Spacer(),
                                    const Icon(
                                      Icons.mail_outline_rounded,
                                      color: AppColors.textColor,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Şifre Sıfırlama',
                                    style: textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: h * 0.01),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'E-posta adresini gir. Şifre yenileme kodu göndereceğiz.',
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.textColor.withValues(alpha: 0.85),
                                      height: 1.25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.02),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomTextFieldWidget(
                                label: 'E-posta',
                                hintText: 'ornek@mail.com',
                                icon: Icons.mail_outline,
                                controller: _emailController,
                                backgroundColor: fieldBg,
                                textColor: fieldText,
                                iconColor: fieldIcon,
                                borderColor: fieldBorder,
                                labelColor: AppColors.backgroundDark
                                    .withValues(alpha: 0.85),
                                validator: (value) {
                                  final v = value?.trim();
                                  if (v.isNullOrEmpty) return 'E-posta boş olamaz';
                                  if (!v!.isValidEmail) {
                                    return 'Geçerli bir e-posta gir';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: h * 0.016),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: isLoading
                                          ? null
                                          : () => context.pop(),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: AppColors.backgroundDark,
                                        side: BorderSide(
                                          color: AppColors.primaryColor
                                              .withValues(alpha: 0.35),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                      ),
                                      child: const Text('İptal', style: TextStyle(color: Colors.white),),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.03),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: isLoading ? null : _onSubmit,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        foregroundColor: AppColors.textColor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                      ),
                                      child: const Text('Gönder'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isLoading)
                  Positioned.fill(
                    child: Container(
                      color: AppColors.backgroundDark.withValues(alpha: 0.5),
                      child: const Center(child: CustomCircularWidget()),
                    ),
                  ),

              ],
            ),
          );
        },
      ),
    );
  }
}
