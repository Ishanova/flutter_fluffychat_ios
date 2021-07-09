import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final color = const Color.fromARGB(255, 0, 145, 255);

  bool isBig;
  int counter;
  double width, height, blur, spread, opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: height, minWidth: width),

        margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
        padding: EdgeInsets.symmetric(horizontal: 3),

        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(opacity),
                spreadRadius: spread,
                blurRadius: blur,
              )
            ],
        ),
        child: Text("$counter",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 11,
              color: Colors.white
            ),
        )
    );
  }

  Indicator(int size, [int counter]) {
    switch (size) {
        //small size
      case 0:
        this.width = 6;
        this.height = 6;
        this.blur = 1;
        this.spread = 1;
        this.opacity = 0.2;
        break;

        //medium size
      case 1:
        this.width = 13;
        this.height = 13;
        this.blur = 2;
        this.spread = 1;
        this.opacity = 0.5;
        this.counter = counter;
        break;

        //large size
      case 2:
        this.width = 24;
        this.height = 24;
        this.blur = 4;
        this.spread = 2;
        this.opacity = 0.7;
        this.counter = counter;
        break;
    }
  }
}