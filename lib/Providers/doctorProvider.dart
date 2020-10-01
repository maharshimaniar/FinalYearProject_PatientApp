import 'package:flutter/foundation.dart';

import '../Classes/doctor.dart';

class DoctorProvider with ChangeNotifier {
  List<Doctor> _doctorList = [
    Doctor(
        id: '1',
        imageUrl: "https://picsum.photos/id/237/200/300",
        name: "Doctor A",
        contactNumber: "9876543210",
        specialization: "MBBS"),
    Doctor(
        id: '2',
        imageUrl: "https://picsum.photos/id/237/200/300",
        name: "Doctor B",
        contactNumber: "9876543210",
        specialization: "MBBS"),
    Doctor(
        id: '3',
        imageUrl: "https://picsum.photos/id/237/200/300",
        name: "Doctor C",
        contactNumber: "9876543210",
        specialization: "MBBS"),
    Doctor(
        id: '4',
        imageUrl: "https://picsum.photos/id/237/200/300",
        name: "Doctor D",
        contactNumber: "9876543210",
        specialization: "MBBS"),
    Doctor(
        id: '5',
        imageUrl: "https://picsum.photos/id/237/200/300",
        name: "Doctor E",
        contactNumber: "9876543210",
        specialization: "MBBS"),
  ];

  List<Doctor> get doctorList {
    return [..._doctorList];
  }

  
}
