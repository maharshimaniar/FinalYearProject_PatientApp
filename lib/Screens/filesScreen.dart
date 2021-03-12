import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';

import '../Widgets/modalBottomSheet.dart';

class FileScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<FileScreen> {
  final _map = {
    'id': '6',
    'imageUrl': "https://picsum.photos/id/237/200/300",
    'name': "Doctor QR",
    'contactNumber': "9876543210",
    'specialization': "Orthopedic"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text('Doctor QR for Testing Purpose.',style: TextStyle(fontSize: 22),),
          Divider(),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        splashColor: Colors.amberAccent,
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              context: context,
              builder: (BuildContext context) {
                return ModalBottomSheetWidget();
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
