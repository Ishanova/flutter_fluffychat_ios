import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SmallIndicator extends StatelessWidget{
  final contrastColor = const Color.fromARGB(255, 0, 145, 255);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: contrastColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: contrastColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
    );
  }
}