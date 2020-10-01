import 'package:FinalProject/Providers/appointmentProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rounded_flutter_datetime_picker/rounded_flutter_datetime_picker.dart';

import '../Classes/doctor.dart';
import '../Providers/doctorProvider.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  @override
  _ModalBottomSheetWidgetState createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
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
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Access Time",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Doctor",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Divider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                              _isDateSet
                                  ? '${_selectedDate.day.toString()}/${_selectedDate.month.toString()}/${_selectedDate.year.toString()}  ${_selectedDate.toIso8601String().substring(11, 16)}'
                                  : "Select Date and Time",
                              style: TextStyle(fontSize: 18)),
                          Text(
                              _isTimeSet
                                  ? '${_selectedTime.toIso8601String().substring(11, 16)}'
                                  : "Select Time",
                              style: TextStyle(fontSize: 18)),
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
                    ],
                  ),
                  Divider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2020, 12, 31),
                              theme: DatePickerTheme(
                                titleHeight: 50,
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
                              currentTime:
                                  _isDateSet ? _selectedDate : DateTime.now(),
                              locale: LocaleType.en);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.timer),
                        onPressed: () {
                          DatePicker.showTimePicker(context,
                              showTitleActions: true,
                              showSecondsColumn: false,
                              theme: DatePickerTheme(
                                headerColor: Colors.grey[500],
                                itemStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                doneStyle: TextStyle(
                                    color: Colors.black,
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
                              currentTime: DateTime.parse(
                                  '${DateTime.now().toIso8601String().substring(0, 10)} 00:00:00'),
                              locale: LocaleType.en);
                        },
                      ),
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
                                .addAppointment(_selectedDoctor, _selectedDate,
                                    _selectedTime);
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
