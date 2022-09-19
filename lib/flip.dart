import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_panel/flip_panel.dart';

class MyFlip extends StatefulWidget {
  const MyFlip({super.key});

  @override
  State<MyFlip> createState() => _MyFlipState();
}

class _MyFlipState extends State<MyFlip> {
  final digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flip")),
      body: Center(
        child: SizedBox(
          height: 64.0,
          child: FlipClock.simple(
            startTime: DateTime.now(),
            digitColor: Colors.white,
            backgroundColor: Colors.black,
            digitSize: 48.0,
            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
          ),
        ),
      ),
    );
  }
}
