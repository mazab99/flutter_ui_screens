import 'package:flutter/material.dart';

import 'navigator_provider.dart';

class CustomInfoDialog extends StatelessWidget {
  final CustomDialogPageBuilder pageBuilder;
  final EdgeInsetsGeometry dialogPadding;
  final Duration alignmentDuration;
  final Curve alignmentCurve;
  final Duration sizeDuration;
  final Curve sizeCurve;
  final Duration transitionDuration;
  final Duration reverseTransitionDuration;
  final Curve transitionCurve;
  final Curve reverseTransitionCurve;
  final AnimatedSwitcherTransitionBuilder? transitionBuilder;
  final Decoration? defaultDecoration;

  const CustomInfoDialog({
    required this.pageBuilder,
    super.key,
    this.dialogPadding = const EdgeInsets.all(12),
    this.alignmentDuration = const Duration(milliseconds: 500),
    this.alignmentCurve = const Cubic(0.2, 0, 0, 1),
    this.sizeDuration = const Duration(milliseconds: 300),
    this.sizeCurve = const Cubic(0.2, 0, 0, 1),
    this.transitionBuilder,
    this.transitionDuration = const Duration(milliseconds: 600),
    this.reverseTransitionDuration = const Duration(milliseconds: 100),
    this.transitionCurve = Curves.easeInOutCubicEmphasized,
    this.reverseTransitionCurve = Curves.easeInOutCubicEmphasized,
    this.defaultDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: dialogPadding,
      child: NavigatorProvider(
        navigator: CustomDialogNavigator(
          context: context,
          pages: ValueNotifier([pageBuilder]),
        ),
        child: Builder(
          builder: (context) {
            return ValueListenableBuilder(
              valueListenable: CustomDialogNavigator.of(context).pages,
              builder: (context, List<CustomDialogPageBuilder> value, child) {
                final page = value.last;
                return AnimatedAlign(
                  duration: alignmentDuration,
                  curve: alignmentCurve,
                  alignment: page.alignment,
                  child: Material(
                    borderOnForeground: false,
                    color: Colors.transparent,
                    child: AnimatedContainer(
                      duration: transitionDuration,
                      curve: transitionCurve,
                      decoration: page.decoration ??
                          defaultDecoration ??
                          BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(16),
                          ),
                      child: AnimatedSize(
                        duration: sizeDuration,
                        curve: sizeCurve,
                        reverseDuration: sizeDuration,
                        child: AnimatedSwitcher(
                          duration: transitionDuration,
                          reverseDuration: reverseTransitionDuration,
                          switchInCurve: transitionCurve,
                          switchOutCurve: reverseTransitionCurve,
                          transitionBuilder: transitionBuilder ??
                              (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                          child: page.builder(context),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
