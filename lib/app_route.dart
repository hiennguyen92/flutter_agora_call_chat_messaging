
import 'package:flutter/material.dart';
import 'package:flutter_agora_call_chat_messaging/pages/home_screen/home_screen.dart';
import 'package:flutter_agora_call_chat_messaging/pages/home_screen/home_view_model.dart';
import 'package:flutter_agora_call_chat_messaging/pages/login_screen/login_screen.dart';
import 'package:flutter_agora_call_chat_messaging/pages/login_screen/login_view_model.dart';
import 'package:flutter_agora_call_chat_messaging/pages/splash_screen/splash_screen.dart';
import 'package:flutter_hiennv/base/base_app_route.dart';
import 'package:flutter_hiennv/base/base_material_page_route.dart';

class AppRoute extends BaseAppRoute {

  static final AppRoute _instance = AppRoute._private();
  factory AppRoute() {
    return _instance;
  }
  AppRoute._private();

  static AppRoute get instance => _instance;

  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
  static const homeScreen = '/homeScreen';

  @override
  Route<Object>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return AppPageRoute(
            appSettings: settings, builder: (_) => SplashScreen());
      case loginScreen:
        return AppPageRoute(
            appSettings: settings,
            builder: (_) => createProviderByPage(
                ((BuildContext context) => LoginViewModel(context)),
                LoginScreen()));
      case homeScreen:
        return AppPageRoute(
            appSettings: settings,
            builder: (_) => createProviderByPage(
                ((BuildContext context) => HomeViewModel(context)),
                HomeScreen()));
    }
  }

}

class AppPageRoute extends BaseMaterialPageRoute {
  AppPageRoute({required WidgetBuilder builder, RouteSettings? appSettings})
      : super(builder: builder, appSettings: appSettings);
}