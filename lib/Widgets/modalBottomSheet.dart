import 'package:FinalProject/Providers/appointmentProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rounded_flutter_datetime_picker/rounded_flutter_datetime_picker.dart';

import '../Classes/doctor.dart';
import '../Providers/doctorProvider.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  bool _isTimeSet = false;
  DateTime _selectedDate = null;
  bool _isDateSet = false;
  DateTime _selectedTime = null;
  Doctor _selectedDoctor;
  bool _isDoctorSet = false;

  bool _buttonEnabler() {
    if (_isTimeSet && _isDateSet && _isDoctorSet) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List<Doctor> _doctorDropDownList =
        Provider.of<DoctorProvider>(context, listen: false).doctorList;

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
                                  ? '${_selectedDate.day.toString()}/${_selectedDate.month.toString()}/${_selectedDate.year.toString()}  ${_selectedDate.toIso8601String().substring(11, 16)}'
                                  : "Select Date and Time",
                              style: TextStyle(fontSize: 18)),
                          IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              DatePicker.showDateTimePicker(context,
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
                                    _isDateSet = !_isDateSet;
                                  }
                                  _selectedDate = date;
                                });
                              },
                                  currentTime: _isDateSet
                                      ? _selectedDate
                                      : DateTime.now(),
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
                            "Access Time",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                              _isTimeSet
                                  ? '${_selectedTime.toIso8601String().substring(11, 16)}'
                                  : "Select Time",
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
                                  currentTime: _isTimeSet
                                      ? _selectedTime
                                      : DateTime.now(),
                                  locale: LocaleType.en);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Doctor",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButton(
                          isExpanded: true,
                          style: TextStyle(
                              fontSize: 18,
                              textBaseline: TextBaseline.alphabetic),
                          hint: Text("Select Doctor"),
                          value: _selectedDoctor,
                          onChanged: (Doctor value) {
                            setState(() {
                              _selectedDoctor = value;
                              _isDoctorSet = true;
                            });
                          },
                          items: _doctorDropDownList.map((Doctor doctor) {
                            return DropdownMenuItem<Doctor>(
                              value: doctor,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    doctor.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  RaisedButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: _buttonEnabler()
                        ? () {
                            Provider.of<AppointmentProvider>(context,
                                    listen: false)
                                .addAppointment(_selectedDoctor.name,
                                    _selectedDate, _selectedDoctor.id);
                            Navigator.of(context).pop();
                          }
                        : null,
                    child: Text("Save"),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
