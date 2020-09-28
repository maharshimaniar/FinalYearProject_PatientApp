import './Providers/doctorProvider.dart';
import './Providers/appointmentProvider.dart';
import './Providers/medicineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/loginPage.dart';
import 'Screens/baseScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => MedicineReminderProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider())
      ],
          child: new MaterialApp(
        title: 'App Name Here',
        theme: new ThemeData(
            primarySwatch: MaterialColor(0xFFfbab66, color),
            // colorScheme: ColorScheme(
            //     primary: null,
            //     primaryVariant: null,
            //     secondary: null,
            //     secondaryVariant: null,
            //     surface: null,
            //     background: null,
            //     error: null,
            //     onPrimary: null,
            //     onSecondary: null,
            //     onSurface: null,
            //     onBackground: null,
            //     onError: null,
            //     brightness: null),
            accentColor: Colors.amberAccent),
        home: new LoginPage(),
        routes: {
          BasePage.routeName: (context) => BasePage(),
        },
      ),
    );
  }
}
