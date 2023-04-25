import 'package:flutter/material.dart';

class LandingContent extends StatelessWidget {
  const LandingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome to our system",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "login in now ",
            style: TextStyle(fontSize: 24, color: Colors.blueGrey.shade300),
          )
        ],
      ),
    );
  }
}
