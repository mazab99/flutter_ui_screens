import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? child;
  final PhosphorIconData? iconData;
  final String? text;
  final Color? color;

  const HomeButton.text({
    required this.onTap,
    required PhosphorIconData this.iconData,
    required String this.text,
    this.color,
    super.key,
  }) : child = null;

  const HomeButton.child({
    required this.onTap,
    required Widget this.child,
    super.key,
  })  : text = null,
        color = null,
        iconData = null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF131313),
          padding: child == null ? const EdgeInsets.all(16) : null,
          child: Column(
            children: [
              if (child != null) ...[
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: child!,
                  ),
                ),
              ],
              if (iconData != null) ...[
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: PhosphorIcon(
                      iconData!,
                      size: 32,
                      color: color ?? Colors.white,
                    ),
                  ),
                ),
              ],
              if (text != null) ...[
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        text!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_double_arrow_right_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
