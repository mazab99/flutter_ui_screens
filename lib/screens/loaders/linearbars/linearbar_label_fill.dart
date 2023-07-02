import 'package:flutter/material.dart';

import 'dart:core';

class LinearbarFillLabel extends StatefulWidget {
  final Size size;
  final Color backgroundColor;
  final Color color;

  const LinearbarFillLabel({
    super.key,
    required this.size,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  State<LinearbarFillLabel> createState() => _LinearbarFill();
}

class _LinearbarFill extends State<LinearbarFillLabel>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 20000,
      ),
    )..repeat();
    animation = Tween(
            begin: 0.0,
            end: 7 * widget.size.width / 8 - 2 * widget.size.height / 3)
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      color: Colors.yellow[800],
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: widget.size.height / 2),
            child: Container(
              color: Colors.yellow[700],
            ),
          )
        ],
      ),
    );
  }
}
