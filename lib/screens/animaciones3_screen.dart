import 'package:flutter/material.dart';
import 'dart:math' as math;

class Animaciones3Screen extends StatefulWidget {
  const Animaciones3Screen({Key? key}) : super(key: key);

  @override
  State<Animaciones3Screen> createState() => _Animaciones3ScreenState();
}

class _Animaciones3ScreenState extends State<Animaciones3Screen>
    with SingleTickerProviderStateMixin {
  @override
  //------------------------- Variables -----------------------------
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> moverDerecha;
  late Animation<double> moverDerecha2;
  late Animation<double> moverArriba2;
  late Animation<double> moverIzquierda2;
  late Animation<double> moverAbajo2;

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

    //--- moverDerecha ---
    moverDerecha = Tween(begin: 0.0, end: 300.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    moverDerecha2 = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut)));

    moverArriba2 = Tween(begin: 0.0, end: -300.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)));

    moverIzquierda2 = Tween(begin: 0.0, end: -300.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moverAbajo2 = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    //--- Listener ---
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
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
    final size = MediaQuery.of(context).size;
    controller.forward();
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Animaciones 3'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? childRectangulo) {
          return Stack(
            children: [
              Positioned(
                top: 100,
                left: 10,
                child: Transform.translate(
                  offset: Offset(moverDerecha.value, 0),
                  child: Transform.rotate(
                    angle: rotacion.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          'assets/logo.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 0,
                child: Container(
                  color: Colors.white,
                  height: 5,
                  width: size.width,
                ),
              ),
              Positioned(
                top: 94,
                left: 0,
                child: Container(
                  color: Colors.white,
                  height: 5,
                  width: size.width,
                ),
              ),
              //--------------------------------------------------------------------

              Positioned(
                top: 300,
                left: 10,
                child: Transform.translate(
                  offset: Offset(moverDerecha2.value + moverIzquierda2.value,
                      moverArriba2.value + moverAbajo2.value),
                  child: Transform.rotate(
                    angle: rotacion.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          'assets/talleres.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
