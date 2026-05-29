import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {

  final datos = const [


// con esto esto uno los nombres con los iconos  


    {'text': 'Juan Guevara', 'icon': Icons.person},
    {'text': '26582031', 'icon': Icons.badge_outlined},
    {'text': ' Juanguevaramarquez@gmail.com', 'icon': Icons.mail_outline},
    {'text': '04128583992', 'icon': Icons.phone},
    {'text': 'Porlamar, Nueva Esparta, Venezuela', 'icon': Icons.location_on}

  ];
   
  const InformationScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

    appBar: AppBar(

      backgroundColor: Colors.deepOrange,

      title: const Text('Desarrollador',
      //style: TextStyle(),probando el style

      ),
      
      centerTitle: false,//solo para probar

    ),

      body: ListView.separated(
        

        itemCount: datos.length,

        separatorBuilder: (BuildContext context,int index) {

          return const Divider();

        },

        itemBuilder: (BuildContext context, int index) {

          final datosConIconos = datos[index];

          return ListTile(

            title: Text(datosConIconos['text'] as String),
            leading: Icon(datosConIconos['icon'] as IconData),
            

          );
        },
      ),
    );
  }
}