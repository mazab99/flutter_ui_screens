import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MoveableDialog extends StatefulWidget {
  final void Function()? onClose;
  final Widget? child;
  final bool enableDragAnimation;
  final bool autoCenter;
  final Widget closeIcon;
  final double? closeButtonRight;
  final double? closeButtonLeft;
  final double? closeButtonTop;
  final double? closeButtonBottom;
  final double? dialogLeft;
  final double? dialogTop;

  const MoveableDialog({
    super.key,
    this.onClose,
    this.autoCenter = true,
    this.child,
    this.enableDragAnimation = true,
    this.closeIcon = const Icon(Icons.close),
    this.closeButtonRight = 0,
    this.closeButtonLeft,
    this.closeButtonTop,
    this.closeButtonBottom,
    this.dialogLeft,
    this.dialogTop,
  });

  @override
  MoveableDialogState createState() => MoveableDialogState();
}

class MoveableDialogState extends State<MoveableDialog> {
  bool _dragging = false;
  double _xOffset = -1;
  double _yOffset = -1;
  Rect _rect = Rect.zero;
  final widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
  }

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    if (_rect == Rect.zero && widget.autoCenter) {
      final r = (context.findRenderObject()?.paintBounds);
      if (r != null) {
        _rect = r;
        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_rect != Rect.zero && widget.autoCenter && _xOffset == -1) {
      _xOffset = (MediaQuery.of(context).size.width - _rect.width) / 2;
      _yOffset = (MediaQuery.of(context).size.height - _rect.height) / 2;
    } else {
      if (_xOffset == -1) {
        _xOffset = widget.dialogLeft ?? _xOffset;
        _yOffset = widget.dialogTop ?? _yOffset;
      }
    }
    return Opacity(
      opacity: (widget.autoCenter && _rect == Rect.zero) ? 0 : 1,
      child: Stack(
        children: [
          Positioned(
            left: _xOffset == -1 ? 0 : _xOffset,
            top: _yOffset == -1 ? 0 : _yOffset,
            child: GestureDetector(
              onPanStart: (details) {
                if (mounted) {
                  setState(() {
                    _dragging = true;
                  });
                }
              },
              onPanUpdate: (details) {
                if (mounted) {
                  setState(() {
                    _xOffset += details.delta.dx;
                    _yOffset += details.delta.dy;
                  });
                }
              },
              onPanEnd: (details) {
                if (mounted) {
                  setState(() {
                    _dragging = false;
                  });
                }
              },
              child: AnimatedOpacity(
                duration: Duration(milliseconds: _dragging ? 0 : 500),
                opacity: _dragging && widget.enableDragAnimation ? 0.8 : 1.0,
                child: Dialog(
                  insetPadding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      LayoutBuilder(
                        key: widgetKey,
                        builder: (context, constraints) {
                          return (widget.child ??
                              const SizedBox(
                                height: 100,
                              ));
                        },
                      ),
                      if (widget.onClose != null)
                        Positioned(
                          right: widget.closeButtonRight,
                          left: widget.closeButtonLeft,
                          top: widget.closeButtonTop,
                          bottom: widget.closeButtonBottom,
                          child: IconButton(
                            icon: widget.closeIcon,
                            onPressed: () {
                              widget.onClose!();
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
