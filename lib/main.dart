import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

void main() => runApp(const MyAppcontador());

class MyAppcontador extends StatelessWidget {

  const MyAppcontador({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Contador App',
      routes:AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,

    );
  }
}