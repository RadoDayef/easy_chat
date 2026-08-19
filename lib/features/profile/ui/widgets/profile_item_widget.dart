import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({super.key, required this.text, required this.icon, required this.onTap});

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: .all(24),
        decoration: BoxDecoration(
          border: Border.all(color: theme.primaryColor, width: 2),
          borderRadius: .circular(24),
        ),
        child: Row(
          children: [
            Text(text, style: theme.textTheme.bodyLarge),
            Spacer(),
            Icon(icon, color: theme.primaryColor, size: 24),
          ],
        ),
      ),
    );
  }
}
