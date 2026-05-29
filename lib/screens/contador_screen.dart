import 'package:flutter/material.dart';

class ContadorScreen extends StatefulWidget {
   
  const ContadorScreen({Key? key}) : super(key: key);

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Contador App'),
        backgroundColor: Colors.deepOrange,


      ),

      body: Center(
        
         child: Text('ContadorScreen'),

      ),
    );
  }
}