import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageRow extends ListTile {
  String message,date;
  bool isFromMe;

  @override
  Widget build(BuildContext context) {
    if (isFromMe) {
        return
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Container(
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                   color: Colors.cyan,
                  // padding: EdgeInsets.all(7),
                 ),
                 width: 300,
                 height: 50,
                 child: Text(
                     message,
                   style: TextStyle(
                     fontSize: 14,
                     color: Colors.black,
                   ),
                 ),
               )
             ]
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