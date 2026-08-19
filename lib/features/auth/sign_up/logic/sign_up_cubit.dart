import 'package:easy_chat/core/shared/logic/api_result.dart';
import 'package:easy_chat/features/auth/sign_up/data/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _repo;

  SignUpCubit(this._repo) : super(SignUpInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp() async {
    emit(SignUpLoading());
    if (formKey.currentState!.validate()) {
      ApiResult<bool> result = await _repo.signUpWithEmailAndPassword(emailController.text, passwordController.text, name: nameController.text);
      if (result is ApiResultSuccess) {
        emit(SignUpSuccess());
      } else {
        emit(SignUpFailure((result as ApiResultFailure).message));
      }
    }
  }
}
