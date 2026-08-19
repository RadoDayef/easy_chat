import 'package:easy_chat/app/router/app_routes.dart';
import 'package:easy_chat/app/theming/app_colors.dart';
import 'package:easy_chat/core/shared/widgets/auth_button.dart';
import 'package:easy_chat/core/shared/widgets/auth_header.dart';
import 'package:easy_chat/core/shared/widgets/auth_text_button.dart';
import 'package:easy_chat/core/shared/widgets/auth_text_field.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/auth/sign_in/logic/sign_in_cubit.dart';
import 'package:easy_chat/features/auth/sign_in/ui/widgets/social_login_button.dart';
import 'package:easy_chat/features/auth/sign_in/ui/widgets/social_login_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInCubit signInCubit = context.read<SignInCubit>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: .all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(title: "Hello, Welcome Back", description: "Happy to see you again, to use your account please login first.", imagePath: "assets/images/avatar.png"),
                  75.vGap,
                  Form(
                    key: signInCubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthTextField(label: "Email", controller: signInCubit.emailController, keyboardType: .emailAddress, validatorMessage: "Must be enter the Email"),
                        50.vGap,
                        AuthTextField(isPassword: true, label: "Password", controller: signInCubit.passwordController, keyboardType: .visiblePassword, validatorMessage: "Must be enter the Password"),
                      ],
                    ),
                  ),
                  5.vGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, AppRoutes.forgotPassword.route),
                        child: Text("Forgot Password", style: TextStyle(fontSize: 10, color: AppColors.redColor)),
                      ),
                    ],
                  ),
                  25.vGap,
                  BlocConsumer<SignInCubit, SignInState>(
                    listener: (context, state) {
                      if (state is SignInSuccess) {
                        Navigator.pushReplacementNamed(context, AppRoutes.home.route);
                      } else if (state is SignInFailure) {
                        Fluttertoast.showToast(msg: state.message, backgroundColor: Theme.of(context).primaryColor, textColor: AppColors.whiteColor, fontSize: 16);
                      }
                    },
                    builder: (context, state) {
                      return Center(
                        child: AuthButton(text: "Login", onPressed: signInCubit.signIn, isLoading: state is SignInLoading),
                      );
                    },
                  ),
                  25.vGap,
                  SocialLoginDivider(),
                  25.vGap,
                  SocialLoginButtons(onFacebookPressed: () {}, onGooglePressed: () {}),
                  25.vGap,
                  AuthTextButton(actionText: "Sign Up", question: "Don't have an account? ", onActionPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.signUp.route)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
