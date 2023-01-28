import 'package:flutter_agora_call_chat_messaging/ui/home_screen.dart';
import 'package:flutter_agora_call_chat_messaging/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {

  static const splashScreen = '/splash_screen';

  static const homeScreen = '/home_screen';

  static const settingScreen = '/setting_screen';


  static Route<Object>? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }

}