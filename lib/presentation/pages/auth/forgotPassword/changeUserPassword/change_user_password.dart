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

class ChangeUserPasswordPage extends StatefulWidget {
  const ChangeUserPasswordPage({super.key});

  @override
  State<ChangeUserPasswordPage> createState() => _ChangeUserPasswordPageState();
}

class _ChangeUserPasswordPageState extends State<ChangeUserPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passC = TextEditingController();
  final _pass2C = TextEditingController();

  @override
  void dispose() {
    _passC.dispose();
    _pass2C.dispose();
    super.dispose();
  }

  void _onSend() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    final p1 = _passC.text.trim();
    final p2 = _pass2C.text.trim();

    if (p1 != p2) {
      PopUpUtils.showPopup(
        context,
        false,
        successMessage: '',
        failureMessage: 'Şifreler eşleşmiyor.',
      );
      return;
    }

    context.read<PasswordCubit>().changeUserPassword(newPassword: p1);
  }

  @override
  Widget build(BuildContext context) {
    final w = ScreenUtils.getScreenWidth(context);
    final h = ScreenUtils.getScreenHeight(context);
    final textTheme = Theme.of(context).textTheme;

    final fieldBg = AppColors.surface(context);
    final fieldText = AppColors.textPrimary(context);
    final fieldIcon = AppColors.textPrimary(context);
    final fieldBorder = AppColors.primary(context).withValues(alpha: 0.18);

    return Scaffold(
      backgroundColor: AppColors.surface(context),
      body: BlocConsumer<PasswordCubit, PasswordState>(
        listener: (context, state) {
          if (state is PasswordUpdated) {
            PopUpUtils.showPopup(
              context,
              true,
              successMessage: 'Şifreniz başarıyla güncellendi.',
              failureMessage: '',
            );

            // ✅ Şifre değişince login'e gönder
            context.go('/login');
          }

          if (state is PasswordUpdateError) {
            PopUpUtils.showPopup(
              context,
              false,
              successMessage: '',
              failureMessage: state.error,
            );
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
                  child: Column(
                    children: [
                      // Header
                      Container(
                        height: h * 0.25,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.surface(context),
                              AppColors.secondary(context),
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
                                  Icon(
                                    Icons.lock_rounded,
                                    color: AppColors.textPrimary(context),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Yeni Şifre',
                                  style: textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.textPrimary(context),
                                  ),
                                ),
                              ),
                              SizedBox(height: h * 0.01),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Lütfen yeni şifrenizi belirleyin.',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textPrimary(context).withValues(alpha: 0.85),
                                    height: 1.25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  
                      // Form
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: h * 0.02),
                  
                              CustomTextFieldWidget(
                                label: 'Yeni Şifre',
                                hintText: 'Yeni şifreniz',
                                icon: Icons.lock_outline_rounded,
                                controller: _passC,
                                // Eğer widget destekliyorsa:
                                isPassword: true,
                                backgroundColor: fieldBg,
                                textColor: fieldText,
                                iconColor: fieldIcon,
                                borderColor: fieldBorder,
                                labelColor:
                                AppColors.textPrimary(context).withValues(
                                  alpha: 0.85,
                                ),
                                validator: (v) {
                                  final value = v?.trim();
                                  if (value.isNullOrEmpty) {
                                    return 'Şifre zorunludur';
                                  }
                                  if (value!.length < 6) {
                                    return 'Şifre en az 6 karakter olmalı';
                                  }
                                  return null;
                                },
                              ),
                  
                              SizedBox(height: h * 0.014),
                  
                              CustomTextFieldWidget(
                                label: 'Yeni Şifre (Tekrar)',
                                hintText: 'Şifrenizi tekrar girin',
                                icon: Icons.lock_outline_rounded,
                                controller: _pass2C,
                                isPassword: true,
                                backgroundColor: fieldBg,
                                textColor: fieldText,
                                iconColor: fieldIcon,
                                borderColor: fieldBorder,
                                labelColor:
                                AppColors.textPrimary(context).withValues(
                                  alpha: 0.85,
                                ),
                                validator: (v) {
                                  final value = v?.trim();
                                  if (value.isNullOrEmpty) {
                                    return 'Şifre tekrarı zorunludur';
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
                                          : () => Navigator.of(context).pop(),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: AppColors.textPrimary(context),
                                        side: BorderSide(
                                          color: AppColors.primary(context)
                                              .withValues(alpha: 0.35),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(14),
                                        ),
                                      ),
                                      child: Text('İptal', style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                                    ),
                                  ),
                                  SizedBox(width: w * 0.03),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: isLoading ? null : _onSend,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        AppColors.primary(context),
                                        foregroundColor: AppColors.textPrimary(context),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(14),
                                        ),
                                      ),
                                      child: const Text('Şifreyi Güncelle'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Loading Overlay
                if (isLoading)
                  Positioned.fill(
                    child: Container(
                      color: AppColors.surface(context).withValues(alpha: 0.5),
                      child: const Center(
                        child: CustomCircularWidget(),
                      ),
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
