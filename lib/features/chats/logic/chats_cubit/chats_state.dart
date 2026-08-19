part of 'chats_cubit.dart';

abstract class ChatsState {}

final class ChatsLoading extends ChatsState {}

final class ChatsSuccess extends ChatsState {}

final class ChatsFailure extends ChatsState {
  final String message;

  ChatsFailure(this.message);
}
