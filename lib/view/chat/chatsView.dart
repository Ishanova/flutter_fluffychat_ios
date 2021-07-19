import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_fluffychat_ios/models/folder.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';

import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/models/onlineStatus.dart';
import 'chatRow.dart';

class ChatsList extends StatelessWidget {
  Folder tabChats;
  List<ScrollController> _scrollControllers = <ScrollController>[];
  // ScrollController _scrollController;

  ChatsList(this.tabChats, [this._scrollControllers]){
    // _scrollController = _scrollControllers[tabChats.folderID];
  }

  Widget build(BuildContext context) {
    int totalCount = tabChats.chatsID.length;
    return CustomScrollView(
      // controller: _scrollController,
        semanticChildCount: totalCount, //общее количество элементов
        slivers: [
          SliverSafeArea(
              top: false,
              /*minimum: const EdgeInsets.only(
                  top: 8),*/
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((
                      context, index) =>
                  index < totalCount //чтобы не выпадало за количество элементов (на всякий случай)
                      ? ChatRow(getChatByID(tabChats.chatsID.elementAt(index)))
                      : null
                  )
              )
          ),
        ]
    );
  }
}

Chat getChatByID(String id) {
  for (Chat i in chats) {
    if (i.chatID == id) {
      return i;
    }
  }
}
/*//final allChats;
    final unreadChats = chats.where((element) => element.messageList.last.readList.contains(user.userID) == false);
    //final privateChats = chats.where((element) => element.isStudy == false);
    final studyChats = chats.where((element) => element.isStudy == true);

    if (tabName == "Все") {
      return ListView(
          children: unreadChats.map((chat)  {
            return new ChatRow(chat, user);
          }).toList()
      );
    } else if (tabName == "Непрочитанные") {
      return ListView(
          children: unreadChats.map((chat)  {
            return new ChatRow(chat, user);
          }).toList()
      );
    } else if (tabName == "Учёба") {
      return ListView(
          children: studyChats.map((chat)  {
            return new ChatRow(chat, user);
          }).toList()
      );
    }*/
