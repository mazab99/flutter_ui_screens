import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/loaders/triangularbar/triangular_bar.dart';
import 'package:flutter_ui_screens/screens/loaders/triangularbar/triangular_bar_fill.dart';
import 'package:flutter_ui_screens/screens/loaders/triangularbar/triangular_bar_line.dart';

import 'circularbar/circular_bar.dart';
import 'circularbar/circular_bar_fill.dart';
import 'circularbar/circular_bar_typed.dart';
import 'circularbar/circular_bar_typee.dart';
import 'circularbar/circular_bar_typef.dart';
import 'circularbar/hexagonal_bar.dart';
import 'linearbars/linearbar_border_fill.dart';
import 'linearbars/linearbar_fill.dart';

class LoadersExamples extends StatefulWidget {
  const LoadersExamples({
    Key? key,
  }) : super(key: key);

  @override
  _LoadersExamplesState createState() => _LoadersExamplesState();
}

class _LoadersExamplesState extends State<LoadersExamples> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF000046), Color(0xFF1CB5E0)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Loaders'),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearbarFillBorder(
                          size: Size(width * 0.95, height / 30),
                          backgroundColor: const Color(0xFF2A2A2A)),
                      SizedBox(
                        height: height / 20,
                      ),
                      LinearbarFill(
                          size: Size(width * 0.95, height / 30),
                          backgroundColor: const Color(0xFF2A2A2A)),
                      SizedBox(
                        height: height / 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: width / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircularProgressd(
                        size: width / 4,
                        color: const Color(0xFF1CB5E0),
                        backgroundColor: const Color(0xFF000046),
                      ),
                      CircularProgresse(
                        size: width / 4,
                        color: const Color(0xFF1CB5E0),
                        backgroundColor: const Color(0xFF000046),
                      ),
                      CircularProgressf(
                        size: width / 4,
                        color: const Color(0xFF35FFFD),
                        backgroundColor: const Color(0xFF051262),
                      )
                    ],
                  ),
                  SizedBox(
                    height: width / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircularProgressFill(
                        size: width / 4,
                        color: const Color(0xFF1CB5E0),
                        backgroundColor: const Color(0xFF000046),
                      ),
                      HexagonalProgress(
                        size: width / 4,
                        color: const Color(0xFF1CB5E0),
                        backgroundColor: const Color(0xFF000046),
                      ),
                      CircularProgress(
                        size: width / 4,
                        color: const Color(0xFF1CB5E0),
                        backgroundColor: const Color(0xFF000046),
                      )
                    ],
                  ),
                  SizedBox(
                    height: width / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TriangularProgressLine(
                        size: width / 4,
                        color: const Color(0xFF1CB5E0),
                        backgroundColor: const Color(0xFF000046),
                      ),
                      TriangularProgress(
                        size: width / 4,
                        color: const Color(0xFF1CB5E0),
                        backgroundColor: const Color(0xFF000046),
                      ),
                      TriangularProgressFill(
                        size: width / 4,
                        color: const Color(0xFF1CB5E0),
                        backgroundColor: const Color(0xFF000046),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
