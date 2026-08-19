import 'package:easy_chat/app/router/app_router.dart';
import 'package:easy_chat/app/theming/dark_theme.dart';
import 'package:easy_chat/app/theming/light_theme.dart';
import 'package:easy_chat/core/shared/logic/theme_cubit.dart';
import 'package:easy_chat/core/utils/constants/app_constants.dart';
import 'package:easy_chat/core/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EasyChat extends StatelessWidget {
  const EasyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        return MaterialApp(
          builder: (context, child) {
            final double baseScale = (context.screenWidth / 375).clamp(0.85, 1.25);
            final double systemFactor = context.mq.textScaler.scale(baseScale);
            final double tunedFactor = (systemFactor * baseScale) * (context.screenWidth >= 600 ? 1.05 : 1.0);
            return MediaQuery(
              data: context.mq.copyWith(textScaler: TextScaler.linear(tunedFactor)),
              child: child!,
            );
          },
          themeMode: mode,
          theme: AppLightTheme.theme,
          title: AppConstants.appName,
          darkTheme: AppDarkTheme.theme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGeneratedRoute,
        );
      },
    );
  }
}
