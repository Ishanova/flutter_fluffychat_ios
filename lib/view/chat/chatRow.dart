import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/view/message/messagesView.dart';
import 'package:flutter_fluffychat_ios/helper//indicator.dart';
import 'package:flutter_fluffychat_ios/models/message.dart';
import 'package:flutter_fluffychat_ios/models/onlineStatus.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';

class ChatRow extends ScrollableState{
  Chat toRow;
  User user;

  Color contrastColor = const Color.fromARGB(255, 0, 145, 255);
  Color backgroundColor = const Color.fromARGB(125, 67, 66, 68);
  Color onlineColor = const Color.fromARGB(255, 34, 178, 23);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => MessagesView(user, toRow))///!!!!
        );
      },
      child: Container(
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/ac.jpg", width: 60, height: 60,),
                    ),
                  ),

                  Visibility(
                      visible:   (user.onlineStatus.isOnline && toRow.chatName == "") ? true : false,
                      child: Container(
                    margin: EdgeInsets.symmetric(vertical: 18, horizontal: 9),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: onlineColor,
                      shape: BoxShape.circle,
                    ),
                  )
                  )
                ],
              ),

              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 250,
                          child: Row(
                            children: [
                              Text(toRow.getChatName(user.userID), style: new TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                              Visibility(
                                visible: user.isMute(toRow.chatName),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                                  child: Icon(
                                    CupertinoIcons.volume_off,
                                    size: 17,
                                    color: backgroundColor,
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
                            (isFromMe(user.userID, toRow.messageList.last.senderID) ? "Вы: " : (!toRow.isStudy ? "" : (NameView(toRow.messageList.last.senderID) + ": "))),
                            style: TextStyle (
                                color: backgroundColor
                            ),
                          ),
                        ),
                        Flexible(child: Container(
                          child: Text(toRow.messageList.last.messageText,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(" · ${toRow.messageList.last.time}",
                            style: TextStyle(
                              color: backgroundColor,
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

  ChatRow(Chat toRow, User user) {
    this.toRow = toRow;
    this.user = user;
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