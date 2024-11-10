import 'package:flutter/material.dart';
import 'package:animaciones_app/screens/animaciones1_screen.dart';
import 'package:animaciones_app/screens/animaciones2_screen.dart';
import 'package:animaciones_app/screens/animaciones3_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones'),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        _Boton(
          texto: "Animaciones 1",
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Animaciones1Screen(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        _Boton(
          texto: "Animaciones 2",
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Animaciones2Screen(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        _Boton(
          texto: "Animaciones 3",
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Animaciones3Screen(),
              ),
            );
          },
        ),
      ]),
    );
  }
}

//------------------ _Boton ----------------------
class _Boton extends StatelessWidget {
  final String texto;
  final Function function;

  const _Boton({required this.texto, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texto),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () async {
          function();
        },
      ),
    );
  }
}
