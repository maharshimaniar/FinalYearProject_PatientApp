import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_point_tab_bar/pointTabBar.dart';

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

class _HomePageState extends State<ReminderScreen>
    with SingleTickerProviderStateMixin {
  final tabList = ['Medicines', 'Appointments'];
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Appointment> _appointmentList =
        Provider.of<AppointmentProvider>(context).appointmentList;
    List<MedicineReminder> _medicineReminderList =
        Provider.of<MedicineReminderProvider>(context).medicineReminderList;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          bottom: true,
          child: TabBar(
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            dragStartBehavior: DragStartBehavior.start,
            unselectedLabelStyle: TextStyle(
              fontSize: 15,
            ),
            controller: _tabController,
            indicator: PointTabIndicator(
              position: PointTabIndicatorPosition.bottom,
              color: Colors.white,
              insets: EdgeInsets.only(bottom: 6),
            ),
            tabs: tabList.map((item) {
              return Tab(
                text: item,
              );
            }).toList(),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Container(
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
                          medicineName:
                              _medicineReminderList[index].medicineName,
                          quantity: _medicineReminderList[index].quantity,
                          unit: _medicineReminderList[index].unit);
                    }),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListView.builder(
                  itemCount: _appointmentList.length,
                  itemBuilder: (context, index) {
                    return AppointmentListTile(
                      appointmentDateTime:
                          _appointmentList[index].appointmentDateTime,
                      doctor: _appointmentList[index].doctor,
                      appointmentId: _appointmentList[index].appointmentId,
                      accessTime: _appointmentList[index].accessDateTime,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
