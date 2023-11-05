import 'package:auto_route/auto_route.dart';
import 'package:finplan/app/ui/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/router/app_router.dart';
import '../../../app/ui/components/app_button.dart';
import '../../../app/ui/components/app_text_field.dart';
import '../domain/auth_state/auth_cubit.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Войти"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  controller: controllerLogin,
                  labelText: "логин",
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: controllerPassword,
                  labelText: "пароль",
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                AppButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      _onTapToSignIn(context.read<AuthCubit>());
                    }
                  },
                  child: const Text(
                    'Войти',
                    style: AppTextStyle.bold24,
                  ),
                ),
                const SizedBox(height: 16),
                AppButton(
                  backgroundColor: Colors.grey,
                  onPressed: () {
                    context.pushRoute(RegisterRoute());
                  },
                  child: const Text(
                    'Регистрация',
                    style: AppTextStyle.bold24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapToSignIn(AuthCubit authCubit) => authCubit.signIn(
        email: controllerLogin.text,
        password: controllerPassword.text,
      );
}
