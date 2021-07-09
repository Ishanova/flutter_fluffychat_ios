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
          leading: CupertinoNavigationBarBackButton(
              onPressed: () {
                Navigator.pop(context);
              },
              previousPageTitle: "Назад"),
          middle: Column(
            children: [
              Text(toView.getChatName(user.name)),
              Text(
                toView.chatName == ""
                    ? (toView.companionObj(user.name).onlineStatus.isOnline
                        ? "онлайн"
                        : "был в сети ${toView.companionObj(user.name).onlineStatus.lastDate} в ${toView.companionObj(user.name).onlineStatus.lastTime}")
                    : "${toView.memberList.length} участника",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 12,
                ),
              )
            ],
          ),
          trailing: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/ac.jpg",
              ),
            ),
          ),
        ),
        child: ListView(
            padding: EdgeInsets.only(left: 16, top: 20, right: 16),
            children: toView.messageList.map((message) {
              return new MessageRow(
                  toView, message, user, user.name == message.senderID);
            }).toList()));
  }

  MessagesView(User user, Chat toView) {
    this.user = user;
    this.toView = toView;
  }
}
