
import 'package:flutter/material.dart';
import 'package:flutter_agora_call_chat_messaging/app_route.dart';
import 'package:flutter_agora_call_chat_messaging/services/navigation_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          return new MaterialApp(
              theme: ThemeData.light(),
              onGenerateRoute: AppRoute.generateRoute,
              initialRoute: AppRoute.splashScreen,
              navigatorKey: NavigationService.navigationKey
          );
        });
  }


}
