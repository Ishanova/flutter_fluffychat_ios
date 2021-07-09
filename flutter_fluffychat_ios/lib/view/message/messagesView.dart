import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/view/message/messageRow.dart';

class MessagesView extends StatelessWidget {
  User user;
  Chat toView;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            Text(toView.getChatName(user.name)),
            Text(
              toView.chatName == ""
                  ? (toView.companionObj(user.name).onlineStatus.isOnline
                      ? "online"
                      : "был в сети ${toView.companionObj(user.name).onlineStatus.lastDate} в ${toView.companionObj(user.name).onlineStatus.lastTime}")
                  : "${toView.memberList.length} участника",
              style: TextStyle(
                color: Colors.black26,
                fontSize: 12,
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/ac.jpg",
              width: 40,
              height: 40,
            ),
          ),
        )
      ])),
      child: (ListView(
          children: toView.messageList.map((message) {
        return new MessageRow(message, user);
      }).toList()
          //children: [
          //  MessageRow("Lorem ipsum dolor sit Amet.", "6:45", true)
          // ],
          )),
    );
  }

  MessagesView(User user, Chat toView) {
    this.user = user;
    this.toView = toView;
  }
}