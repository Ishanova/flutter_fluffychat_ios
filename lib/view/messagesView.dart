import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/view/messageRow.dart';

class MessagesView extends StatelessWidget {
  String name;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(name),
      ),
     /* body: Center(
        child: ListView(
          children: [
            MessageRow("Lorem ipsum dolor sit Amet.", "6:45", true)
          ],
        ),
      ), */
    );
  }

  MessagesView(String name) {
    this.name = name;
  }
}