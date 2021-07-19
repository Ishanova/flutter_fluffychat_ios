import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/helper/indicator.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatsView.dart';

class ChatTab extends StatefulWidget {
  int folderID;
  String tabName;
  int counter;
  int activeTabID;
  Function(int, double, double) callback;

  ChatTab(
      {Key key,
      this.folderID,
      this.tabName,
      this.counter,
      this.activeTabID,
      this.callback})
      : super(key: key);

  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  GlobalKey _key = GlobalKey();
  double _x, _y;

  _getOffset(BuildContext context) {
    RenderBox box = context.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);
    setState(() {
      _x = position.dx;
      _y = position.dy;
    });
  }


  @override
  Widget build(BuildContext context) {
    // print(context.size);
    return GestureDetector(
      onTap: () {
        _getOffset(context);
        widget.callback(widget.folderID, context.size.width, _x);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(widget.tabName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            (widget.counter != 0) ? Indicator(1, widget.counter) : Text(""),
          ],
        ),
      ),
    );
  }
}
