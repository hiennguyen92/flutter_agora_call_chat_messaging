import 'package:flutter/material.dart';
import 'package:flutter_agora_call_chat_messaging/pages/login_screen/login_view_model.dart';
import 'package:flutter_hiennv/base/base_stateful.dart';
import 'package:flutter_hiennv/constants/app_textstyles.dart';
import 'package:flutter_hiennv/widgets/keyboard_dismiss/keyboard_dismiss.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends BaseStateful<LoginScreen, LoginViewModel> {
  final _formGlobalKey = GlobalKey<FormState>();
  FocusNode focusUserNode = new FocusNode();
  FocusNode focusPassNode = new FocusNode();

  @override
  Widget buildPageWidget(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context), body: buildPageBody(context));
  }

  void callLogin(BuildContext context) async {
    // await viewModel.callLoginApi(
    //     viewModel.state.username!, viewModel.state.password!);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Text('Login', style: mediumTextStyle()),
    );
  }

  Widget buildPageBody(BuildContext context) {
    return KeyboardDismiss(
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.4),
                border: Border.all(color: Colors.blue, width: 2)),
            child: LayoutBuilder(builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Icon(Icons.gite_sharp, size: 100),
                        color: Colors.blue,
                        height: 200,
                      ),
                      SizedBox(height: 20),
                      Expanded(
                          child: Form(
                        key: _formGlobalKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                focusNode: focusUserNode,
                                initialValue: 'hien@hiennv.com',
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2)),
                                    labelStyle: mediumTextStyle(
                                        fontSize:
                                            focusUserNode.hasFocus ? 18.0 : 14),
                                    labelText: 'Username',
                                    prefixIcon: Icon(Icons.gite)),
                                validator: viewModel.usernameValidator,
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                  focusNode: focusPassNode,
                                  initialValue: '123456',
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      labelStyle: mediumTextStyle(
                                          fontSize: focusPassNode.hasFocus
                                              ? 18.0
                                              : 14),
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.password)),
                                  validator: viewModel.passwordValidator,
                                  obscureText: true),
                              SizedBox(height: 10),
                              ElevatedButton(
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.focused))
                                      return Colors.red;
                                    return Colors.blue;
                                  }),
                                ),
                                onPressed: () {
                                  if (_formGlobalKey.currentState!.validate()) {
                                    callLogin(context);
                                  }
                                },
                                child: Text('Login'),
                              ),
                            ],
                          ),
                        ),
                      ))
                    ],
                  )),
                ),
              );
            })));
  }
}
