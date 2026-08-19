import 'package:easy_chat/core/shared/logic/api_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo {
  Future<ApiResult<bool>> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        if (credential.user!.emailVerified) {
          return ApiResultSuccess(true);
        } else {
          return ApiResultFailure("Email is not verified");
        }
      } else {
        return ApiResultFailure("Couldn't Login With Email & Password");
      }
    } catch (exception) {
      return ApiResultFailure(exception.toString());
    }
  }
}
