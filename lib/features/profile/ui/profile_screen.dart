import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_chat/app/router/app_routes.dart';
import 'package:easy_chat/core/shared/logic/theme_cubit.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/profile/ui/widgets/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isDark = context.select((ThemeCubit cubit) => cubit.state == ThemeMode.dark);
    return Padding(
      padding: .symmetric(horizontal: 16),
      child: Column(
        children: [
          24.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(radius: 50, backgroundImage: CachedNetworkImageProvider("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")),
              24.hGap,
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: .all(16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.primaryColor, width: 2),
                        borderRadius: .circular(24),
                      ),
                      child: Text("Mourad Ashraf Dayef", textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1, style: theme.textTheme.headlineLarge),
                    ),
                    6.vGap,
                    SizedBox(
                      child: Text("rado.dayef@gmail.com", textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1, style: theme.textTheme.bodySmall),
                    ),
                  ],
                ),
              ),
            ],
          ),
          50.vGap,
          ProfileItemWidget(text: "Edit Your Profile", icon: Icons.edit_road, onTap: () {}),
          50.vGap,
          ProfileItemWidget(text: "Change Your Password", icon: Icons.password, onTap: () {}),
          50.vGap,
          ProfileItemWidget(
            text: "Theme Mode",
            icon: isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            onTap: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
          50.vGap,
          ProfileItemWidget(
            text: "Log Out",
            icon: Icons.logout_rounded,
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.signIn.route);
            },
          ),
        ],
      ),
    );
  }
}
