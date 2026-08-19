import 'package:easy_chat/features/chats/data/chats_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final ChatsRepo _repo;

  ChatsCubit(this._repo) : super(ChatsLoading());
}
