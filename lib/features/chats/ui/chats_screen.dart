import 'package:easy_chat/core/utils/extensions/num_extensions.dart';
import 'package:easy_chat/features/chats/data/models/chat_model.dart';
import 'package:easy_chat/features/chats/data/models/message_model.dart';
import 'package:easy_chat/features/chats/ui/widgets/chat_widget.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(16),
      child: ListView.separated(
        itemCount: chats.length,
        itemBuilder: (_, int index) {
          final ChatModel chat = chats[index];
          return ChatWidget(chat);
        },
        separatorBuilder: (_, _) {
          return 12.vGap;
        },
      ),
    );
  }
}

List<ChatModel> chats = [
  ChatModel(
    name: "John Doe",
    lastMessage: MessageModel(text: "Hello, How are you ?", time: DateTime.now().subtract(4.min), isMe: false, isRead: true),
    image: "https://www.mnp.ca/-/media/foundation/integrations/personnel/2020/12/16/13/57/personnel-image-4483.jpg?h=800&iar=0&w=600&hash=833D605FDB6AC3C2D2915F6BF8B4ADA4",
  ),
  ChatModel(
    name: "Harry Potter",
    image: "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",
    lastMessage: MessageModel(text: "Let's go to Hogwarts!", time: DateTime.now().subtract(6.min), isMe: false, isRead: true),
  ),
  ChatModel(
    name: "Laila Ahmed",
    lastMessage: MessageModel(text: "Go to Easy Learn Academy!", time: DateTime.now().subtract(10.min), isMe: false, isRead: false),
    image: "https://www.fluentu.com/blog/wp-content/uploads/site//4/african-american-young-mom-with-curly-hair-in-stylish-outfit-feeling-grateful-and-happy-receiving-surprise-gift-from-kid-holding-palms-on-heart-smiling.jpg",
  ),
];
