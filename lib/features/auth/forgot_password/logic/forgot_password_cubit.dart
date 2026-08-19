import 'package:easy_chat/core/shared/logic/api_result.dart';
import 'package:easy_chat/features/auth/forgot_password/data/forgot_password_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo _repo;

  ForgotPasswordCubit(this._repo) : super(ForgotPasswordInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  void sendEmail() async {
    emit(ForgotPasswordLoading());
    if (formKey.currentState!.validate()) {
      ApiResult<bool> result = await _repo.sendResetPasswordEmail(emailController.text);
      if (result is ApiResultSuccess) {
        emit(ForgotPasswordSuccess());
      } else {
        emit(ForgotPasswordFailure((result as ApiResultFailure).message));
      }
    }
  }
}
