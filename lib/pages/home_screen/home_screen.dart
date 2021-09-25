import 'package:flutter/material.dart';
import 'package:flutter_agora_call_chat_messaging/pages/home_screen/home_view_model.dart';
import 'package:flutter_hiennv/base/base_stateful.dart';
import 'package:flutter_hiennv/constants/app_textstyles.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BaseStateful<HomeScreen, HomeViewModel> {
  @override
  Widget buildPageWidget(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: buildPageBody(context),
        floatingActionButton: buildFloatingActionButton(context));
  }

  void onLogout(int item) {
    viewModel.logout();
  }

  void handleClickFloatingButton() {
    //viewModel.increase();
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Text('Home Screen', style: mediumTextStyle()),
      actions: [
        PopupMenuButton<int>(
          onSelected: (item) => onLogout(item),
          itemBuilder: (_) => [
            PopupMenuItem(
                enabled: true,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.logout, color: Colors.white),
                    Text(' Logout',
                        style: regularTextStyle(color: Colors.white)),
                  ],
                ),
                value: 0)
          ],
        )
      ],
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: handleClickFloatingButton,
      tooltip: "Increase",
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        color: Colors.blue,
      ),
    );
  }

  Widget buildPageBody(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.4),
            border: Border.all(color: Colors.blue, width: 2)),
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
