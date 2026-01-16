import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/core/extensions/string_extension.dart';

class ResetPasswordDialog extends StatefulWidget {
  const ResetPasswordDialog({
    super.key,
    required this.onSubmit,
  });

  final Future<void> Function(String email) onSubmit;

  @override
  State<ResetPasswordDialog> createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends State<ResetPasswordDialog> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  bool _loading = false;
  bool _success = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    setState(() {
      _errorMessage = null;
      _success = false;
    });

    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    try {
      await widget.onSubmit(_emailController.text.trim());
      if (!mounted) return;
      setState(() => _success = true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _errorMessage = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      labelText: 'E-posta',
      hintText: 'ornek@mail.com',
      hintStyle: const TextStyle(color: AppColors.textMuted),
      labelStyle: const TextStyle(color: AppColors.textFieldLabel),
      prefixIcon: const Icon(Icons.mail_outline, color: AppColors.textFieldIcon),
      filled: true,
      fillColor: AppColors.textFieldFill,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.textFieldBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(0.7)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primaryColor.withOpacity(0.9), width: 1.2),
      ),
      errorStyle: const TextStyle(color: AppColors.primaryColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: radius),
        backgroundColor: AppColors.cardDark,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Şifre Sıfırlama',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      IconButton(
                        splashRadius: 20,
                        onPressed: _loading ? null : () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: AppColors.textColor),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'E-posta adresini gir. Şifre yenileme bağlantısını göndereceğiz.',
                      style: TextStyle(fontSize: 13, color: AppColors.textMuted),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Form
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _handleSubmit(),
                      style: const TextStyle(color: AppColors.textFieldText),
                      cursorColor: AppColors.primaryColor,
                      decoration: _inputDecoration(),
                      validator: (value) {
                        if (value.isNullOrEmpty) return 'E-posta boş olamaz';
                        if (!value!.trim().isValidEmail) return 'Geçerli bir e-posta gir';
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Error box (dark)
                  if (!_errorMessage.isNullOrEmpty) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.primaryColor.withOpacity(0.45)),
                      ),
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],

                  // Success box (dark)
                  if (_success) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white.withOpacity(0.14)),
                      ),
                      child: const Text(
                        'Bağlantı gönderildi! Gelen kutunu (ve spam) kontrol et.',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _loading ? null : () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: const BorderSide(color: AppColors.primaryColor),
                            foregroundColor: AppColors.textColor,
                          ),
                          child: const Text('İptal'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _loading ? null : _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.textColor,
                          ),
                          child: _loading
                              ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.textColor),
                            ),
                          )
                              : const Text('Gönder'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
