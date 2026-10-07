import 'package:flutter/material.dart';
import 'package:lab_act_2_1/dice_roll.dart';



void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(colors: [
            Colors.red, 
            Colors.yellow
          ])
        ), 
      child: Center(
        child: DiceRoller(),
        ),
      ),
    ),
  ),
  ); 
}