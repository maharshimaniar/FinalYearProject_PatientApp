import 'package:flutter/foundation.dart';

import '../Classes/doctor.dart';

class Appointment {
  final String appointmentId;
  final Doctor doctor;
  final DateTime appointmentDateTime;
  final DateTime accessDateTime;

  Appointment(
      {@required this.appointmentId,
      @required this.appointmentDateTime,
      @required this.doctor,
      @required this.accessDateTime});
}
