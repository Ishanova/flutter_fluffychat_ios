import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/models/onlineStatus.dart';
import 'chatRow.dart';

class ChatsList extends StatelessWidget {
  String tabName;
  User user = User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}, {"study": ["1111", "2222"], "private": ["3333", "4444"], "unread": ["5555"]});

  Widget build(BuildContext context) {
    final unreadChats = chats.where((element) => element.messageList.last.readList.contains(user.userID) == false);
    final privateChats = chats.where((element) => element.isStudy == false);
    final studyChats = chats.where((element) => element.isStudy == true);

    if (tabName == "private") {
      return ListView(
          children: privateChats.map((chat)  {
            return new ChatRow(chat, user);
          }).toList()
      );
    } else if (tabName == "unread") {
      return ListView(
          children: unreadChats.map((chat)  {
            return new ChatRow(chat, user);
          }).toList()
      );
    } else if (tabName == "study") {
      return ListView(
          children: studyChats.map((chat)  {
            return new ChatRow(chat, user);
          }).toList()
      );
    }
  }

  ChatsList(String tabName) {
    this.tabName = tabName;
  }
}
