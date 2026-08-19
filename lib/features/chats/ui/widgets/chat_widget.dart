import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_chat/app/router/app_routes.dart';
import 'package:easy_chat/core/utils/extensions/context_extensions.dart';
import 'package:easy_chat/core/utils/extensions/date_time_extension.dart';
import 'package:easy_chat/features/chats/data/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final ChatModel chat;

  const ChatWidget(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ListTile(
      contentPadding: .symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(24),
        side: BorderSide(color: theme.primaryColor, width: 2),
      ),
      onTap: () => Navigator.pushNamed(context, AppRoutes.chat.route, arguments: chat),
      leading: CircleAvatar(radius: context.screenWidth / 15, backgroundImage: CachedNetworkImageProvider(chat.image)),
      title: Text(chat.name, style: theme.textTheme.bodyLarge),
      subtitle: Row(
        children: [
          Icon(chat.lastMessage.isRead ? Icons.check_circle : Icons.check_circle_outline, color: Colors.green, size: context.screenWidth / 20),
          SizedBox(width: 5),
          SizedBox(
            width: context.screenWidth / 3,
            child: Text(chat.lastMessage.text, overflow: TextOverflow.ellipsis, maxLines: 1, style: theme.textTheme.bodyMedium),
          ),
        ],
      ),
      trailing: Text(chat.lastMessage.time.chatFormat, style: theme.textTheme.bodyMedium),
    );
  }
}
