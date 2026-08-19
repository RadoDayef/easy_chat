import 'package:easy_chat/app/theming/app_colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const AuthButton({super.key, this.isLoading = false, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: theme.elevatedButtonTheme.style,
      child: isLoading ? CircularProgressIndicator(color: AppColors.whiteColor) : Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    );
  }
}
