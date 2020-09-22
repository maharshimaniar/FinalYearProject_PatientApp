import 'package:flutter/material.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
        height: 160,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Time Picker"),
                  Divider(),
                  TextField(),
                  Divider(),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("Save"),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
