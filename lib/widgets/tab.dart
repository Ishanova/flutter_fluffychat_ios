import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TabModel extends StatelessWidget{
  String tabName;
  bool isUnread;
  int counter;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(tabName),
        isUnread ? Indicator(counter) : Text("")
      ],
    );
  }
   TabModel (String tabName, bool isUnread, int counter) {
     this.tabName = tabName;
     this.isUnread = isUnread;
     this.counter = counter;
   }
}

class Indicator extends StatelessWidget{
  final contrastColor = const Color.fromARGB(255, 0, 145, 255);
  int counter;


  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: contrastColor,
        borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: contrastColor,
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
      child: Text("$counter",
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 14.0,
            color: Colors.white
        ),
      ),
    );
  }
  Indicator (int counter) {
    this.counter = counter;
  }
}