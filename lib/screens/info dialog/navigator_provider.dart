import 'package:flutter/widgets.dart';

class NavigatorProvider extends InheritedWidget {
  final CustomDialogNavigator navigator;

  const NavigatorProvider({
    required this.navigator,
    required super.child,
    super.key,
  });

  static NavigatorProvider of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<NavigatorProvider>();
    assert(
      result != null,
      'Error No DialogNavigatorProvider found in this context',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(NavigatorProvider oldWidget) {
    return navigator != oldWidget.navigator;
  }
}

class CustomDialogNavigator {
  final ValueNotifier<List<CustomDialogPageBuilder>> pages;
  final BuildContext context;

  const CustomDialogNavigator({
    required this.pages,
    required this.context,
  });

  static CustomDialogNavigator of(BuildContext context) {
    return NavigatorProvider.of(context).navigator;
  }

  void close() {
    Navigator.of(context).pop();
  }
}

class CustomDialogPageBuilder {
  final Widget Function(BuildContext context) builder;
  final Alignment alignment;
  final Decoration? decoration;

  const CustomDialogPageBuilder({
    required this.builder,
    this.decoration,
    this.alignment = Alignment.center,
  });
}
