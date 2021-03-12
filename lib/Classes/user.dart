import 'package:flutter/foundation.dart';
class User {
  final String name;
  final String email;
  final String imageUrl;
  final String uid;
  final String contact;

  User(
      {@required this.name,
      @required this.email,
      @required this.imageUrl,
      @required this.uid,
      @required this.contact});

  List<User> _user = [];
}
