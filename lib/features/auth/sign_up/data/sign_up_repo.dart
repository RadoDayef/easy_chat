import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_chat/core/shared/logic/api_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  Future<ApiResult<bool>> signUpWithEmailAndPassword(String email, String password, {required String name}) async {
    try {
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        credential.user!.sendEmailVerification();
        await FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set({"uid": credential.user!.uid, "name": name, "email": email});
        await FirebaseAuth.instance.signOut();
        return ApiResultSuccess(true);
      } else {
        return ApiResultFailure("Couldn't Sign Up With Email & Password");
      }
    } catch (exception) {
      return ApiResultFailure(exception.toString());
    }
  }
}
