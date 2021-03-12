import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Providers/userProvider.dart';
import './Screens/historyScreen.dart';
import './Screens/splashScreen.dart';
import './Providers/doctorProvider.dart';
import './Providers/appointmentProvider.dart';
import './Providers/medicineProvider.dart';
import './Screens/loginPage.dart';
import './Screens/baseScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Map<int, Color> color = {
    50: Color.fromRGBO(251, 171, 102, .1),
    100: Color.fromRGBO(251, 171, 102, .2),
    200: Color.fromRGBO(251, 171, 102, .3),
    300: Color.fromRGBO(251, 171, 102, .4),
    400: Color.fromRGBO(251, 171, 102, .5),
    500: Color.fromRGBO(251, 171, 102, .6),
    600: Color.fromRGBO(251, 171, 102, .7),
    700: Color.fromRGBO(251, 171, 102, .8),
    800: Color.fromRGBO(251, 171, 102, .9),
    900: Color.fromRGBO(251, 171, 102, 1),
  };
// Get the firebase user

  @override
  Widget build(BuildContext context) {
    //bool _login = Provider.of<UserProvider>(context).isUserSignedIn;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => MedicineReminderProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
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
        home: SplashScreenWidget(),
        routes: {
          SplashScreenWidget.routeName: (context) => SplashScreenWidget(),
          LoginPage.routeName: (context) => LoginPage(),
          BasePage.routeName: (context) => BasePage(),
          History.routeName: (context) => History(),
        },
      ),
    );
  }
}
