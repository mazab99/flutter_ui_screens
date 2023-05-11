import 'package:flutter/material.dart';

class EgyptFlag extends StatefulWidget {
  const EgyptFlag({super.key});

  @override
  State<EgyptFlag> createState() => _EgyptFlagState();
}

class _EgyptFlagState extends State<EgyptFlag> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(minutes: 5), vsync: this);
    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              color: Colors.red,
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            child: Image.asset(
              'assets/images/rl0mj2_large.png',

              fit: BoxFit.fitHeight,
              height: 100.0,
              width: 100.0,
            ),
            builder: (BuildContext context, Widget? widget) {
              return Transform.rotate(
                angle: _controller.value * 300,
                child: widget,
              );
            },
          ),
          RotatedBox(
            quarterTurns: 2,
            child: ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5 - 100,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * 0.5, size.height - 30.0);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
