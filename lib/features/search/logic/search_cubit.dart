import 'package:easy_chat/features/search/data/search_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _repo;

  SearchCubit(this._repo) : super(SearchInitial());

  TextEditingController controller = TextEditingController();
}
