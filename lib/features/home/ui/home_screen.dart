import 'package:easy_chat/core/dependency_injection/dependency_injection.dart';
import 'package:easy_chat/core/utils/extensions/context_extensions.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/chats/logic/chats_cubit/chats_cubit.dart';
import 'package:easy_chat/features/chats/ui/chats_screen.dart';
import 'package:easy_chat/features/profile/ui/profile_screen.dart';
import 'package:easy_chat/features/search/logic/search_cubit.dart';
import 'package:easy_chat/features/search/ui/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text("Easy Chat", style: theme.textTheme.displayMedium),
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Center(
                child: TabBar(
                  indicatorWeight: 2,
                  indicatorSize: .label,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.center,
                  indicatorColor: theme.primaryColor,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: .all(Colors.transparent),
                  labelStyle: theme.textTheme.headlineLarge,
                  unselectedLabelStyle: theme.textTheme.headlineMedium,
                  labelPadding: .symmetric(horizontal: context.screenWidth / 15),
                  tabs: [
                    Tab(text: "Chats"),
                    Tab(text: "Search"),
                    Tab(text: "Profile"),
                  ],
                ),
              ),
            ),
            24.vGap,
            Expanded(
              child: TabBarView(
                children: [
                  BlocProvider(create: (context) => DependencyInjection.getIt<ChatsCubit>(), child: ChatsScreen()),
                  BlocProvider(create: (context) => DependencyInjection.getIt<SearchCubit>(), child: SearchScreen()),
                  ProfileScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
