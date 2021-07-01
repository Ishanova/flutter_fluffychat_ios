import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/helper/indicator.dart';
import 'package:flutter/rendering.dart';

class ChatTab extends StatelessWidget{
  String tabName;
  bool isUnread, isTagged/*, active = false*/;
  int counter;

  ChatTab (this.tabName, this.isUnread, this.counter, this.isTagged);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // active = true;
        print(tabName);
        },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        /*decoration: !active ? BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.blue[300]),
            ),
        ) : null,*/
        child: Row(
          children: [
            Text(tabName,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight:  FontWeight.w500
                )),
            isUnread ? Indicator(1, counter) : Text(""),
            //isUnread ? Indicator(0) : Text(""),
          ],
        ),
      ),
    );
  }

}
