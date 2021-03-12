import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../Methods/sign_in.dart';
import '../Screens/baseScreen.dart';

import '../Providers/userProvider.dart';

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController _btnController =
        new RoundedLoadingButtonController();

    Future<bool> _doSomething() async {
      bool value = await signInWithGoogle().then((result) {
        if (result != null) {
          Provider.of<UserProvider>(context, listen: false).addUser(result);
          return true;
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("SignIn Failed!!!"),
            duration: Duration(seconds: 2),
          ));
          return false;
        }
      });
      return value;
    }

    return RoundedLoadingButton(
      color: Color(0xff4285F4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset(
              "assets/img/googleLogo.png",
              height: 18.0,
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: new Text(
                "Sign in with Google",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ],
      ),
      controller: _btnController,
      onPressed: () async {
        bool value = await _doSomething();
        if (value == true) {
          _btnController.success();
          Timer(Duration(seconds: 2), () {
            Navigator.of(context).pushReplacementNamed(BasePage.routeName);
          });
        } else {
          _btnController.error();
          Timer(Duration(seconds: 2), () {
            _btnController.reset();
          });
        }
      },
      width: 200,
    );
  }
}
