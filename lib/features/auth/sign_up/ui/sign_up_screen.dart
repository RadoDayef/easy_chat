import 'package:easy_chat/app/router/app_routes.dart';
import 'package:easy_chat/core/shared/widgets/auth_button.dart';
import 'package:easy_chat/core/shared/widgets/auth_header.dart';
import 'package:easy_chat/core/shared/widgets/auth_text_button.dart';
import 'package:easy_chat/core/shared/widgets/auth_text_field.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpCubit signUpCubit = context.read<SignUpCubit>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: .all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(title: "Hello, Let's Get Started", description: "Create your account and join us today.", imagePath: "assets/images/avatar.png"),
                  75.vGap,
                  Form(
                    key: signUpCubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthTextField(label: "Full Name", controller: signUpCubit.nameController, keyboardType: .name, validatorMessage: "Must be enter the Full Name"),
                        50.vGap,
                        AuthTextField(label: "Email Address", controller: signUpCubit.emailController, keyboardType: .emailAddress, validatorMessage: "Must be enter the Email"),
                        50.vGap,
                        AuthTextField(isPassword: true, label: "Password", controller: signUpCubit.passwordController, keyboardType: .visiblePassword, validatorMessage: "Must be enter the Password"),
                      ],
                    ),
                  ),
                  25.vGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [AuthButton(text: "Sign Up", onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.home.route))],
                  ),
                  25.vGap,
                  AuthTextButton(actionText: "Sign In", question: "Already have an account? ", onActionPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.signIn.route)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
