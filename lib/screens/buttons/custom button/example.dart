import 'package:flutter/material.dart';

import '../custom_button.dart';

class CustomButtonExample extends StatefulWidget {
  const CustomButtonExample({super.key});

  @override
  State<CustomButtonExample> createState() => _CustomButtonExampleState();
}

class _CustomButtonExampleState extends State<CustomButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Custom Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 40.0,
            ),
            CustomButton(
              color: Colors.green,
              onPressed: () {},
              child: const Text(
                'Click',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
