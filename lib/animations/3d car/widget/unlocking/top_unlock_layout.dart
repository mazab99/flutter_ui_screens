import 'package:flutter/material.dart';

class TopUnlockLayout extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onBackTapped;

  const TopUnlockLayout({
    required this.isOpen,
    required this.onBackTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onBackTapped,
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Your car is ${isOpen ? 'unlocked' : 'locked'}!!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
