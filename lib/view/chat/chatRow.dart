import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fluffychat_ios/helper/avatarka.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/view/message/messagesView.dart';
import 'package:flutter_fluffychat_ios/helper//indicator.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/icons_chat.dart';

import 'package:flutter_fluffychat_ios/models/chat.dart';

class ChatRow extends StatelessWidget {
  Chat toRow;
  User user = me;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => MessagesView(user, toRow))
        );
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
                          width: 250,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: black
                                  ),),
                                ),
                              ),
                              Visibility(
                                visible: user.isMute(toRow.chatName),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                                  child: Icon(
                                    Icons_Chat.mute_out_16,
                                    size: 16,
                                    color: grey,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      Row(children: [
                        Container(
                          child:
                          Text(
                            (isFromMe(user.userID, toRow.messageList.last.senderID)
                                ? "Вы: "
                                : NameView(toRow.messageList.last.senderID) + ": "),
                            style: TextStyle (
                                fontFamily: "SFProText",
                                color: grey
                            ),
                          ),
                        ),
                        Flexible(child: Container(
                          child: Text(toRow.messageList.last.messageText,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontFamily: "SFProText",
                                color: black
                            ),
                          ),
                        ),),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(" · ${toRow.messageList.last.time}",
                            style: TextStyle(
                              fontFamily: "SFProText",
                              color: grey,
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                flex: 5,
              ),
              Expanded(
                child: Visibility(
                  visible: !toRow.messageList.last.isRead(user.userID),
                  child: Align(
                    child: Indicator(2, toRow.unreadCount(user.userID))
                  ),
                ),
                flex: 1,
              )
            ],
          )
      ),
  );
  }

  ChatRow(Chat toRow) {
    this.toRow = toRow;
  }
  bool isMute(User toCompare){
    return toRow.memberList.contains(toCompare);
  }
}

String NameView(String fullname){
  return fullname.substring(0, fullname.indexOf(' ') + 2) + '.';
}

bool isFromMe(String user, String sender){
  return user == sender;
}

bool isOnline(Chat chat){
  return (me.onlineStatus.isOnline && chat.chatName == "") ? true : false;
}