import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/core/extensions/string_extension.dart';
import 'package:movieapp/presentation/components/widgets/custom_circular_widget.dart';
import 'package:movieapp/presentation/components/widgets/custom_elevated_button_widget.dart';
import 'package:movieapp/presentation/components/widgets/custom_textfield_widget.dart';
import 'package:movieapp/presentation/pages/auth/register/components/widgets/kvkk_checkBox_widget.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_cubit.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_state.dart';
import 'package:movieapp/utils/pop_up_utils.dart';
import 'package:movieapp/utils/screen_utils.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final TextEditingController _nameSurnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleRegister(){
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().registerWithEmail(email: _emailController.text, password: _passwordController.text, displayName: _nameSurnameController.text);
    }
  }

  void _navigateBack(){
    context.pop();
  }

  @override
  void dispose() {
    _nameSurnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController2.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFieldWidget(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Ad Soyad doldurulmadı.';
              }

              return null;
            },
            controller: _nameSurnameController,
            label: 'Ad Soyad',
            hintText: 'Adınızı ve Soyadınızı girin',
            icon: Icons.person_2_outlined,
          ),

          SizedBox(
            height:
                ScreenUtils.getScreenHeight(
                  context,
                ) *
                0.02,
          ),
          CustomTextFieldWidget(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Mail doldurulmadı.';
              }
              if (!value.isValidEmail) {
                return 'Geçerli bir e-posta girin';
              }
              return null;
            },
            label: 'E-Mail',
            hintText: 'E-Mail girin',
            icon: Icons.email_outlined,
            controller: _emailController,
          ),
          SizedBox(
            height:
                ScreenUtils.getScreenHeight(
                  context,
                ) *
                0.02,
          ),
          CustomTextFieldWidget(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Şifre doldurulmadı.';
              }
              if(value.length < 6){
                return '6 karakterden uzun girmelisiniz!';
              }
              return null;
            },
            label: 'Şifre',
            hintText: 'Şifrenizi girin',
            icon: Icons.lock,
            isPassword: true,
            controller: _passwordController,
          ),
          SizedBox(
            height:
                ScreenUtils.getScreenHeight(
                  context,
                ) *
                0.02,
          ),
          CustomTextFieldWidget(
            validator: (String? value) {
              if (value != _passwordController.text) {
                return 'Şifre aynı olmalı!';
              }
              return null;
            },
            label: 'Şifre tekrardan',
            hintText: 'Şifrenizi tekrar girin',
            icon: Icons.lock,
            isPassword: true,
            controller: _passwordController2,
          ),
          SizedBox(
            height:
                ScreenUtils.getScreenHeight(
                  context,
                ) *
                0.02,
          ),
          const KvkkCheckboxWidget(),
          SizedBox(
            height:
                ScreenUtils.getScreenHeight(
                  context,
                ) *
                0.02,
          ),
          // Giriş butonu
          BlocConsumer<AuthCubit,AuthState>(
            listener: (BuildContext context, AuthState state){
              if(state is Authenticated){
                _navigateBack();
                PopUpUtils.showPopup(context, true, successMessage: 'Kayıt başarılı!', failureMessage: '');
              }
              else if(state is AuthError){
                _nameSurnameController.clear();
                _emailController.clear();
                _passwordController.clear();
                _passwordController2.clear();
                PopUpUtils.showPopup(context, false, successMessage: '', failureMessage: state.message);
              }
            },
            builder: (BuildContext context, AuthState state) {
              return CustomElevatedButtonWidget(
                onPressed: state is AuthLoading ? null : _handleRegister,
                backgroundColor: AppColors.primaryColor,

                child: state is AuthLoading ? const CustomCircularWidget() :const Text(
                  'Kayıt ol',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
