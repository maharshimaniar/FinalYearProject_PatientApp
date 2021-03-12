import 'package:FinalProject/Providers/userProvider.dart';
import 'package:FinalProject/Screens/historyScreen.dart';
import 'package:FinalProject/Screens/splashScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/drawerHeaderCard.dart';
import '../Methods/sign_in.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        children: [
          DrawerHeader(
            child: DrawerHeaderCard(),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 22),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.history)),
            title: Text(
              "History",
              style: TextStyle(fontSize: 22),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, History.routeName);
            },
          ),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.settings)),
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 22),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.developer_mode)),
            title: Text(
              "About Us",
              style: TextStyle(fontSize: 22),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.exit_to_app)),
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 22),
            ),
            onTap: () {
              Provider.of<UserProvider>(context, listen: false).removeUser();
              signOutGoogle(context);
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(SplashScreenWidget.routeName);
            },
          ),
        ],
      ),
    );
  }
}
