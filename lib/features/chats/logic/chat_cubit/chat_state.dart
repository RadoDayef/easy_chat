part of 'chat_cubit.dart';

abstract class ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSuccess extends ChatState {}

final class ChatFailure extends ChatState {
  final String massage;

  ChatFailure(this.massage);
}
