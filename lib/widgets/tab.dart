import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabModel extends StatelessWidget{
  String tabName;
  bool isUnread;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(tabName),

        isUnread ? Indicator() : Text("")
      ],
    );
  }
   TabModel (String tabName, bool isUnread) {
     this.tabName = tabName;
     this.isUnread = isUnread;
   }
}

class Indicator extends StatelessWidget{
  final contrastColor = const Color.fromARGB(255, 0, 145, 255);

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
    );
  }
}