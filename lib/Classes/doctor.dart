import 'package:flutter/foundation.dart';

class Doctor {
  final String name;
  final String id;
  final String contactNumber;
  final String specialization;
  final String imageUrl;

  Doctor(
      {@required this.id,
      @required this.imageUrl,
      @required this.name,
      @required this.contactNumber,
      @required this.specialization});
}
