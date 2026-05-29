import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screens.dart';

class AppRoutes {

  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {

    '/listview': (BuildContext context) => ListViewScreen(),
    '/home': (BuildContext context) => HomeScreen(),
    '/information': (BuildContext context) => InformationScreen(),

  };
}
