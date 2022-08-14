import 'package:flutter/material.dart';

class Animaciones1Screen extends StatelessWidget {
  const Animaciones1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones 1'),
        centerTitle: true,
      ),
      body: const Center(
        child: const CuadradoAnimado(),
      ),
    );
  }
}

//---------------- CuadradoAnimado -------------------

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> {
  @override
  Widget build(BuildContext context) {
    return _Rectangulo();
  }
}

//---------------- _Rectangulo -------------------
class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
