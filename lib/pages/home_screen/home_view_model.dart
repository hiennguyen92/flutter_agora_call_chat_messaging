import 'package:flutter/material.dart';
import 'package:flutter_agora_call_chat_messaging/app_route.dart';
import 'package:flutter_hiennv/base/base_view_model.dart';
import 'package:flutter_hiennv/base/base_view_state.dart';



class HomeViewModel extends BaseViewModel<HomeViewState> {
  HomeViewModel(BuildContext context) : super(context, HomeViewState());



  void logout() async {
    await authInfo.clear();
    appNavigationService.pushNamedAndRemoveUntil(AppRoute.loginScreen);
  }

}

class HomeViewState extends BaseViewState {

}