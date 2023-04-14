import 'package:flutter/material.dart';
import 'dart:async';

class SliderBall extends StatefulWidget {
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final int initialValue;
  final int finalValue;
  final TextStyle textStyle;
  final GlobalKey _keyContent = GlobalKey();
  final Function onSelectStart;
  final Function onSelectEnd;

  SliderBall({super.key,
    this.backgroundColor = const Color(0xFF6168E7),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    required this.initialValue,
    required this.finalValue,
    this.textStyle = const TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    required this.onSelectStart,
    required this.onSelectEnd,
  })  : assert(initialValue < finalValue),
        assert(textStyle.fontSize != null);

  @override
  State<SliderBall> createState() => _SliderBall();
}

class _SliderBall extends State<SliderBall> with TickerProviderStateMixin {
  late AnimationController _controllerUp;
  late Animation<double> _animationUp;
  late SliderBallBloc _sliderBallBloc;
  late double _circleSize;
  late int _selectedValue;

  @override
  void initState() {
    _circleSize = widget.textStyle.fontSize! * 2.8;
    _sliderBallBloc = SliderBallBloc(widget.initialValue, widget.finalValue);
    _controllerUp =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _controllerUp.addListener(() {
      setState(() {});
    });

    _animationUp =
        Tween<double>(begin: 0.0, end: _circleSize * 2).animate(CurvedAnimation(
      parent: _controllerUp,
      curve: Curves.elasticOut,
    ));

    _sliderBallBloc.valueStream.listen((value) {
      _selectedValue = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: widget.borderRadius,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("${widget.initialValue}", style: widget.textStyle),
              Expanded(
                child: Container(
                  key: widget._keyContent,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  height: widget.textStyle.fontSize,
                  child: Text(_generateDots(context),
                      style: const TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center),
                ),
              ),
              Text("${widget.finalValue}", style: widget.textStyle),
            ],
          ),
        ),
        StreamBuilder(
            initialData: EdgeInsets.zero,
            stream: _sliderBallBloc.marginStream,
            builder: (context, AsyncSnapshot snapshot) {
              return Container(
                margin: snapshot.data,
                padding: EdgeInsets.only(bottom: _circleSize * 2),
                child: ClipPath(
                  clipper: FluidClipper(
                    convex: _animationUp.value / (_circleSize * 2),
                  ),
                  child: Container(
                    width: _circleSize * 5,
                    height: _circleSize,
                    decoration: BoxDecoration(color: widget.backgroundColor),
                  ),
                ),
              );
            }),
        StreamBuilder(
          initialData: EdgeInsets.zero,
          stream: _sliderBallBloc.marginStream,
          builder: (context, AsyncSnapshot snapshot) {
            return GestureDetector(
              child: Container(
                  padding: snapshot.data,
                  margin: EdgeInsets.only(bottom: _animationUp.value),
                  child: ClipOval(
                      child: Container(
                    width: _circleSize,
                    height: _circleSize,
                    decoration: BoxDecoration(color: widget.backgroundColor),
                    child: Center(
                        child: Container(
                      decoration: BoxDecoration(
                          color: widget.textStyle.color,
                          shape: BoxShape.circle),
                      margin: const EdgeInsets.all(5),
                      child: Center(
                          child: StreamBuilder(
                              initialData:
                                  (widget.initialValue + widget.finalValue) ~/
                                      2,
                              stream: _sliderBallBloc.valueStream,
                              builder: (context, AsyncSnapshot snapshot) {
                                return Text(
                                  "${snapshot.data}",
                                  style: TextStyle(
                                    fontSize: widget.textStyle.fontSize! - 4,
                                    color: widget.backgroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              })),
                    )),
                  ))),
              onHorizontalDragStart: (data) {
                _sliderBallBloc.updateStartPosition(data.globalPosition.dx);
                _sliderBallBloc.updateMarginLimit(_getLimitsToMove());
                _controllerUp.forward();

                widget.onSelectStart();
              },
              onHorizontalDragEnd: (_) {
                _controllerUp.reverse();

                widget.onSelectEnd(_selectedValue);
              },
              onHorizontalDragUpdate: (data) {
                _sliderBallBloc.movement(data.globalPosition.dx);
              },
            );
          },
        ),
      ],
    );
  }

  _generateDots(BuildContext context) {
    return "   ·   " * (MediaQuery.of(context).size.width).toInt();
  }

  _getLimitsToMove() {
    final RenderBox renderBoxRed =
        widget._keyContent.currentContext!.findRenderObject() as RenderBox;
    return renderBoxRed.size.width / 1.5; // total size plus margin
  }
}

class SliderBallBloc {
  final int? initialValue;
  final int? finalValue;
  int? _middle;

  double _startGlobalPosition = 0;
  double _marginLimit = 1;

  StreamController<EdgeInsets>? _marginStream;
  StreamController<int>? _valueStream;

  SliderBallBloc(this.initialValue, this.finalValue) {
    _marginStream = StreamController.broadcast();
    _valueStream = StreamController.broadcast();
    _middle = (initialValue! + finalValue!) ~/ 2;
  }

  updateStartPosition(double value) {
    if (_startGlobalPosition == 0) _startGlobalPosition = value;
  }

  updateMarginLimit(value) {
    if (_marginLimit == 1) _marginLimit = value;
  }

  movement(double value) {
    double movementData = _startGlobalPosition - value;
    bool isLeft = movementData.isNegative;
    double margin = isLeft ? movementData * -1 : movementData;

    margin += margin * (margin / _marginLimit);
    if (margin > _marginLimit) margin = _marginLimit;

    _updateMargin(isLeft, margin);
    _updateValue(isLeft, margin);
  }

  _updateValue(bool isLeft, double margin) {
    int value = ((finalValue! - _middle!) * margin) ~/ _marginLimit;

    if (isLeft) {
      _valueStream!.sink.add(value + _middle!);
    } else {
      _valueStream!.sink.add(_middle! - value);
    }
  }

  _updateMargin(bool isLeft, double margin) {
    if (isLeft) {
      _marginStream!.sink.add(EdgeInsets.only(left: margin));
    } else {
      _marginStream!.sink.add(EdgeInsets.only(right: margin));
    }
  }

  Stream get marginStream => _marginStream!.stream;

  Stream get valueStream => _valueStream!.stream;
}

class FluidClipper extends CustomClipper<Path> {
  double convex;

  FluidClipper({required this.convex});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, size.height, size.width / 2,
        (size.height - (size.height * convex)));
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
