import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/chats/data/models/chat_model.dart';
import 'package:easy_chat/features/chats/data/models/message_model.dart';
import 'package:easy_chat/features/chats/logic/chat_cubit/chat_cubit.dart';
import 'package:easy_chat/features/chats/ui/widgets/chat_field.dart';
import 'package:easy_chat/features/chats/ui/widgets/received_message_widget.dart';
import 'package:easy_chat/features/chats/ui/widgets/sent_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  final ChatModel chat;

  const ChatScreen(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(radius: 24, backgroundImage: CachedNetworkImageProvider(chat.image)),
            20.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(chat.name, style: theme.textTheme.displaySmall)],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: messages.length,
              itemBuilder: (_, int index) {
                final MessageModel message = messages[index];
                return message.isMe ? SentMessageWidget(message) : ReceivedMessageWidget(message);
              },
              separatorBuilder: (_, _) {
                return 10.vGap;
              },
            ),
          ),
          ChatField(controller: context.read<ChatCubit>().controller, onSend: () {}),
        ],
      ),
    );
  }
}

List<MessageModel> messages = [
  MessageModel(text: "Thank you so much for your time and support. I am looking forward to your reply.", time: DateTime.now().subtract(4.min), isMe: true, isRead: true),
  MessageModel(text: "Thank you so much for your time and support. I am looking forward to your reply.", time: DateTime.now().subtract(6.min), isMe: false, isRead: true),
];
