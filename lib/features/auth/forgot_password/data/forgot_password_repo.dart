import 'package:easy_chat/core/shared/logic/api_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordRepo {
  Future<ApiResult<bool>> sendResetPasswordEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return ApiResultSuccess(true);
    } catch (exception) {
      return ApiResultFailure(exception.toString());
    }
  }
}
