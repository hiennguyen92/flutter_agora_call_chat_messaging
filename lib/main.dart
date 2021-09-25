
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agora_call_chat_messaging/app_route.dart';
import 'package:flutter_agora_call_chat_messaging/configs/app_config.dart';
import 'package:flutter_agora_call_chat_messaging/services/authentication_api_service_impl.dart';
import 'package:flutter_hiennv/app_multiprovider.dart';
import 'package:flutter_hiennv/base/base_application.dart';
import 'package:flutter_hiennv/services/auth/authentication_api_service.dart';
import 'package:flutter_hiennv/services/cache/auth_info.dart';
import 'package:flutter_hiennv/services/network/network_config.dart';
import 'package:flutter_hiennv/services/network/network_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

  AppEnvConfig(envType: EnvType.DEV);

  List<SingleChildWidget> appProviders = <SingleChildWidget>[
    //Provider<DatabaseService>(create: (_) => DatabaseService())
  ];
  runApp(
      AppMultiProvider(application: MainApplication(), appProviders: appProviders));
}

class MainApplication extends BaseApplication<AppRoute> {
  @override
  AppRoute appRouteProvider() {
    return AppRoute.instance;
  }

  @override
  AuthenticationApiService authenticationApiServiceProvider(NetworkService networkService, AuthInfo authInfo) {
    return AuthenticationApiServiceImpl(networkService, authInfo);
  }

  @override
  NetworkConfig networkConfig() {
    return AppEnvConfig.instance.networkConfig;
  }

  @override
  State<StatefulWidget> createState() {
    return _MainApplicationState();
  }
}

class _MainApplicationState extends BaseApplicationState<MainApplication> {

  @override
  void afterOpenAppHasAuthInfo(BuildContext context, AuthInfo authInfo) {
    navigationService.pushNamedAndRemoveUntil(AppRoute.homeScreen);
  }

  @override
  Widget getApp(BuildContext context) {
    AppRoute appRoute = Provider.of<AppRoute>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      onGenerateRoute: appRoute.generateRoute,
      initialRoute: AppRoute.splashScreen,
      navigatorKey: navigationService.navigationKey,
      navigatorObservers: <NavigatorObserver>[navigationService.routeObserver],
    );
  }

}