import 'package:FinalProject/Widgets/qrCodeModalBottomSheet.dart';
import 'package:flutter/material.dart';

import '../Classes/doctor.dart';

class AppointmentListTile extends StatelessWidget {
  final Doctor doctor;
  final DateTime appointmentDateTime;
  final String appointmentId;
  final DateTime accessTime;

  AppointmentListTile(
      {@required this.accessTime,
      @required this.doctor,
      @required this.appointmentId,
      @required this.appointmentDateTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            context: context,
            builder: (BuildContext context) {
              return QrCodeModalBottomSheet(
                accessDateTime: accessTime,
                appointmentDateTime: appointmentDateTime,
                appointmentId: appointmentId,
                doctor: doctor,
              );
            });
      },
      leading: CircleAvatar(
        radius: 40,
        child: Text(
            '${appointmentDateTime.hour.toString()}:${appointmentDateTime.minute.toString()}'),
      ),
      title: Text(
        doctor.name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(appointmentId),
    );
  }
}
