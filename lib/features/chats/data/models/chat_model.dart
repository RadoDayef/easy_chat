import 'package:easy_chat/features/chats/data/models/message_model.dart';

class ChatModel {
  final String name, image;
  final MessageModel lastMessage;

  ChatModel({required this.name, required this.image, required this.lastMessage});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(name: json["name"], image: json["image"], lastMessage: MessageModel.fromJson(json["lastMessage"]));
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "image": image, "lastMessage": lastMessage.toJson()};
  }
}
