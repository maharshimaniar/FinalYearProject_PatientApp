import 'package:FinalProject/Screens/baseScreen.dart';
import 'package:FinalProject/Screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../Methods/sign_in.dart';

class SplashScreenWidget extends StatelessWidget {
  static const routeName = '/splashScreen';
  @override

  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: Aftersplash(),
      image: new Image.asset('assets/img/logo.jpg'),
      photoSize: 100,
      backgroundColor: Colors.white,
      loaderColor: Theme.of(context).primaryColor,
      gradientBackground: LinearGradient(
          colors: [Theme.of(context).primaryColor, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
    );
  }
}

class Aftersplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _checkUser() {
      final _signInObject = new SignInObject();
      final _user = _signInObject.getUser();
      print(_user);
      if (_user == null) {
        return false;
      }
      return true;
    }

    return Scaffold(
      body: Container(
        child: _checkUser() ? BasePage() : LoginPage(),
      ),
    );
  }
}
