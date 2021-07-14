import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/models/folder.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';

import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/models/onlineStatus.dart';
import 'chatRow.dart';

class ChatsList extends StatelessWidget {
  Folder tabChats;

  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(),
        // tabChats.chatsID.map((chatID) {
        //   return new ChatRow(getChatByID(chatID));
        // }).toList(),
      ],
    );
  }

  ChatsList(Folder tabName) {
    this.tabChats = tabName;
  }
}

Chat getChatByID(int id) {
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
