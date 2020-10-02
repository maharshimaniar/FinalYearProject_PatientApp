import 'package:flutter/material.dart';

import './modalBottomSheet.dart';
import '../Classes/doctor.dart';

class DoctorListTile extends StatelessWidget {
  final Doctor doctor;

  DoctorListTile(
      {@required this.doctor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        child: Icon(
          Icons.supervised_user_circle,
          size: 40,
        ),
      ),
      title: Text(
        doctor.name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        doctor.specialization,
        style: TextStyle(fontSize: 18),
      ),
      contentPadding: EdgeInsets.all(10),
      onTap: () {
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("${doctor.name} pressed."),
          duration: Duration(seconds: 2),
        ));
      },
      trailing: IconButton(
        icon: Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              context: context,
              builder: (BuildContext context) {
                return ModalBottomSheetWidget(doctor: doctor,);
              });
        },
      ),
    );
  }
}
