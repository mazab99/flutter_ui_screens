import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UniversalBubbleButtonWidget extends StatelessWidget {
  final DragStartBehavior dragStartBehavior;

  final Widget? child;
  final List<Widget>? children;

  final double? radius;
  final bool enabled;

  final GestureTapCallback? onTap;

  final GestureTapUpCallback? onTapUp;

  final GestureTapCallback? onDoubleTap;
  final GestureTapDownCallback? onDoubleTapDown;
  final GestureTapCancelCallback? onDoubleTapCancel;

  final GestureLongPressCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;

  final GestureTapCancelCallback? onTapCancel;

  final bool excludeFromSemantics;
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapUpCallback? onSecondaryTapUp;
  final GestureTapCancelCallback? onSecondaryTapCancel;

  final GestureLongPressStartCallback? onLongPressStart;

  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;

  final GestureLongPressUpCallback? onLongPressUp;

  final GestureLongPressEndCallback? onLongPressEnd;
  final GestureLongPressCancelCallback? onLongPressCancel;
  final GestureLongPressDownCallback? onLongPressDown;

  final GestureDragDownCallback? onVerticalDragDown;

  final GestureDragStartCallback? onVerticalDragStart;

  final GestureDragUpdateCallback? onVerticalDragUpdate;

  final GestureDragEndCallback? onVerticalDragEnd;

  final GestureDragCancelCallback? onVerticalDragCancel;

  final GestureDragDownCallback? onHorizontalDragDown;

  final GestureDragStartCallback? onHorizontalDragStart;

  final GestureDragUpdateCallback? onHorizontalDragUpdate;

  final GestureDragEndCallback? onHorizontalDragEnd;

  final GestureDragCancelCallback? onHorizontalDragCancel;

  final GestureDragDownCallback? onPanDown;

  final GestureDragStartCallback? onPanStart;

  final GestureDragUpdateCallback? onPanUpdate;

  final GestureDragEndCallback? onPanEnd;

  final GestureDragCancelCallback? onPanCancel;
  final GestureScaleStartCallback? onScaleStart;
  final GestureScaleUpdateCallback? onScaleUpdate;
  final GestureScaleEndCallback? onScaleEnd;
  final GestureForcePressStartCallback? onForcePressStart;
  final GestureForcePressPeakCallback? onForcePressPeak;
  final GestureForcePressUpdateCallback? onForcePressUpdate;
  final GestureForcePressEndCallback? onForcePressEnd;
  final GestureLongPressCallback? onTertiaryLongPress;
  final GestureLongPressCancelCallback? onTertiaryLongPressCancel;
  final GestureLongPressDownCallback? onTertiaryLongPressDown;
  final GestureLongPressEndCallback? onTertiaryLongPressEnd;
  final GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate;
  final GestureLongPressStartCallback? onTertiaryLongPressStart;
  final GestureLongPressUpCallback? onTertiaryLongPressUp;
  final GestureTapCancelCallback? onTertiaryTapCancel;
  final GestureTapDownCallback? onTertiaryTapDown;
  final GestureTapUpCallback? onTertiaryTapUp;
  final GestureTapCallback? onSecondaryTap;
  final GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate;
  final GestureLongPressCallback? onSecondaryLongPressUp;
  final GestureLongPressCallback? onSecondaryLongPress;
  final GestureLongPressEndCallback? onSecondaryLongPressEnd;
  final GestureLongPressStartCallback? onSecondaryLongPressStart;
  final GestureLongPressCancelCallback? onSecondaryLongPressCancel;
  final GestureLongPressDownCallback? onSecondaryLongPressDown;

  final HitTestBehavior behavior;

  const UniversalBubbleButtonWidget({
    super.key,
    this.enabled = false,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
    this.behavior = HitTestBehavior.opaque,
    this.child,
    this.children,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.onLongPress,
    this.onLongPressCancel,
    this.onLongPressDown,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.radius,
    this.onSecondaryTap,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressUp,
    this.onSecondaryLongPress,
    this.onSecondaryLongPressEnd,
    this.onSecondaryLongPressStart,
    this.onSecondaryLongPressCancel,
    this.onSecondaryLongPressDown,
    this.onTertiaryLongPress,
    this.onTertiaryLongPressCancel,
    this.onTertiaryLongPressDown,
    this.onTertiaryLongPressEnd,
    this.onTertiaryLongPressMoveUpdate,
    this.onTertiaryLongPressStart,
    this.onTertiaryLongPressUp,
    this.onTertiaryTapCancel,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
  });

  @override
  Widget build(BuildContext context) {
    Widget current = const SizedBox();
    if (children != null && children!.isNotEmpty) {
      if (child != null) children!.insert(0, child!);
    } else if (child != null) {
      current = child!;
    }

    if (enabled ||
        onTap != null ||
        onDoubleTap != null ||
        onLongPress != null) {
      current = buildGestureDetector(current);
    }
    return current;
  }

  Widget buildGestureDetector(Widget current) => GestureDetector(
        onTap: onTap,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        onDoubleTap: onDoubleTap,
        onDoubleTapDown: onDoubleTapDown,
        onDoubleTapCancel: onDoubleTapCancel,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onLongPressEnd: onLongPressEnd,
        onLongPressCancel: onLongPressCancel,
        onLongPressDown: onLongPressDown,
        onSecondaryTapDown: onSecondaryTapDown,
        onSecondaryTapUp: onSecondaryTapUp,
        onSecondaryTapCancel: onSecondaryTapCancel,
        onSecondaryTap: onSecondaryTap,
        onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
        onSecondaryLongPressUp: onSecondaryLongPressUp,
        onSecondaryLongPress: onSecondaryLongPress,
        onSecondaryLongPressEnd: onSecondaryLongPressEnd,
        onSecondaryLongPressStart: onSecondaryLongPressStart,
        onSecondaryLongPressCancel: onSecondaryLongPressCancel,
        onSecondaryLongPressDown: onSecondaryLongPressDown,
        onVerticalDragDown: onVerticalDragDown,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onVerticalDragEnd: onVerticalDragEnd,
        onVerticalDragCancel: onVerticalDragCancel,
        onHorizontalDragDown: onHorizontalDragDown,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onForcePressStart: onForcePressStart,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onForcePressEnd: onForcePressEnd,
        onTertiaryLongPress: onTertiaryLongPress,
        onTertiaryLongPressCancel: onTertiaryLongPressCancel,
        onTertiaryLongPressDown: onTertiaryLongPressDown,
        onTertiaryLongPressEnd: onTertiaryLongPressEnd,
        onTertiaryLongPressMoveUpdate: onTertiaryLongPressMoveUpdate,
        onTertiaryLongPressStart: onTertiaryLongPressStart,
        onTertiaryLongPressUp: onTertiaryLongPressUp,
        onTertiaryTapCancel: onTertiaryTapCancel,
        onTertiaryTapDown: onTertiaryTapDown,
        onTertiaryTapUp: onTertiaryTapUp,
        onPanDown: onPanDown,
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        onPanCancel: onPanCancel,
        onScaleStart: onScaleStart,
        onScaleUpdate: onScaleUpdate,
        onScaleEnd: onScaleEnd,
        behavior: behavior,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: current,
      );
}
