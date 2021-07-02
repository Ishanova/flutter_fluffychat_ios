import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/helper/indicator.dart';
import 'package:flutter/rendering.dart';

class ChatTab extends StatelessWidget {
  String tabName;
  int counter;

  ChatTab(this.tabName, this.counter);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(tabName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          (counter != 0) ? Indicator(1, counter) : Text(""),
        ],
      ),
      decoration: BoxDecoration(
       // borderRadius: BorderRadius.circular(10),
        border: Border(
          bottom: BorderSide(width: 2, color: blue),
        ),
      ),
    );
  }
}
