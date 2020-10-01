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
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add Appointment",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontFamily: "WorkSansBold"),
            ),
            Divider(
              thickness: 2,
              indent: 100,
              endIndent: 100,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Date",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: 45,
                    ),
                    Text(
                      "Access Time",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: 45,
                    ),
                    Text(
                      "Doctor",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30 - 7.5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            _isDateSet
                                ? '${_selectedDate.toIso8601String().substring(0, 10)}  ${_selectedDate.toIso8601String().substring(11, 16)}      '
                                : "Select Date and Time",
                            style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 21,
                        ),
                        CircleAvatar(
                          radius: 25,
                          child: IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                            ),
                            onPressed: () {
                              DatePicker.showDateTimePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2020, 12, 31),
                                  theme: DatePickerTheme(
                                    headerColor: Colors.grey,
                                    titleHeight: 50,
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
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                            _isTimeSet
                                ? '${_selectedTime.toIso8601String().substring(11, 16)}           '
                                : "Select Time",
                            style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 97,
                        ),
                        CircleAvatar(
                          radius: 25,
                          child: IconButton(
                            icon: Icon(
                              Icons.timer,
                            ),
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
                                if (time.hour == 0 && time.minute == 0) {
                                  return;
                                }
                                setState(() {
                                  if (!_isTimeSet) {
                                    _isTimeSet = !_isTimeSet;
                                  }
                                  _selectedTime = time;
                                });
                              },
                                  currentTime: _isTimeSet
                                      ? _selectedTime
                                      : DateTime.parse(
                                          '${DateTime.now().toIso8601String().substring(0, 10)} 01:00:00'),
                                  locale: LocaleType.en);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17,
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
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: 40,
            ),
            MaterialButton(
                highlightColor: Colors.transparent,
                color: Theme.of(context).primaryColor,
                splashColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 30.0),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: "WorkSansBold"),
                  ),
                ),
                onPressed: _buttonEnabler()
                    ? () {
                        Provider.of<AppointmentProvider>(context, listen: false)
                            .addAppointment(
                                _selectedDoctor, _selectedDate, _selectedTime);
                        Navigator.of(context).pop();
                      }
                    : null),
          ],
        ));
  }
}
