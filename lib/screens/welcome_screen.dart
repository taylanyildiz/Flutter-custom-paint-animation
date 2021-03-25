import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:welcom_page/paint/custom_paint.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController controllerCircle;
  AnimationController controllerFull;
  AnimationController controllerMiddle;
  Animation circleAnim;
  Animation circleFullAnim;
  Animation circleMiddleAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerCircle = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controllerFull = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controllerMiddle = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    circleAnim = Tween<double>(begin: 0.0, end: pi + 2).animate(
      CurvedAnimation(parent: controllerCircle, curve: Curves.bounceOut),
    );
    circleFullAnim = Tween<double>(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: controllerFull, curve: Curves.linear),
    );
    circleMiddleAnim = Tween<double>(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: controllerFull, curve: Curves.linear),
    );
    controllerCircle.repeat();

    Timer.periodic(Duration(milliseconds: 12500), (time) {
      controllerCircle.stop();
      controllerFull.forward().whenComplete(() => controllerMiddle.forward());
    });

    circleAnim.addListener(() {
      setState(() {});
    });
    circleFullAnim.addListener(() {
      setState(() {});
    });
    circleMiddleAnim.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: HomePaintCircle(
                offset: circleAnim.value,
                sizeCircle: circleFullAnim.value,
                offsetMiddle: circleMiddleAnim.value),
            size: Size(width, height),
            child: FadeTransition(
              opacity: circleFullAnim,
              child: Center(child: Image.asset("assets/images/diet_icon.png")),
            ),
          )
        ],
      ),
    );
  }
}
