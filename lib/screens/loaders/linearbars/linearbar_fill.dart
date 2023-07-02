import 'package:flutter/material.dart';
import 'dart:core';

class LinearbarFill extends StatefulWidget {
  final Size size;
  final Color backgroundColor;
  final Color color;

  const LinearbarFill({
    super.key,
    required this.size,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  State<LinearbarFill> createState() => _LinearbarFill();
}

class _LinearbarFill extends State<LinearbarFill>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10000),
    )..repeat();
    animation = Tween(begin: 0.0, end: widget.size.width).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                height: widget.size.height,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      widget.size.height / 2,
                    ),
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    height: widget.size.height,
                    width: animation.value,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            widget.size.height / 2,
                          ),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.yellow[700]!, Colors.redAccent],
                        )),
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        '${(animation.value / widget.size.width * 100).round()}',
                        style: TextStyle(
                          fontSize: widget.size.width / 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
