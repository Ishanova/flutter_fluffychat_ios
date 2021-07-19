import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/models/message.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';


class MessageRow extends Scrollable{
 Message message;
 User user;

  @override
  Widget build(BuildContext context) {

    if (user.userID == message.senderID) {
        return
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Container(
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                   color: blue,
                  // padding: EdgeInsets.all(7),
                 ),
                 child: Text(
                     message.messageText,
                   style: TextStyle(
                     fontSize: 14,
                     color: black,
                   ),
                 ),
               )
             ]
           );

    } else {
        return Container(
          alignment: Alignment.centerLeft,
          color: grey,
          height: 30,
          child: Text(message.messageText),
        );
    }
  }

  MessageRow(Message message, User user) {
    this.message = message;
    this.user = user;
  }
}