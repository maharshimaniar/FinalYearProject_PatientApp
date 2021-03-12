import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/userProvider.dart';
import '../Classes/user.dart';

class DrawerHeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User _user = Provider.of<UserProvider>(context).user;
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(radius: 50, child: Image.network(_user.imageUrl)),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        _user.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Divider(),
                    FittedBox(child: Text(_user.email))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
