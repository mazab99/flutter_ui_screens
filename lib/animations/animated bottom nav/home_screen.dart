import 'package:flutter/material.dart';

import 'menu_tab_bar.dart';

class AnimatedBottomWithsScreens extends StatefulWidget {
  const AnimatedBottomWithsScreens({super.key});

  @override
  State<AnimatedBottomWithsScreens> createState() => _Home();
}

class _Home extends State<AnimatedBottomWithsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            const Center(
              child: Text(
                "Test",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MenuTabBar(
              background: Colors.red,
              iconButtons: [
                IconButton(
                    color: Colors.red,
                    icon: const Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.red,
                    ),
                    onPressed: () {}),
                IconButton(
                    color: Colors.red,
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.red,
                    ),
                    onPressed: () {}),
                IconButton(
                    color: Colors.red,
                    icon: const Icon(
                      Icons.ac_unit,
                      size: 30,
                      color: Colors.red,
                    ),
                    onPressed: () {}),
                IconButton(
                  color: Colors.red,
                  icon: const Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          "Reminder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        "Camera",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          "Attchment",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        "Text Note",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
