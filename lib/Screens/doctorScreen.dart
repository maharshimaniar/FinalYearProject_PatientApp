import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    );
  }
}
