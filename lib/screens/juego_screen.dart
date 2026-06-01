// Nota para usted profe,esto no tiene nada que ver con la app que pidio mas si lo hice para ver nuevos widgets 
// esto lo hice en gran parte con IA y es lo unico de mi proyecto en lo que lo use ,el resto de mis archivos fueros hechos 100% por mi
// esto es solo para que me diga que tal y me de su opinion sobre que widgets me pueden servir mas para esto
// De nuevo esto solo es por diversion y lo que debe tomar en cuenta son mis otros archivos  loos cuales hice con lo que me enseno en clase





import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class JuegoScreen extends StatefulWidget {
  const JuegoScreen({super.key});

  @override
  State<JuegoScreen> createState() => _JuegoScreenState();
}

class _JuegoScreenState extends State<JuegoScreen> {

  double ejeX = 160; 
  double ejeY = 400;    //posicion tung tung al comienzo
  int pasosContador = 0;
  
  final double tamanoTung = 35; // tamano del tung
  final double pasoVelocidad = 15; //distancia que se mueve por click

  
  final double anchoMapa = 350; //tamano dle mapa
  final double altoMapa = 460; // tamano mapa


  List<Rect> obstaculos = []; // aqui guardamos los obstaculos
  



  final AudioPlayer reproductor = AudioPlayer();

  @override
  void initState() {
    super.initState();          // con todo esto se incia la musica y los obstaculos cuando entramos al juego
    _iniciarMusica();
    _generarObstaculos();


  }

  Future<void> _iniciarMusica() async {

    await reproductor.setReleaseMode(ReleaseMode.loop);
    await reproductor.play(AssetSource('sad-meow-song.mp3')); // con esto encendemos la musica

  }


  void _generarObstaculos() {
    final random = Random();       //funion para fenerar los obstaculos aleatorios
    obstaculos.clear();
    
    for (int i = 0; i < 25; i++){
      
      double x = random.nextDouble() * (anchoMapa - 20);
      double y = 60 + random.nextDouble() * 300; 
      
      obstaculos.add(Rect.fromLTWH(x, y, 16, 16));
    }
  }


  void _mover(double dx, double dy) {
    double nuevoX = ejeX + dx;
    double nuevoY = ejeY + dy;

    // No dejar que el personaje se salga de los bordes del mapa
    if (nuevoX < 0 || nuevoX > (anchoMapa - tamanoTung) || nuevoY < 0 || nuevoY > (altoMapa - tamanoTung)) {
      return; 
    }

    // cuadro de colision
    Rect rectJugador = Rect.fromLTWH(nuevoX, nuevoY, tamanoTung, tamanoTung);

    // Verificar si choca con algún círculo rojo
    bool colision = false;
    for (var obstaculo in obstaculos) {
      if (obstaculo.overlaps(rectJugador)) {
        colision = true;
        break;
      }
    }


    if (!colision) {
      setState(() {
        ejeX = nuevoX;
        ejeY = nuevoY;
        pasosContador++;


        if (ejeY <= 15) {
          displayDialog(context);
        }
      });
    }
  }

  // 4. alerta al ganar
  void displayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('¡Felicidades te ganaste el tung tung tung sahur de la suerte!'),
          content: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pasos totales: $pasosContador'),
            ],
          ),

          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
                _reiniciarJuego();
              },
              child: const Text('Jugar de nuevo'),
            ),
          ], 
        );
      },
    );
  }

  void _reiniciarJuego() {
    setState(() {
      ejeX = 160;
      ejeY = 400; 
      pasosContador = 0;
      _generarObstaculos();
    });
  }

  @override
  void dispose() {
    //apaga la musica
    reproductor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 153, 216),
      appBar: AppBar(
        title: const Text('Esquiva los Obstáculos'),
        backgroundColor: const Color.fromARGB(255, 165, 14, 157),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            'Pasos: $pasosContador',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 15),

          // mapa
          Center(
            child: Container(
              width: anchoMapa,
              height: altoMapa,
              decoration: BoxDecoration(
                color: Colors.purple[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Stack(
                children: [
                  // Zona Verde de la Meta
                  Container(
                    width: anchoMapa,
                    height: 35,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text('META', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
                  ),

                  // Renderiza los obstaculos
                  ...obstaculos.map((obs) => Positioned(
                        left: obs.left,
                        top: obs.top,
                        child: Container(
                          width: obs.width,
                          height: obs.height,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),

                  // Imagen del tung
                  Positioned(
                    left: ejeX,
                    top: ejeY,
                    child: SizedBox(
                      width: tamanoTung,
                      height: tamanoTung,
                      child: Image.asset('assets/TTTsahur.jpg', fit: BoxFit.contain), 
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // Controles de movimiento 
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: [
                IconButton(
                  iconSize: 55,
                  icon: const Icon(Icons.arrow_circle_up, color: Colors.white),
                  onPressed: () => _mover(0, -pasoVelocidad),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 55,
                      icon: const Icon(Icons.arrow_circle_left, color: Colors.white),
                      onPressed: () => _mover(-pasoVelocidad, 0),
                    ),
                    const SizedBox(width: 45),
                    IconButton(
                      iconSize: 55,
                      icon: const Icon(Icons.arrow_circle_right, color: Colors.white),
                      onPressed: () => _mover(pasoVelocidad, 0),
                    ),
                  ],
                ),
                IconButton(
                  iconSize: 55,
                  icon: const Icon(Icons.arrow_circle_down, color: Colors.white),
                  onPressed: () => _mover(0, pasoVelocidad),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}