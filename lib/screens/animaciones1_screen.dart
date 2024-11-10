import 'package:flutter/material.dart';
import 'dart:math' as math;

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

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
//------------------------- Variables -----------------------------
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;
  late Animation<double> opacidadOut;

//------------------------- initState -----------------------------
  @override
  void initState() {
    //--- controller ---
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    //--- rotacion ---
    rotacion = Tween(begin: 0.0, end: 2.0 * math.pi).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    //--- opacidad ---
    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)));

    //--- moverDerecha ---
    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    //--- agrandar ---
    agrandar = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeIn)));

    //--- opacidadOut ---
    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.00, curve: Curves.easeOut)));

    //--- Listener ---
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
        //controller.reset();
      } else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    super.initState();
  }

  //------------------------- dispose -----------------------------
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.scale(
          scale: agrandar.value,
          child: Transform.translate(
            offset: Offset(moverDerecha.value, moverDerecha.value * 1.25),
            child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                  opacity: opacidad.value - opacidadOut.value,
                  child: childRectangulo),
            ),
          ),
        );
      },
    );
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
