import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Indicator extends StatelessWidget{
  final contrastColor = const Color.fromARGB(255, 0, 145, 255);
  int counter;


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 13, minHeight: 13),
      margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
      padding: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: contrastColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: contrastColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Text("$counter",
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 11.0,
            color: Colors.white
        ),
      ),
    );
  }
  Indicator (int counter) {
    this.counter = counter;
  }
}