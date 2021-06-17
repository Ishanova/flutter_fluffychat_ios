import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_fluffychat_ios/helper/indicator.dart';
import 'package:flutter/rendering.dart';

class chatTab extends StatelessWidget{
  String tabName;
  bool isUnread, isTagged;
  int counter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(tabName,
            style: TextStyle(fontSize: 20, fontWeight:  FontWeight.w500)),
        isUnread ? Indicator(1, counter) : Text(""),
        isUnread ? Indicator(0) : Text(""),
      ],
    );
  }
   chatTab (String tabName, bool isUnread, int counter, bool isTagged) {
     this.tabName = tabName;
     this.isUnread = isUnread;
     this.isTagged = isTagged;
     this.counter = counter;
   }
}
