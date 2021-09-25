import 'package:flutter/material.dart';
import 'package:flutter_hiennv/base/auth_view_model.dart';
import 'package:flutter_hiennv/base/base_view_state.dart';

class LoginViewModel extends AuthViewModel<LoginViewState> {

  LoginViewModel(BuildContext context) : super(context, LoginViewState());



  String? usernameValidator(value) {
    state.username = value;
    if (!state.usernameIsValid()) {
      return 'Please enter username';
    }
    return null;
  }

  String? passwordValidator(value) {
    state.password = value;
    if (!state.passwordIsValid()) {
      return 'Please enter password';
    }
    return null;
  }

}



class LoginViewState extends BaseViewState {

  String? username;
  String? password;

  bool usernameIsValid() {
    if (username == null || (username != null && username!.isEmpty)) {
      return false;
    }
    return true;
  }

  bool passwordIsValid() {
    if (password == null || (password != null && password!.isEmpty)) {
      return false;
    }
    return true;
  }

}