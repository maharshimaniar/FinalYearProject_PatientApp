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
  final tabList = ['Appointments', 'Medicines'];
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Appointment> _appointmentList =
        Provider.of<AppointmentProvider>(context).upcomingAppointments;
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
              color: Theme.of(context).primaryColorDark,
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
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.black,
                      indent: 30,
                      endIndent: 30,
                      thickness: 1 / 5,
                    );
                  },
                  itemCount: _appointmentList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Theme.of(context).primaryColor),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red[700],
                          size: 40,
                        ),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20),
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 4,
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) {
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Delete Appointment'),
                            content: Text(
                              'Do you want to remove the Appointment?',
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.of(ctx).pop(false);
                                },
                              ),
                              FlatButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  Navigator.of(ctx).pop(true);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      onDismissed: (direction) {
                        setState(() {
                          Provider.of<AppointmentProvider>(context,
                                  listen: false)
                              .deleteAppointment(index);
                        });
                      },
                      child: AppointmentListTile(
                        appointmentDateTime:
                            _appointmentList[index].appointmentDateTime,
                        doctor: _appointmentList[index].doctor,
                        appointmentId: _appointmentList[index].appointmentId,
                        accessTime: _appointmentList[index].accessDateTime,
                      ),
                    );
                  }),
            ),
          ),
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
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.black,
                        indent: 30,
                        endIndent: 30,
                        thickness: 1 / 5,
                      );
                    },
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
        ],
      ),
    );
  }
}
