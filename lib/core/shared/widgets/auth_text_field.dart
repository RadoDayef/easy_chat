import 'package:easy_chat/app/theming/app_colors.dart';
import 'package:easy_chat/core/shared/logic/visibility_cubit.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final String validatorMessage;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const AuthTextField({super.key, required this.label, this.isPassword = false, required this.controller, required this.keyboardType, required this.validatorMessage});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Widget textField({bool obscureText = false}) {
      return TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        style: theme.textTheme.displaySmall,
        cursorColor: AppColors.primaryLightColor,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: theme.primaryColor),
                  onPressed: context.read<VisibilityCubit>().toggleVisibility,
                )
              : null,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMessage;
          }
          return null;
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.displaySmall),
        5.vGap,
        if (isPassword)
          BlocBuilder<VisibilityCubit, bool>(
            builder: (context, isVisible) {
              return textField(obscureText: isVisible);
            },
          )
        else
          textField(),
      ],
    );
  }
}
