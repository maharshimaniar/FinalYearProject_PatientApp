import 'package:flutter/foundation.dart';

import '../Classes/medicineReminder.dart';

class MedicineReminderProvider with ChangeNotifier {
  List<MedicineReminder> _medicineReminder = [
    MedicineReminder(
        medicineId: 'MedicineReminder1',
        medicineName: 'Medicine 1',
        dateTime: DateTime.now(),
        quantity: 2,
        intakeTime: 'Before Meal',
        unit: 'Tablet'),
    MedicineReminder(
        medicineId: 'MedicineReminder2',
        medicineName: 'Medicine 2',
        dateTime: DateTime.now(),
        quantity: 250,
        intakeTime: 'After Meal',
        unit: 'ml'),
    MedicineReminder(
        medicineId: 'MedicineReminder1',
        medicineName: 'Medicine 3',
        dateTime: DateTime.now(),
        quantity: 0.5,
        intakeTime: 'Before Meal',
        unit: 'cup'),
    MedicineReminder(
        medicineId: 'MedicineReminder1',
        medicineName: 'Medicine 4',
        dateTime: DateTime.now(),
        quantity: 0.12,
        intakeTime: 'Before Meal',
        unit: 'oz'),
    MedicineReminder(
        medicineId: 'MedicineReminder1',
        medicineName: 'Medicine 5',
        dateTime: DateTime.now(),
        quantity: 35,
        intakeTime: 'After Meal',
        unit: 'gm'),
  ];

  List<MedicineReminder> get medicineReminderList {
    return [..._medicineReminder];
  }
}
