import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice Dice Baby'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 2;
  int right = 2;
  int counter = 0;
  void rand() {
    setState(() {
      left = 1 + Random().nextInt(6);
      right = 1 + Random().nextInt(6);
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      onPressed: () {
                        rand();
                        print('left image is clicked!');
                      },
                      child: Image.asset('images/dice$left.png'),
                    )),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      onPressed: () {
                        rand();
                        print('right image is clicked!');
                      },
                      child: Image.asset('images/dice$right.png'),
                    )),
              ),
            ],
          ),
          Text('Total Dice Roll:$counter'),
        ],
      ),
    );
  }
}
