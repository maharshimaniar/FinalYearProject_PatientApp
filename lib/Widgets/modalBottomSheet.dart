import 'package:flutter/material.dart';
import 'package:rounded_flutter_datetime_picker/rounded_flutter_datetime_picker.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  bool _isTimeSet = false;
  DateTime _selectedDate = null;
  bool _isDateSet = false;
  DateTime _selectedTime = null;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Add Appointment",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 2,
                    indent: 100,
                    endIndent: 100,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                              _isDateSet
                                  ? '${_selectedDate.day.toString()}-${_selectedDate.month.toString()}-${_selectedDate.year.toString()}'
                                  : "Select Date",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2020, 12, 31),
                                  theme: DatePickerTheme(
                                    itemStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    doneStyle: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    cancelStyle: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ), onConfirm: (date) {
                                setState(() {
                                  if (!_isDateSet) {
                                    _isDateSet = !_isTimeSet;
                                  }
                                  _selectedDate = date;
                                });
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                              _isTimeSet
                                  ? '${_selectedTime.hour.toString()} : ${_selectedTime.minute.toString()}'
                                  : "Select Date",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.timer),
                            onPressed: () {
                              DatePicker.showTimePicker(context,
                                  showTitleActions: true,
                                  theme: DatePickerTheme(
                                    itemStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    doneStyle: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    cancelStyle: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ), onConfirm: (time) {
                                setState(() {
                                  if (!_isTimeSet) {
                                    _isTimeSet = !_isTimeSet;
                                  }
                                  _selectedTime = time;
                                });
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  RaisedButton(
                    onPressed: () {
                      print(_selectedDate);
                      print(_selectedTime);
                    },
                    child: Text("Save"),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
