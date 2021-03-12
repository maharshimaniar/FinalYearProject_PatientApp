import 'package:flutter/foundation.dart';

class MedicineReminder {
  final String medicineId;
  final String medicineName;
  final DateTime dateTime;
  final double quantity;
  final String intakeTime;
  final String unit;

  MedicineReminder(
      {@required this.medicineId,
      @required this.medicineName,
      @required this.dateTime,
      @required this.quantity,
      @required this.intakeTime,
      @required this.unit});
}
