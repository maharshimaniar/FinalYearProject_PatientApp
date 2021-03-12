import 'package:flutter/foundation.dart';

import '../Classes/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _userList = [];
  bool isUserSignedIn = false;

  User get user {
    return _userList[0];
  }

  void addUser(user) {
    _userList.insert(
        0,
        User(
            contact: user.phoneNumber,
            email: user.email,
            imageUrl: user.photoURL,
            name: user.displayName,
            uid: user.uid));
    isUserSignedIn = true;
  }

  void removeUser() {
    _userList.removeAt(0);
    isUserSignedIn = false;
  }
}
