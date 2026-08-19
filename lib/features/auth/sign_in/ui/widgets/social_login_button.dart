import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;

  const SocialLoginButtons({super.key, this.onGooglePressed, this.onFacebookPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onFacebookPressed,
          child: Image.asset("assets/images/facebook.png", height: 50, width: 50, fit: BoxFit.contain),
        ),
        25.hGap,
        InkWell(
          onTap: onGooglePressed,
          child: Image.asset("assets/images/google.png", height: 40, width: 40, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
