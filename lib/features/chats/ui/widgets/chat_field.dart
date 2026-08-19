import 'package:easy_chat/app/theming/app_colors.dart';
import 'package:easy_chat/core/shared/logic/theme_cubit.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatField extends StatelessWidget {
  final VoidCallback onSend;
  final TextEditingController controller;

  const ChatField({required this.onSend, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isDark = context.select((ThemeCubit cubit) => cubit.state == ThemeMode.dark);
    return Container(
      padding: .all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.blackColor : AppColors.whiteColor,
        borderRadius: .only(topLeft: .circular(24), topRight: Radius.circular(24)),
        boxShadow: [BoxShadow(color: isDark ? AppColors.whiteColor.withAlpha(100) : AppColors.blackColor.withOpacity(0.15), blurRadius: 8, offset: Offset(0, -2))],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                12.hGap,
                IconButton(
                  onPressed: onSend,
                  icon: Icon(Icons.send, color: theme.primaryColor, size: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
