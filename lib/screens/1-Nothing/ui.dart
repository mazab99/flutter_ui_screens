import 'package:flutter/material.dart';

import 'nothing.dart';

class NothingExample extends StatelessWidget {
  const NothingExample({super.key});

  @override
  Widget build(BuildContext context) {
    const bool hasData = true;
    return Scaffold(
      appBar: AppBar(title: const Text('Nothing')),
      body: Container(
        child: hasData
            ? const Center(
                child: Text('some text'),
              )
            : const Nothing(),
      ),
    );
  }
}
