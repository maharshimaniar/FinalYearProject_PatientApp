import 'package:FinalProject/Screens/appDrawer.dart';
import 'package:FinalProject/Widgets/modalBottomSheet.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import './doctorScreen.dart';
import './filesScreen.dart';
import './homeScreen.dart';
import './prescriptionScreen.dart';
import './reminderScreen.dart';

class BasePage extends StatefulWidget {
  static const routeName = '/homeScreen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BasePage> {
  int _page = 0;
  final _pageOptions = [
    DoctorScreen(),
    ReminderScreen(),
    HomeScreen(),
    FileScreen(),
    PrescriptionScreen(),
  ];
  final _pageTitle = [
    "Doctors",
    "Reminders",
    "Home",
    "Files",
    "Prescriptions",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Theme.of(context).primaryColor, Colors.white]),
          ),
        ),
        title: Text(_pageTitle[_page]),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      
                      return ModalBottomSheetWidget();
                    });
              })
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Colors.black,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.black,
        animationDuration: Duration(milliseconds: 200),
        items: <Widget>[
          Icon(Icons.contacts, color: Colors.white),
          Icon(Icons.alarm, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.find_in_page, color: Colors.white),
          Icon(Icons.description, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Center(
        child: _pageOptions[_page],
      ),
      drawer: AppDrawer(),
    );
  }
}
