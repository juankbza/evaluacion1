

//esto fue de prueba pero no me gusto y me quede con el listview.separated del information_screen ya que me gusto mas como quedo


import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {

  final musica = const ['Prueba1', 'Prueba2', 'Prueba3', 'Prueba4'];
   
  const ListViewScreen({Key? key}) : super(key: key);
  
  @override
  
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView(

        children: [

          ...musica.map(

            (generos)=> ListTile(

              onTap: (){},

              title: Text(generos),
              subtitle: Text('Subtitulo listview de $generos'),
            
              leading: Icon(Icons.add_location_alt),

              trailing: IconButton(

                onPressed:(){},
                icon: Icon(Icons.arrow_right),

              )

            )

          )
        ],
      )

    );
  }
}