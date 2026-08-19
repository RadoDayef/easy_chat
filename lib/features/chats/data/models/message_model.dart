class MessageModel {
  final String text;
  final DateTime time;
  final bool isMe, isRead;

  MessageModel({required this.text, required this.time, required this.isMe, required this.isRead});

  Map<String, dynamic> toJson() {
    return {"text": text, "time": time, "isMe": isMe, "isRead": isRead};
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(text: json["text"], time: json["time"], isMe: json["isMe"], isRead: json["isRead"]);
  }
}
