import 'package:easy_chat/core/utils/extensions/date_time_extension.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/chats/data/models/message_model.dart';
import 'package:flutter/material.dart';

class ReceivedMessageWidget extends StatelessWidget {
  final MessageModel message;

  const ReceivedMessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: .only(top: 12, left: 12, right: 50),
      padding: .all(12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.primaryColor, width: 2),
        borderRadius: .only(topRight: .circular(24), bottomRight: .circular(24), bottomLeft: .circular(24)),
      ),
      child: Column(
        children: [
          Text(message.text, style: theme.textTheme.bodyMedium),
          4.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text(message.time.chatFormat, style: theme.textTheme.bodySmall)],
          ),
        ],
      ),
    );
  }
}
