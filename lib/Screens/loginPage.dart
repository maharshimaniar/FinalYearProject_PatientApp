import 'package:FinalProject/Widgets/googleSignInButton.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  static const routeName = '/loginScreen';
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Container(
              color: Colors.white54,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset('assets/img/logo.jpg')),
                    SizedBox(height: 50),
                    GoogleSignInButton(),
                  ],
                ),
              ),
            ),
          );
  }
}
