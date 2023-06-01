import 'package:flutter/material.dart';

//     Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AnimatedLoading(index: 20, color: Colors.amberAccent),
//                       AnimatedLoading(index: 18, color: Colors.red),
//                       AnimatedLoading(index: 16, color: Colors.pink),
//                       AnimatedLoading(index: 14, color: Colors.purpleAccent),
//                       AnimatedLoading(index: 12, color: Colors.orange),
//                       AnimatedLoading(index: 10, color: Colors.amberAccent),
//                       AnimatedLoading(index: 8, color: Colors.red),
//                       AnimatedLoading(index: 4, color: Colors.pink),
//                       AnimatedLoading(index: 2, color: Colors.purpleAccent),
//                       AnimatedLoading(index: 2, color: Colors.orange),
//                       AnimatedLoading(index: 4, color: Colors.amberAccent),
//                       AnimatedLoading(index: 6, color: Colors.red),
//                       AnimatedLoading(index: 8, color: Colors.pink),
//                       AnimatedLoading(index: 10, color: Colors.purpleAccent),
//                       AnimatedLoading(index: 12, color: Colors.orange),
//                       AnimatedLoading(index: 14, color: Colors.amberAccent),
//                       AnimatedLoading(index: 16, color: Colors.red),
//                       AnimatedLoading(index: 18, color: Colors.pink),
//                       AnimatedLoading(index: 20, color: Colors.purpleAccent),
//                     ],
//                   ),
class AnimatedLoading extends StatefulWidget {
  const AnimatedLoading({
    super.key,
    required this.index,
    required this.color,
  });

  final int index;
  final Color color;

  @override
  State<AnimatedLoading> createState() => _AnimatedLoadingState();
}

class _AnimatedLoadingState extends State<AnimatedLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(
      begin: 2,
      end: 50,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    super.initState();
    Future.delayed(Duration(milliseconds: widget.index * 80), () {
      _animationController.forward();
    });
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      } else if (_animationController.isDismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          margin: const EdgeInsets.all(2),
          width: 8,
          height: _animation.value,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      },
    );
  }
}
