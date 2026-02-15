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

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final _formKey = GlobalKey<FormState>();
  final _tokenC = TextEditingController();

  @override
  void dispose() {
    _tokenC.dispose();
    super.dispose();
  }

  void _onSend() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    context.read<PasswordCubit>().verifyUserCode(token: _tokenC.text.trim());
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
          if (state is UserTokenVerified) {
            PopUpUtils.showPopup(
              context,
              true,
              successMessage: 'Kod başarıyla doğrulandı.',
              failureMessage: '',
            );
            // ✅ Burada bir sonraki sayfaya yönlendir
            context.push('/changeUserPassword');
          }

          if (state is UserTokenVerifyError) {
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
                                    Icons.verified_user_rounded,
                                    color: AppColors.textPrimary(context),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Kod Doğrulama',
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
                                  'E-postanıza gelen doğrulama kodunu girin.',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textPrimary(context).withValues(
                                      alpha: 0.85,
                                    ),
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
                                label: 'Onay Kodu',
                                hintText: '8 haneli kod',
                                icon: Icons.key_rounded,
                                controller: _tokenC,
                                backgroundColor: fieldBg,
                                textColor: fieldText,
                                iconColor: fieldIcon,
                                borderColor: fieldBorder,
                                labelColor: AppColors.textPrimary(context).withValues(
                                  alpha: 0.85,
                                ),
                                validator: (v) {
                                  final value = v?.trim();
                                  if (value.isNullOrEmpty) {
                                    return 'Kod zorunludur';
                                  }
                                  if (value!.length != 8) {
                                    return 'Kod 8 haneli olmalıdır';
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
                                          borderRadius: BorderRadius.circular(14),
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
                                        backgroundColor: AppColors.primary(context),
                                        foregroundColor: AppColors.textPrimary(context),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                      ),
                                      child: const Text('Doğrula'),
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
