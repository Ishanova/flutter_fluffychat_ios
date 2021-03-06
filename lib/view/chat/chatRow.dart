import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fluffychat_ios/helper/avatarka.dart';
import 'package:flutter_fluffychat_ios/helper/counter.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/view/message/messagesView.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/icons_mute.dart';
import 'dart:math';

import 'package:flutter_fluffychat_ios/models/chat.dart';

class ChatRow extends StatelessWidget {
  Chat toRow;
  User user = me;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => MessagesView(user, toRow)));
      },
      child: Container(
          child: Row(
        children: [
          Avatarka("assets/ac.jpg", isOnline(toRow)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    //width: 250,
                    child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Text(
                          toRow.getChatName(user.userID),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          softWrap: false,
                          style: new TextStyle(
                              fontFamily: "SFProText",
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: user.isMute(toRow.chatName),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(4, 3, 0, 3),
                        child: Icon(
                          Icons_Mute.mute_fil_16,
                          size: 16,
                          color: iconGrey,
                        ),
                      ),
                    )
                  ],
                )),
                Row(children: [
                  Container(
                    child: Text(
                      (isFromMe(user.userID, toRow.messageList.last.senderID)
                          ? "????: "
                          : NameView(toRow.messageList.last.senderID) + ": "),
                      style: TextStyle(
                          fontFamily: "SFProText",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: transparentGrey),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Text(
                        toRow.messageList.last.messageText,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                            fontFamily: "SFProText",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: grey),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(4, 2, 0, 2),
                    child: Text(
                      " ?? ${toRow.messageList.last.time}",
                      style: TextStyle(
                        fontFamily: "SFProText",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: transparentGrey,
                      ),
                    ),
                  ),
                ])
              ],
            ),
            flex: 3,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: isTagged(toRow),
                    child: Align(child: Counter(3)),
                  ),
                  Container(width: 6, height: 0,),
                  Visibility(
                    visible: !toRow.messageList.last.isRead(user.userID) ||
                        !toRow.messageList.last.isRead(toRow.companion(user.userID)),
                    child: (!toRow.messageList.last.isRead(user.userID))
                        ? Align(child: Counter(2, toRow.unreadCount(user.userID), user.isMute(toRow.chatName) ? iconGrey : blue))
                        : Align(child: Counter(0)),
                  ),
                ],
              ),
            ),
            flex: 1,
          )
        ],
      )),
    );
  }

  ChatRow(Chat toRow) {
    this.toRow = toRow;
  }
  bool isMute(User toCompare) {
    return toRow.memberList.contains(toCompare);
  }
}

String NameView(String fullname) {
  return fullname.substring(0, fullname.indexOf(' ') + 2) + '.';
}

bool isFromMe(String user, String sender) {
  return user == sender;
}

bool isOnline(Chat chat) {
  return (me.onlineStatus.isOnline && chat.chatName == "") ? true : false;
}

bool isTagged(Chat chat){
  var rng = new Random();
  return rng.nextInt(100) % 2 == 0;

}