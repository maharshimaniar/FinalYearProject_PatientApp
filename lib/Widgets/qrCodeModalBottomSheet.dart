import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../Classes/doctor.dart';

class QrCodeModalBottomSheet extends StatefulWidget {
  final String appointmentId;
  final Doctor doctor;
  final DateTime appointmentDateTime;
  final DateTime accessDateTime;

  QrCodeModalBottomSheet(
      {@required this.accessDateTime,
      @required this.appointmentDateTime,
      @required this.appointmentId,
      @required this.doctor});

  @override
  _QrCodeModalBottomSheetState createState() => _QrCodeModalBottomSheetState();
}

class _QrCodeModalBottomSheetState extends State<QrCodeModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final _map = {
      'accessDateTime': widget.accessDateTime.toIso8601String(),
      'appointmentDateTime': widget.appointmentDateTime.toIso8601String(),
      'appointmentId': widget.appointmentId,
      'doctorId': widget.doctor.id
    };

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.doctor.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 2,
            indent: 100,
            endIndent: 100,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 1.5, color: Colors.black)),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              child: QrImage(
                data: json.encode(_map),
                size: 200,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Appointment ID :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text('Appointment Date :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text('Appointment Time :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text('Booking Date :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text('Access Time :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.appointmentId.substring(0, 18),
                      style: TextStyle(fontSize: 18)),
                  Divider(),
                  Text(
                      widget.appointmentDateTime
                          .toIso8601String()
                          .substring(0, 10),
                      style: TextStyle(fontSize: 18)),
                  Divider(),
                  Text(
                      widget.appointmentDateTime
                          .toIso8601String()
                          .substring(11, 16),
                      style: TextStyle(fontSize: 18)),
                  Divider(),
                  Text(widget.accessDateTime.toIso8601String().substring(0, 10),
                      style: TextStyle(fontSize: 18)),
                  Divider(),
                  Text(
                      '${((widget.accessDateTime.hour) * 60) + (widget.accessDateTime.minute)} Minutes',
                      style: TextStyle(fontSize: 18))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
