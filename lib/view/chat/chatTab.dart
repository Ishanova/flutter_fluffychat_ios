import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/helper/indicator.dart';
import 'package:flutter/rendering.dart';

class ChatTab extends StatelessWidget{
  String tabName;
  bool isUnread, isTagged;
  int counter;

  ChatTab (this.tabName, this.isUnread, this.counter, this.isTagged);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {print("DOUBLE TAB");},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(tabName,
                style: TextStyle(fontSize: 16, fontWeight:  FontWeight.w500)),
            isUnread ? Indicator(1, counter) : Text(""),
            //isUnread ? Indicator(0) : Text(""),
          ],
        ),
      ),
    );
  }

}
