import 'package:flutter/foundation.dart';

class Appointment {
  final String appointmentId;
  final String doctorName;
  final DateTime dateTime;
  final String doctorId;

  Appointment(
      {@required this.appointmentId,
      @required this.dateTime,
      @required this.doctorId,
      @required this.doctorName});

}
