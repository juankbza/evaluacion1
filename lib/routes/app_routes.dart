import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/menu_options.dart';
import 'package:flutter_application_1/screens/screens.dart';
import 'package:flutter_application_1/widgets/customcard_home.dart';

class AppRoutes {

  static const initialRoute = '/home2';

  static Map<String, Widget Function(BuildContext)> routes = {

    '/listview': (BuildContext context) => ListViewScreen(),
    '/home': (BuildContext context) => HomeScreen(),
    '/information': (BuildContext context) => InformationScreen(),
    '/contador': (BuildContext context) => ContadorScreen(),
    '/home2': (BuildContext context) => Home2Screen(),
    '/juego-contador': (BuildContext context) => JuegoScreen(),

  };
//este era para el home 1 pero ese quedo solo de prueba
  static final menuOption = <MenuOptions>[

    //MenuOptions(route: '/home', name: 'Pantalla HOME', icon: Icons.home, screen: const HomeScreen()),
    MenuOptions(route: '/information', name: 'Datos Desarrollador', icon: Icons.info_outline_rounded, screen: const InformationScreen()), 
    MenuOptions(route: '/contador', name: 'Contador', icon: Icons.add, screen: const ContadorScreen()),

  ];

  static  final customhome = <CustomCardHome>[ //esto si es para el home 2 y poder moverme estre las screens ,esto si es importante profe

    CustomCardHome(title: 'El CONTADOR', subtitle: 'Aplicacion para contar con estilo', icon: Icons.add_circle_outline_rounded, color: const Color.fromARGB(255, 165, 14, 157), image: Image.asset('assets/elcontador.webp'), route: '/contador'),
    CustomCardHome(title: 'JUEGO CONTADOR', subtitle: 'Juego usando el contador', icon: Icons.gamepad, color: const Color.fromARGB(255, 165, 14, 157), image: Image.asset('assets/tung2.jpg'), route: '/juego-contador'),
    CustomCardHome(title: 'DESARROLLADOR', subtitle: 'Aqui estan los datos del desarrollador', icon: Icons.medical_information_rounded, color: const Color.fromARGB(255, 165, 14, 157), image: Image.asset('assets/yo.jpeg'), route: '/information'),

  ];
  
}
