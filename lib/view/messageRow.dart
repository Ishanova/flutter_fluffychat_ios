import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/newModels/Chat.dart';

class MessageRow extends ListTile {
  String message,date;
  bool isFromMe;
  Color contrastColor = const Color.fromARGB(255, 0, 145, 255);
  Color backgroundColor = const Color.fromARGB(25, 67, 66, 68);

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
                   color: contrastColor,
                  // padding: EdgeInsets.all(7),
                 ),
                 width: 300,
                 height: 50,
                 child: Text(
                     message,
                   style: TextStyle(
                     fontSize: 14,
                     color: Colors.white,
                   ),
                 ),
               )
             ]
           );

    } else {
        return Container(
          alignment: Alignment.centerLeft,
          color: backgroundColor,
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