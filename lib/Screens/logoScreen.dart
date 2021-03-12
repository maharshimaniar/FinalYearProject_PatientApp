import '../Providers/userProvider.dart';
import '../Screens/baseScreen.dart';
import '../Screens/loginPage.dart';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';


class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    bool _login = Provider.of<UserProvider>(context).isUserSignedIn;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ScaleAnimatedWidget.tween(
              enabled: true,
              duration: Duration(milliseconds: 600),
              scaleDisabled: 0.5,
              scaleEnabled: 1,
              curve: Curves.linear,
              child: Container(
                height: 200,
                width: 200,
                child: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                ),
              ),
              animationFinished: (_) {
                Timer(Duration(seconds: 2), () {
                  _login
                      ? Navigator.of(context)
                          .pushReplacementNamed(BasePage.routeName)                      : Navigator.of(context)
                          .pushReplacementNamed(LoginPage.routeName);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
