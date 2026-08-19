import 'package:easy_chat/app/easy_chat.dart';
import 'package:easy_chat/core/dependency_injection/dependency_injection.dart';
import 'package:easy_chat/core/shared/logic/theme_cubit.dart';
import 'package:easy_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DependencyInjection.setUp();
  runApp(BlocProvider(create: (_) => DependencyInjection.getIt<ThemeCubit>(), child: EasyChat()));
}
