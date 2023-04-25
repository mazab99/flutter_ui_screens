import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

class Animated3DCar extends StatefulWidget {
  final CarAnimationType animationType;

  const Animated3DCar({
    required this.animationType,
    super.key,
  });

  @override
  State<Animated3DCar> createState() => _Animated3DCarState();
}

class _Animated3DCarState extends State<Animated3DCar> {
  late int _start;
  late double _amountOfFrames;

  late ImageSequenceAnimatorState _imageSequenceAnimator;

  @override
  void initState() {
    _start = 1;
    _amountOfFrames = 60;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Animated3DCar oldWidget) {
    if (oldWidget.animationType == widget.animationType) {
      super.didUpdateWidget(oldWidget);
      return;
    }
    if (oldWidget.animationType == CarAnimationType.topView && widget.animationType == CarAnimationType.topViewOpen) {
      _start = 180;
      _amountOfFrames = 60;
    } else if ((oldWidget.animationType == CarAnimationType.topView || oldWidget.animationType == CarAnimationType.topViewOpen) &&
        widget.animationType == CarAnimationType.sideView) {
      _start = 240;
      _amountOfFrames = 60;
    } else if (widget.animationType == CarAnimationType.sideView) {
      _start = 60;
      _amountOfFrames = 60;
    } else if (oldWidget.animationType == CarAnimationType.sideView && widget.animationType == CarAnimationType.topView) {
      _start = 120;
      _amountOfFrames = 60;
    }
    _imageSequenceAnimator.restart();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ImageSequenceAnimator(
      "assets/images/car",
      "sequence_",
      _start,
      3,
      "png",
      _amountOfFrames,
      fps: 60,
      waitUntilCacheIsComplete: true,
      onReadyToPlay: _onReadyToPlay,
    );
  }

  void _onReadyToPlay(ImageSequenceAnimatorState imageSequenceAnimator) {
    _imageSequenceAnimator = imageSequenceAnimator;
  }
}

enum CarAnimationType {
  zoomedIn,
  sideView,
  topView,
  topViewOpen,
}
