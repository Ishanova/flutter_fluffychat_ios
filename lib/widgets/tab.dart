import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/widgets/indicator.dart';
import 'package:flutter_fluffychat_ios/widgets/small_indicator.dart';
import 'package:flutter/rendering.dart';

class TabModel extends StatelessWidget{
  String tabName;
  bool isUnread;
  bool isTagged;
  int counter;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(tabName,
            style: TextStyle(fontSize: 20, fontWeight:  FontWeight.w500)),
        isUnread ? Indicator(counter) : Text(""),
        isUnread ? SmallIndicator() : Text(""),
      ],
    );
  }
   TabModel (String tabName, bool isUnread, int counter, bool isTagged) {
     this.tabName = tabName;
     this.isUnread = isUnread;
     this.isTagged = isTagged;
     this.counter = counter;
   }
}
