import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/info%20dialog/custom_info_dialog.dart';
import 'navigator_provider.dart';

const String fakeText = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
sed do eiusmod tempor incididunt ut labore et dolore magna 
aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat. 
 Duis aute irure dolor in reprehenderit in voluptate velit 
 esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
 occaecat cupidatat non proident, sunt in culpa qui officia 
 deserunt mollit anim id est laborum. Scripta periculis ei eam,
''';

class CustomDialogExample extends StatelessWidget {
  const CustomDialogExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Dialog Screen1'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              showModal(
                context: context,
                builder: (context) => CustomInfoDialog(
                  alignmentCurve: Curves.easeInOutCubicEmphasized,
                  sizeDuration: const Duration(milliseconds: 300),
                  alignmentDuration: const Duration(milliseconds: 600),
                  transitionDuration: const Duration(milliseconds: 300),
                  reverseTransitionDuration: const Duration(milliseconds: 50),
                  transitionBuilder: (child, animation) => FadeScaleTransition(
                    animation: animation,
                    child: child,
                  ),
                  defaultDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  pageBuilder: CustomDialogPageBuilder(
                    alignment: Alignment.topRight,
                    builder: (context) => const AboutMePage(),
                  ),
                ),
              );
            },
            child: const Center(
              child: Text(
                'About Mahmoud',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutMePage extends StatelessWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    CustomDialogNavigator.of(context).close();
                  },
                  icon: const Icon(Icons.close),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            ),
            Text(
              'Mahmoud Azab',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print('Hello Mahmoud');
                }
              },
              child: const Text(fakeText),
            ),
          ],
        ),
      ),
    );
  }
}
