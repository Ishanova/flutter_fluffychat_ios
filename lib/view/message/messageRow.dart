import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/models/message.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';

class MessageRow extends ListTile {
  Chat chat;
  Message message;
  User user;
  bool isMe;

  Color contrastColor = const Color.fromARGB(255, 0, 145, 255);
  Color backgroundColor = const Color.fromARGB(25, 67, 66, 68);

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return ListView.builder(
        reverse: true,
        padding: EdgeInsets.only(top: 8.0, left: 15.0, right: 15.0),
        itemCount: message.messageText.length,
        itemBuilder: (context, index) {
          return Align(
            alignment:
                index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child: UnconstrainedBox(
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: index % 2 == 0
                    ? BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      )
                    : BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                child: Text(
                  message.messageText[index],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          );
        },
      );
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                  color: contrastColor,
                  // padding: EdgeInsets.all(7),
                ),
                // width: 300,
                // height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      message.messageText,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.white24,
                      ),
                    ),
                  ],
                ))
          ]);
    } else {
      return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
          color: backgroundColor,
        ),
        width: 300,
        height: 30,
        child: Text(
          message.messageText,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  MessageRow(Chat chat, Message message, User user, bool isMe) {
    this.chat = chat;
    this.message = message;
    this.user = user;
    this.isMe = isMe;
  }
}
