import 'package:easy_chat/app/router/app_routes.dart';
import 'package:easy_chat/app/theming/app_colors.dart';
import 'package:easy_chat/core/shared/widgets/auth_button.dart';
import 'package:easy_chat/core/shared/widgets/auth_header.dart';
import 'package:easy_chat/core/shared/widgets/auth_text_button.dart';
import 'package:easy_chat/core/shared/widgets/auth_text_field.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                  BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                    listener: (context, state) {
                      if (state is ForgotPasswordSuccess) {
                        Navigator.pushReplacementNamed(context, AppRoutes.signIn.route);
                      } else if (state is ForgotPasswordFailure) {
                        Fluttertoast.showToast(msg: state.message, backgroundColor: Theme.of(context).primaryColor, textColor: AppColors.whiteColor, fontSize: 16);
                      }
                    },
                    builder: (context, state) {
                      return Center(
                        child: AuthButton(text: "Send Email", onPressed: forgotPasswordCubit.sendEmail, isLoading: state is ForgotPasswordLoading),
                      );
                    },
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
