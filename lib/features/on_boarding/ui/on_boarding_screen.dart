import 'package:easy_chat/app/router/app_routes.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: .all(24),
              child: Column(
                children: [
                  Text("Get Closer To EveryOne", style: theme.textTheme.displayLarge),
                  25.vGap,
                  Text("Helps you to contact everyone with just easy way", style: theme.textTheme.displaySmall),
                  25.vGap,
                  Image.asset("assets/images/intro.png", width: .infinity, fit: .cover),
                  25.vGap,
                  ElevatedButton(
                    style: theme.elevatedButtonTheme.style,
                    onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.signIn.route),
                    child: Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
