import 'package:flutter/material.dart';

class AppointmentListTile extends StatelessWidget {
  final String doctorName;
  final DateTime dateTime;
  final String appointmentId;

  AppointmentListTile(
      {@required this.dateTime,
      @required this.doctorName,
      @required this.appointmentId});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        child:
            Text('${dateTime.hour.toString()}:${dateTime.minute.toString()}'),
      ),
      title: Text(
        doctorName,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(appointmentId),
    );
  }
}
