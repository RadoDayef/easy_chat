import 'package:easy_chat/core/shared/logic/api_result.dart';
import 'package:easy_chat/features/auth/sign_in/data/sign_in_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInRepo _repo;

  SignInCubit(this._repo) : super(SignInInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() async {
    emit(SignInLoading());
    if (formKey.currentState!.validate()) {
      ApiResult<bool> result = await _repo.signInWithEmailAndPassword(emailController.text, passwordController.text);
      if (result is ApiResultSuccess) {
        emit(SignInSuccess());
      } else {
        emit(SignInFailure((result as ApiResultFailure).message));
      }
    }
  }
}
