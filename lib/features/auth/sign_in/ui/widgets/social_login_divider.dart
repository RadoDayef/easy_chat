import 'package:flutter/material.dart';

class SocialLoginDivider extends StatelessWidget {
  final String text;

  const SocialLoginDivider({super.key, this.text = "Or Login with"});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(thickness: 0.7)),
        Padding(
          padding: .symmetric(horizontal: 12),
          child: Text(text, style: theme.textTheme.displaySmall),
        ),
        Expanded(child: Divider(thickness: 0.7)),
      ],
    );
  }
}
