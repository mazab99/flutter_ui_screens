import 'package:flutter/material.dart';
import 'overlay_container.dart';

class OverLayScreen extends StatelessWidget {
  const OverLayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overlay Container Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OverLayScreenContent(),
    );
  }
}

class OverLayScreenContent extends StatefulWidget {
  const OverLayScreenContent({super.key});

  _OverLayScreenContentState createState() => _OverLayScreenContentState();
}

class _OverLayScreenContentState extends State<OverLayScreenContent> {
  bool _dropdownShown = false;

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay Container '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MaterialButton(
              onPressed: _toggleDropdown,
              child: const Column(
                children: <Widget>[
                  Text("Press"),
                ],
              ),
            ),
            OverlayContainer(
              show: _dropdownShown,
              position: const OverlayContainerPosition(
                150,
                45,
              ),
              child: Container(
                height: 70,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 3,
                      spreadRadius: 6,
                    )
                  ],
                ),
                child: const Text("I render outside the \nwidget hierarchy."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
