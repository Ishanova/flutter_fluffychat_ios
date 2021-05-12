import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/view/messageRow.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';

class MessagesView extends StatelessWidget {
  String name;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(name),
                      Text("был в сети вчера в 18:23",
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 12,
                        ),)
                    ],
                  ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/ac.jpg", width: 40, height: 40,),
                  ),
                 )
                ]
            )

      ),
       child: (
          ListView(
              children: [
                MessageRow("Lorem ipsum dolor sit Amet.", "6:45", true)
              ],
          )
      ),
    );
  }

  MessagesView(String name) {
    this.name = name;
  }
}