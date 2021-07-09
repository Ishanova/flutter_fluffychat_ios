import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/models/onlineStatus.dart';
import 'chatRow.dart';

class ChatsList extends StatelessWidget {
  String tabName;
  User user = User(208435, "Иван Петров", "image",
      OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"});

  Widget build(BuildContext context) {
    final unreadChats = chats.where((element) =>
        element.messageList.last.readList.contains(user.name) == false);
    final privateChats = chats.where((element) => element.isStudy == false);
    final studyChats = chats.where((element) => element.isStudy == true);

    if (tabName == "private") {
      return ListView(
          children: privateChats.map((chat) {
        return new ChatRow(chat, user);
      }).toList());
    } else if (tabName == "unread") {
      return ListView(
          children: unreadChats.map((chat) {
        return new ChatRow(chat, user);
      }).toList());
    } else if (tabName == "study") {
      return ListView(
          children: studyChats.map((chat) {
        return new ChatRow(chat, user);
      }).toList());
    }
  }

  ChatsList(String tabName) {
    this.tabName = tabName;
  }
}
