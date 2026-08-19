import 'package:easy_chat/features/chats/data/chat_repo.dart';
import 'package:easy_chat/features/chats/data/models/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _repo;
  final ChatModel chat;

  ChatCubit(this._repo, {required this.chat}) : super(ChatLoading());

  TextEditingController controller = TextEditingController();
}
