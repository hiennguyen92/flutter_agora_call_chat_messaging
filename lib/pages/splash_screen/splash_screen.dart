import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_agora_call_chat_messaging/app_route.dart';
import 'package:flutter_hiennv/services/ui/app_navigation_service.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 3), () {
        if (mounted) {
          Provider.of<AppNavigationService>(context, listen: false)
              .pushNamedAndRemoveUntil(AppRoute.loginScreen);
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: Icon(Icons.image, color: Colors.blue),
    );
  }
  
}