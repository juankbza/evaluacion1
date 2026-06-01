import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:audioplayers/audioplayers.dart';

class Home2Screen extends StatefulWidget {


   
  const Home2Screen({super.key});

  @override
  State<Home2Screen> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {


  final AudioPlayer reproductor = AudioPlayer();

  @override
  void initState() {

    super.initState();
    musicaFondo();
    
  }


  Future<void> musicaFondo() async {
      
      await reproductor.setReleaseMode(ReleaseMode.loop);
      await reproductor.play(AssetSource('sad-meow-song.mp3'));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      

      backgroundColor: const Color.fromARGB(255, 219, 153, 216),

      appBar: AppBar(

        title: const Text('ContadorApp'),
        titleTextStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
        backgroundColor: const Color.fromARGB(255, 165, 14, 157),

      ),


      body: ListView.builder(


        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        itemCount: AppRoutes.customhome.length,
        itemBuilder: (BuildContext context, int index){

          return AppRoutes.customhome[index];

        },
      ),
    );
  }
}