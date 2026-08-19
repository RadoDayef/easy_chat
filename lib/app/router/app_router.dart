import 'package:easy_chat/app/router/app_routes.dart';
import 'package:easy_chat/core/dependency_injection/dependency_injection.dart';
import 'package:easy_chat/core/shared/logic/visibility_cubit.dart';
import 'package:easy_chat/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:easy_chat/features/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:easy_chat/features/auth/sign_in/logic/sign_in_cubit.dart';
import 'package:easy_chat/features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:easy_chat/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:easy_chat/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:easy_chat/features/chats/data/models/chat_model.dart';
import 'package:easy_chat/features/chats/logic/chat_cubit/chat_cubit.dart';
import 'package:easy_chat/features/chats/ui/chat_screen.dart';
import 'package:easy_chat/features/home/ui/home_screen.dart';
import 'package:easy_chat/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  AppRouter._();

  static Route onGeneratedRoute(RouteSettings settings) {
    switch (AppRoutes.fromRoute(settings.name)) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => DependencyInjection.getIt<SignInCubit>()),
              BlocProvider(create: (_) => DependencyInjection.getIt<VisibilityCubit>()),
            ],
            child: SignInScreen(),
          ),
        );
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => DependencyInjection.getIt<SignUpCubit>()),
              BlocProvider(create: (_) => DependencyInjection.getIt<VisibilityCubit>()),
            ],
            child: SignUpScreen(),
          ),
        );
      case AppRoutes.chat:
        final ChatModel chat = settings.arguments as ChatModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DependencyInjection.getIt<ChatCubit>(param1: chat),
            child: ChatScreen(chat),
          ),
        );
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (_) => DependencyInjection.getIt<ForgotPasswordCubit>(), child: ForgotPasswordScreen()),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
