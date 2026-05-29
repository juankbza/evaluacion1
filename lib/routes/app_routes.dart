import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/menu_options.dart';
import 'package:flutter_application_1/screens/screens.dart';

class AppRoutes {

  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {

    '/listview': (BuildContext context) => ListViewScreen(),
    '/home': (BuildContext context) => HomeScreen(),
    '/information': (BuildContext context) => InformationScreen(),
    '/contador': (BuildContext context) => ContadorScreen(),

  };

  static final menuOption = <MenuOptions>[

    //MenuOptions(route: '/home', name: 'Pantalla HOME', icon: Icons.home, screen: const HomeScreen()),
    MenuOptions(route: '/information', name: 'Datos Desarrollador', icon: Icons.info_outline_rounded, screen: const InformationScreen()),
    MenuOptions(route: '/contador', name: 'Contador', icon: Icons.add, screen: const ContadorScreen()),

  ];
}
