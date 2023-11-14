import 'package:flutter/material.dart';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  return runApp(const MaterialApp(home: DicePage()));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 2;
  int right = 3;
  int counter = 0;

  void rand() {
    setState(() {
      left = 1 + Random().nextInt(6);
      right = 1 + Random().nextInt(6);
      counter++;
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    left == right ? 'images/gojo.gif' : 'images/dicePFP.gif'),
                fit: BoxFit.cover),
          ),
        ),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.w900,
            fontFamily: 'Edu',
            color: Color.fromARGB(255, 35, 34, 34),
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText('Dice-'),
              RotateAnimatedText('Dice--'),
              RotateAnimatedText('Baby---'),
            ],
            repeatForever: true,
            pause: const Duration(milliseconds: 3000),
          ),
        ),
        Center(
            child: Container(
          width: 380,
          height: 320,
          decoration: const BoxDecoration(
              color: Color.fromARGB(150, 255, 179, 193),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        )),
        Column(
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
                        },
                        child: Image.asset('images/dice$right.png'),
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                'Total Dice Roll:$counter',
                style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.tonal(
                  onPressed: () {
                    reset();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 89, 13, 35),
                    minimumSize: const Size(150, 50),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                FilledButton.tonal(
                  onPressed: () {
                    rand();
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 89, 13, 35),
                    minimumSize: const Size(150, 50),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text(
                    'Roll',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
