import 'package:flutter/material.dart';

import 'dart:core';

class LinearbarFillBorder extends StatefulWidget {
  final Size size;
  final Color backgroundColor;
  final Color color;

  const LinearbarFillBorder({
    super.key,
    required this.size,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  State<LinearbarFillBorder> createState() => _LinearbarFill();
}

class _LinearbarFill extends State<LinearbarFillBorder>
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
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      widget.size.height / 2,
                    ),
                  ),
                  border: Border.all(
                    color: widget.backgroundColor,
                    style: BorderStyle.solid,
                    width: widget.size.height / 3,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: widget.size.height / 3,
                  right: widget.size.height / 3,
                ),
                child: Container(
                  height: widget.size.height / 3,
                  width: animation.value,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        widget.size.height / 6,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.yellow[700]!, Colors.redAccent],
                    ),
                  ),
                ),
              ),
            ],
          )),
          SizedBox(
            width: widget.size.width / 8,
            child: Text(
              '${(animation.value / (7 * widget.size.width / 8 - 2 * widget.size.height / 3) * 100).round()}%',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.size.width / 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
