import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Classes/medicineReminder.dart';
import '../Providers/medicineProvider.dart';
import '../Widgets/appointmentListTile.dart';
import '../Widgets/medicineReminderListTile.dart';
import '../Providers/appointmentProvider.dart';
import '../Classes/appointment.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    List<Appointment> _appointmentList =
        Provider.of<AppointmentProvider>(context).appointmentList;
    List<MedicineReminder> _medicineReminderList =
        Provider.of<MedicineReminderProvider>(context).medicineReminderList;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          Text('Medicine Reminders',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Card(
              shadowColor: Colors.black,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListView.builder(
                  itemCount: _medicineReminderList.length,
                  itemBuilder: (context, index) {
                    return MedicineReminderListTile(
                        dateTime: _medicineReminderList[index].dateTime,
                        intake: _medicineReminderList[index].intakeTime,
                        medicineName: _medicineReminderList[index].medicineName,
                        quantity: _medicineReminderList[index].quantity,
                        unit: _medicineReminderList[index].unit);
                  }),
            ),
          ),
          Spacer(),
          Text('Appointment Reminders',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListView.builder(
                  itemCount: _appointmentList.length,
                  itemBuilder: (context, index) {
                    return AppointmentListTile(
                        dateTime: _appointmentList[index].dateTime,
                        doctorName: _appointmentList[index].doctorName,
                        appointmentId: _appointmentList[index].appointmentId);
                  }),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
