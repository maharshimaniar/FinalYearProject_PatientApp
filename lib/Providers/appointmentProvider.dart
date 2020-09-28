import 'package:flutter/foundation.dart';

import '../Classes/appointment.dart';

class AppointmentProvider with ChangeNotifier {
  List<Appointment> _appointmentList = [
    Appointment(
        appointmentId: 'appointment1',
        dateTime: DateTime.now(),
        doctorId: '1',
        doctorName: 'Doctor A'),
    Appointment(
        appointmentId: 'appointment2',
        dateTime: DateTime.now(),
        doctorId: '2',
        doctorName: 'Doctor B'),
    Appointment(
        appointmentId: 'appointment3',
        dateTime: DateTime.now(),
        doctorId: '3',
        doctorName: 'Doctor C'),
    Appointment(
        appointmentId: 'appointment4',
        dateTime: DateTime.now(),
        doctorId: '4',
        doctorName: 'Doctor D'),
    Appointment(
        appointmentId: 'appointment5',
        dateTime: DateTime.now(),
        doctorId: '5',
        doctorName: 'Doctor E'),
  ];

  List<Appointment> get appointmentList {
    return [..._appointmentList];
  }
}
