import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceImage = 'assets/dice-images/dice-2.png';
  void rollDice() {
    currentDiceImage = 'assets/dice-images/dice-4.png';
  }

  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(width: 200, 'assets/dice-images/dice-2.png'),
        SizedBox(height: 30),
        TextButton(
          onPressed: rollDice,
          child: Text(style: TextStyle(fontSize: 28), "Roll Dice"),
        ),
      ],
    );
  }
}
