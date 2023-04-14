import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_screens/animations/stopwatch_flutter/ui/stopwatch.dart';

class StopWatchHomeScreen extends StatelessWidget {
  const StopWatchHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: AspectRatio(
              aspectRatio: 0.85,
              child: StopwatchScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
