import 'package:easy_chat/core/utils/extensions/date_time_extension.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/chats/data/models/message_model.dart';
import 'package:flutter/material.dart';

class SentMessageWidget extends StatelessWidget {
  final MessageModel message;

  const SentMessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: .all(16),
      margin: .only(top: 12, left: 50, right: 12),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: .only(topLeft: .circular(24), bottomRight: .circular(24), bottomLeft: .circular(24)),
      ),
      child: Column(
        children: [
          Text(message.text, style: theme.textTheme.titleMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(message.time.chatFormat, style: theme.textTheme.titleSmall),
              4.vGap,
              Icon(message.isRead ? Icons.done_all : Icons.done, color: message.isRead ? Colors.green : Colors.grey, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
