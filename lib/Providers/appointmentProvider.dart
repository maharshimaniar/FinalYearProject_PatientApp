import 'package:flutter/foundation.dart';

import '../Classes/appointment.dart';
import '../Classes/doctor.dart';

class AppointmentProvider with ChangeNotifier {
  List<Appointment> _appointmentList = [
    Appointment(
        appointmentId: DateTime.now().toIso8601String(),
        appointmentDateTime: DateTime.now(),
        doctor: Doctor(
          id: '1',
          imageUrl: "https://picsum.photos/id/237/200/300",
          name: "Doctor A",
          contactNumber: "9876543210",
          specialization: "MBBS",
        ),
        accessDateTime: DateTime.now().add(Duration(hours: 1))),
    Appointment(
        appointmentId: DateTime.now().toIso8601String(),
        appointmentDateTime: DateTime.parse('2020-05-05 01:27:00'),
        doctor: Doctor(
          id: '2',
          imageUrl: "https://picsum.photos/id/237/200/300",
          name: "Doctor B",
          contactNumber: "9876543210",
          specialization: "MBBS",
        ),
        accessDateTime: DateTime.parse('2020-05-05 00:27:00')),
  ];

  List<Appointment> get appointmentList {
    return [..._appointmentList];
  }

  List<Appointment> get upcomingAppointments {
    return [
      ..._appointmentList.where((element) => element.appointmentDateTime
          .isAfter(DateTime.parse('2020-05-06 00:00:00')))
    ];
  }

  void addAppointment(
      Doctor doctor, DateTime appointmentDateTime, DateTime accessTime) {
    _appointmentList.add(Appointment(
        appointmentId: DateTime.now().toIso8601String(),
        appointmentDateTime: appointmentDateTime,
        doctor: doctor,
        accessDateTime: accessTime));
    notifyListeners();
  }

  void deleteAppointment(int index) {
    _appointmentList.removeAt(index);
    notifyListeners();
  }

  void deleteSpecificDoctorAppointment(String id) {
    _appointmentList.removeWhere((element) {
      if (element.doctor.id == id &&
          element.appointmentDateTime
              .isAfter(DateTime.parse('2020-06-06 00:00:00'))) {
        return true;
      }
      return false;
    });
    notifyListeners();
  }
}
