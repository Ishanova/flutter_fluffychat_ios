import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageRow extends ListTile {
  String message,date;
  bool isFromMe;

  @override
  Widget build(BuildContext context) {

    if (isFromMe) {
        return
           Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                color: Colors.cyan,
              ),
              height: 50,
              padding: EdgeInsets.all(7),
              child: Text(message),
            );

    } else {
        return Container(
          alignment: Alignment.centerLeft,
          color: Colors.grey,
          height: 30,
          child: Text(message),
        );
    }
  }

  MessageRow(String message, date, bool isFromMe) {
    this.message = message;
    this.date = date;
    this.isFromMe = isFromMe;
  }
}