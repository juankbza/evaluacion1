import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ContadorScreen extends StatefulWidget {
  
   
  const ContadorScreen({super.key});

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}



class _ContadorScreenState extends State<ContadorScreen> {

  int valor = 0;
  String imagenBoton = 'assets/gato3.png';

  final AudioPlayer reproductor = AudioPlayer();
  

  Future<void> _resetear() async {

    valor = 0;
    imagenBoton = 'assets/gato1.png';
    setState((){});

    await reproductor.release();
    await reproductor.play(AssetSource('yee-haw.mp3'));

  }

  Future<void> _aumentar() async {

    valor ++;
    imagenBoton = 'assets/gato2.png';
    setState((){});

    await reproductor.release();
    await reproductor.play(AssetSource('gunshotjbudden.mp3'));

  }

  Future<void> _quitar() async {

    valor --;
    imagenBoton = 'assets/gato4.png';

    // if(valor < 0){

    //   valor = 0;        //esto es por si no quiero contar negativos e

    // }

    setState((){});

    await reproductor.release();
    await reproductor.play(AssetSource('faaah.mp3'));

  }

  
  @override
  void dispose() {
    reproductor.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color.fromARGB(255, 219, 153, 216),

      appBar: AppBar(

        title: Text('Contador Gatuno'),
        titleTextStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
        backgroundColor: const Color.fromARGB(255, 165, 14, 157),


      ),

      body: Container(

        width: double.infinity,
        height: double.infinity,
        
        decoration: const BoxDecoration(

          image: DecorationImage(
            
            image: AssetImage('assets/fondocontador.jpg'),
            fit: BoxFit.cover
            
            ,)
        ),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [


            
            Text('EL CONTADOR MICHUNO ES: ', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black54,fontStyle: FontStyle.italic),),
            Text('$valor', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54,fontStyle: FontStyle.italic),),


            Image.asset(imagenBoton, width: 200, height: 200,)

          ],
        ),
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      floatingActionButton: Row(

        mainAxisSize: MainAxisSize.min,

        children: [

          FloatingActionButton(

            heroTag: 'botonaumentar',

            onPressed: _aumentar,
            child: const Icon(Icons.add),

          ),

          const SizedBox(width: 10),

          FloatingActionButton(

            heroTag: 'botonquitar',
            onPressed: _quitar,
            child: const Icon(Icons.remove),

          ),

          const SizedBox(width: 10),

          FloatingActionButton(

            heroTag: 'botonrestear',
            onPressed: _resetear,
            child: const Icon(Icons.restart_alt_outlined),

          ),

          
        ]

      ),
    );
  }
}