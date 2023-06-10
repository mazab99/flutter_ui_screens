import 'package:flutter/material.dart';

import 'moveable_dialog.dart';

class MoveableDialogScreen extends StatelessWidget {
  const MoveableDialogScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Moveable Dialog'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return MoveableDialog(
                          onClose: () {
                            Navigator.of(context).pop();
                          },
                          child: const SizedBox(
                            height: 200,
                            width: 300,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Mahmoud Azab',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  color: Colors.red,
                  child: const Text(
                    'Show Dialog',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
