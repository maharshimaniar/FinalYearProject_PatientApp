import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Providers/doctorProvider.dart';
import '../Widgets/doctorListTile.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    final _doctorList = Provider.of<DoctorProvider>(context).doctorList;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: ListView.builder(
            itemCount: _doctorList.length,
            itemBuilder: (context, index) {
              return DoctorListTile(
                contactNumber: _doctorList[index].contactNumber,
                imageUrl: _doctorList[index].imageUrl,
                name: _doctorList[index].name,
                specialization: _doctorList[index].specialization,
              );
            },
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        marginBottom: 25,
        overlayColor: Colors.black12,
        children: [
          SpeedDialChild(
            backgroundColor: Theme.of(context).accentColor,
              child: Icon(Icons.supervised_user_circle),
              label: 'Add Manually',
              elevation: 5,
              onTap: () {}),
          SpeedDialChild(
              child: Icon(FontAwesomeIcons.qrcode),
              label: 'Scan QR Code',
              elevation: 5,
              onTap: () {})
        ],
      ),
    );
  }
}
