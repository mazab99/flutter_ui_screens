import 'package:flutter/material.dart';

import '../general/home_button.dart';

class MapButton extends StatelessWidget {
  const MapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeButton.child(
      onTap: () {},
      child: Image.asset(
        'assets/images/car/map.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
