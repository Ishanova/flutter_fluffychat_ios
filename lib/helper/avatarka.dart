import 'package:flutter/cupertino.dart';

import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/helper/is_nav_bar.dart';
import 'package:flutter_fluffychat_ios/helper/tab_controller_remake.dart';
import 'package:flutter_fluffychat_ios/helper/tabs_remake.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/models/folder.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/theme/theme.dart';
import 'package:flutter_fluffychat_ios/icons_chat.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatRow.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatsView.dart';

class Avatarka extends StatefulWidget {
  final image;
  final isOnline;

  Avatarka(this.image, this.isOnline);

  @override
  _AvatarkaState createState() => _AvatarkaState();
}

class _AvatarkaState extends State<Avatarka> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(widget.image, width: 60, height: 60,),
          ),
        ),

        Visibility(
            visible: widget.isOnline ? true : false,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 18, horizontal: 9),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
            )
        )
      ],
    );
  }
}