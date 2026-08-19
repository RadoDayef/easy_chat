import 'package:easy_chat/core/shared/logic/theme_cubit.dart';
import 'package:easy_chat/core/shared/logic/visibility_cubit.dart';
import 'package:easy_chat/features/auth/forgot_password/data/forgot_password_repo.dart';
import 'package:easy_chat/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:easy_chat/features/auth/sign_in/data/sign_in_repo.dart';
import 'package:easy_chat/features/auth/sign_in/logic/sign_in_cubit.dart';
import 'package:easy_chat/features/auth/sign_up/data/sign_up_repo.dart';
import 'package:easy_chat/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:easy_chat/features/chats/data/chat_repo.dart';
import 'package:easy_chat/features/chats/data/chats_repo.dart';
import 'package:easy_chat/features/chats/data/models/chat_model.dart';
import 'package:easy_chat/features/chats/logic/chat_cubit/chat_cubit.dart';
import 'package:easy_chat/features/chats/logic/chats_cubit/chats_cubit.dart';
import 'package:easy_chat/features/profile/data/profile_repo.dart';
import 'package:easy_chat/features/search/data/search_repo.dart';
import 'package:easy_chat/features/search/logic/search_cubit.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  DependencyInjection._();

  static final GetIt getIt = GetIt.instance;

  static void setUp() {
    /// Repos
    getIt.registerLazySingleton<ChatRepo>(() => ChatRepo());
    getIt.registerLazySingleton<ChatsRepo>(() => ChatsRepo());
    getIt.registerLazySingleton<SignInRepo>(() => SignInRepo());
    getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo());
    getIt.registerLazySingleton<SearchRepo>(() => SearchRepo());
    getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo());
    getIt.registerLazySingleton<ForgotPasswordRepo>(() => ForgotPasswordRepo());

    /// Cubits
    getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
    getIt.registerLazySingleton<VisibilityCubit>(() => VisibilityCubit());
    getIt.registerFactory<ChatsCubit>(() => ChatsCubit(getIt<ChatsRepo>()));
    getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt<SignInRepo>()));
    getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpRepo>()));
    getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));
    getIt.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit(getIt<ForgotPasswordRepo>()));
    getIt.registerFactoryParam<ChatCubit, ChatModel, void>((chat, _) => ChatCubit(getIt<ChatRepo>(), chat: chat));
  }
}
