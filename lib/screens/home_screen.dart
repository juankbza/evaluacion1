import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

    appBar: AppBar(

      backgroundColor: const Color.fromARGB(255, 165, 14, 157),
      title: const Text('ContadorApp'),
      titleTextStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),

    ),

      body: ListView.separated(

        itemCount: AppRoutes.menuOption.length,//con esto tambien puedo hacer la lista que quiero de info personal
        separatorBuilder: (BuildContext context,int index) {

          return const Divider();

        },

        itemBuilder: (BuildContext context, int index) {

          return ListTile(

            title: Text(AppRoutes.menuOption[index].name),
            onTap: () => Navigator.pushNamed(context, AppRoutes.menuOption[index].route),
            leading:  Icon(AppRoutes.menuOption[index].icon),

            

          );

        },
      ),
    );
  }
}