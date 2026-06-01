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
   
  const InformationScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

    backgroundColor: const Color.fromARGB(255, 219, 153, 216) ,

    appBar: AppBar(
      
      backgroundColor: const Color.fromARGB(255, 165, 14, 157),

      title: const Text('Desarrollador'),
      titleTextStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
   

      centerTitle: false,//solo para probar

      

      actions: [

        

        Container(

          margin: const EdgeInsets.only(right: 20) ,
          child: CircleAvatar(

            
            radius: 25,
            backgroundImage: AssetImage('assets/yo.jpeg'),
          
          ),
        )
        
      ],

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