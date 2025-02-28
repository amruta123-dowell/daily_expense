import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_expense/data/api_result.dart';

import '../utils/progress_dialog_widget.dart';

class ApiProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<ApiResult<UserCredential>> signup(
      {required String email, required String password}) async {
    try {
      ProgressDialogUtils.showProgressDialog();

      UserCredential response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseFirestore.instance.databaseId;
      response.user;
      String? token = await response.user?.getIdToken();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    } finally {
      ProgressDialogUtils.hideProgressDialog();
    }
  }

  Future<ApiResult<UserCredential>> signIn(
      {required String email, required String password}) async {
    try {
      ProgressDialogUtils.showProgressDialog();
      UserCredential response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      response.user;
      String? token = await response.user?.getIdToken();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    } finally {
      ProgressDialogUtils.hideProgressDialog();
    }
  }
}
