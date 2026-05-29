import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

    appBar: AppBar(

      backgroundColor: Colors.yellow,
      title: const Text('ContadorApp'),

    ),

      body: Center(

         child: Text('HomeScreen'), 

      ),
    );
  }
}