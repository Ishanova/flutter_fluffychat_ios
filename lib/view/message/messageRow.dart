import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/models/message.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';


class MessageRow extends Scrollable{
 Message message;
 User user;

  Color contrastColor = const Color.fromARGB(255, 0, 145, 255);
  Color backgroundColor = const Color.fromARGB(25, 67, 66, 68);
 Color textColor = const Color.fromARGB(255, 0, 0, 0);

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
                   color: contrastColor,
                  // padding: EdgeInsets.all(7),
                 ),
                 width: 300,
                 height: 50,
                 child: Text(
                     message.messageText,
                   style: TextStyle(
                     fontSize: 14,
                     color: textColor,
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
          child: Text(message.messageText),
        );
    }
  }

  MessageRow(Message message, User user) {
    this.message = message;
    this.user = user;
  }
}