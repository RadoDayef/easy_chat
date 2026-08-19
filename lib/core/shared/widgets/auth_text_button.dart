import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String question;
  final String actionText;
  final VoidCallback onActionPressed;

  const AuthTextButton({super.key, required this.question, required this.actionText, required this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question, style: theme.textTheme.displaySmall),
        InkWell(
          onTap: onActionPressed,
          child: Text(actionText, style: theme.textTheme.displaySmall!.copyWith(color: theme.primaryColor)),
        ),
      ],
    );
  }
}
