import 'package:easy_chat/app/router/app_routes.dart';
import 'package:easy_chat/core/shared/widgets/auth_button.dart';
import 'package:easy_chat/core/shared/widgets/auth_header.dart';
import 'package:easy_chat/core/shared/widgets/auth_text_button.dart';
import 'package:easy_chat/core/shared/widgets/auth_text_field.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordCubit forgotPasswordCubit = context.read<ForgotPasswordCubit>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: .all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(title: "Password Recovery", description: "Enter your email and we'll help you reset your password.", imagePath: "assets/images/avatar.png"),
                  75.vGap,
                  Form(
                    key: forgotPasswordCubit.formKey,
                    child: AuthTextField(label: "Email", controller: forgotPasswordCubit.emailController, keyboardType: .emailAddress, validatorMessage: "Must be enter the Email"),
                  ),
                  25.vGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [AuthButton(text: "Send Email", onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.signIn.route))],
                  ),
                  25.vGap,
                  AuthTextButton(actionText: "Sign In", question: "Remembered my password? ", onActionPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.signIn.route)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
