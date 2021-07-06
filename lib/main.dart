import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red.shade500,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dicee',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //when our app start rightButtonNumber will be initilized with 1
  int rightButtonNumber = 1;
  int leftButtonNumber = 6;
  void changeDiceFace() {
    setState(() {
      leftButtonNumber = Random().nextInt(6) + 1;
      rightButtonNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          //to avoid the overflow we use expanded widget
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextButton(
                child: Image.asset('images/dice$leftButtonNumber.png'),
                onPressed: () {
                  changeDiceFace();
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextButton(
                child: Image.asset('images/dice$rightButtonNumber.png'),
                onPressed: () {
                  changeDiceFace();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
