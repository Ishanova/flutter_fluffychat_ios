import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/models/message.dart';
import 'package:flutter_fluffychat_ios/models/onlineStatus.dart';
import 'package:flutter_fluffychat_ios/view/messagesView.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';

class ChatRow extends ListTile {
  Chat toRow;
  String userID;

  Color contrastColor = const Color.fromARGB(255, 0, 145, 255);
  Color backgroundColor = const Color.fromARGB(125, 67, 66, 68);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MessagesView("Иван Петров"))
        );
      },
      child: Container(
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                      width: 63,
                      height: 63,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/ac.jpg", width: 60, height: 60,),
                    ),
                  ),


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
                              Text("Иван Петров", style: new TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                              Visibility(
                                visible: this.isMute(User("Иван Петров", "image", OnlineStatus(true, "14 may 2021", "00:09"),
                                    {}),) ? true : false,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                                  child: Icon(
                                    Icons.volume_off,
                                    size: 18,
                                    color: backgroundColor,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      /*Row(children: [
                        Container(
                          child:
                          Text(
                            (isFromMe ? "Вы: " : (isPrivate ? "" : (NameView(name) + ": "))),
                            style: TextStyle (
                                color: backgroundColor
                            ),
                          ),
                        ),
                        Container(
                          //width: 100,
                          child: Text(message,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(date,
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
                  visible: isRead ? false : true,
                  child: Align(
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                        child: Text("$unReadCount",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.white
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: isMute ? backgroundColor : contrastColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                        ),
                    ),
                  ),
                ),
                flex: 1,
              )*/
            ],
          )
      ),
  ])));
  }

  ChatRow(Chat toRow, String userID) {
    this.toRow = toRow;
    this.userID = userID;
  }
  bool isMute(User toCompare){
    return toRow.memberList.contains(toCompare);
  }
}

String NameView(String fullname){
  return fullname.substring(0, fullname.indexOf(' ') + 2) + '.';
}