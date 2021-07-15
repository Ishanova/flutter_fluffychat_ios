import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/view/message/messagesView.dart';
import 'package:flutter_fluffychat_ios/helper//indicator.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';

import 'package:flutter_fluffychat_ios/models/chat.dart';

class ChatRow extends StatelessWidget {
  Chat toRow;
  User user = me;


  @override
  Widget build(BuildContext context) {

    print("____1____");
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => MessagesView(user, toRow))///!!!!
        );
      },
      child: Container(
         // color: Color(0xFF00FF00),
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
                      color: green,
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
                                color: grey
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