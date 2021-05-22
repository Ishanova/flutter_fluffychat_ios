import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/models/user.dart';
import 'package:flutter_fluffychat_ios/models/message.dart';
import 'package:flutter_fluffychat_ios/models/onlineStatus.dart';
import 'chatRow.dart';

List chats = [
  Chat("Важная беседа",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}),
        User("Lev Franc", "image", OnlineStatus(true, "10 марта 2021", "10:19"), {"Важная беседа"}),
        User("Polya Franc", "image", OnlineStatus(false, "10 марта 2021", "10:19"), {"Беседа"})
      },
      [
        Message("Иван Петров", "14 мая 2021", "00:09", "Hello", {"Иван Петров", "Polya Franc"}),
        Message("Polya Franc", "14 мая 2021", "00:19", "Hello!", {"Иван Петров", "Polya Franc"}),
        Message("Иван Петров", "14 мая 2021", "00:29", "Где Лев?", {"Иван Петров", "Polya Franc"})
      ],
      true),

  Chat("tanya pyshka",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}),
        User("Polya Franc", "image", OnlineStatus(false, "10 марта 2021", "10:19"), {"Беседа"}),
        User("Таня Пушкина", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {}),
      },
      [
        Message("Иван Петров", "14 мая 2021", "00:09", "Hello", {"Иван Петров", "Polya Franc"}),
        Message("Polya Franc", "14 мая 2021", "00:19", "Hello!", {"Polya Franc"}),
      ],
      true),

  Chat("",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}),
        User("Lev Franc", "image", OnlineStatus(true, "10 марта 2021", "10:19"), {"Важная беседа"}),
      },
      [
        Message("Иван Петров", "14 мая 2021", "00:09", "мяу", {"Иван Петров", "Lev Franc"}),
        Message("Lev Franc", "14 мая 2021", "00:19", "-_-", {"Иван Петров", "Lev Franc"}),
        Message("Иван Петров", "14 мая 2021", "00:29", "а что ты хотел от интеллектуала?О.о", {"Иван Петров", "Lev Franc"})
      ],
      false),
  Chat("",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}),
        User("Фёдор Барбарин", "image", OnlineStatus(true, "12 мая 2021", "10:19"), {}),
      },
      [
        Message("Иван Петров", "15 мая 2021", "00:09", "Ты где?", {"Иван Петров", "Фёдор Барбарин"}),
        Message("Фёдор Барбарин", "15 мая 2021", "00:19", "Жди", {"Иван Петров", "Фёдор Барбарин"}),
        Message("Фёдор Барбарин", "15 мая 2021", "00:49", "Я скоро буду", {"Фёдор Барбарин"})
      ],
      false),
  Chat("Все мы",
      {
        User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"}),
        User("Фёдор Барбарин", "image", OnlineStatus(true, "12 мая 2021", "10:19"), {}),
        User("Polya Franc", "image", OnlineStatus(false, "10 марта 2021", "10:19"), {"Беседа"}),
        User("Таня Пушкина", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {}),
        User("Lev Franc", "image", OnlineStatus(true, "10 марта 2021", "10:19"), {"Важная беседа"}),
      },
      [
        Message("Фёдор Барбарин", "15 мая 2021", "00:19", "Погнали гулять", {"Иван Петров", "Фёдор Барбарин", "Polya Franc"}),
        Message("Polya Franc", "15 мая 2021", "00:49", "Я скоро буду", {"Иван Петров", "Фёдор Барбарин", "Polya Franc"}),
        Message("Иван Петров", "15 мая 2021", "13:45", "Я на месте", { "Фёдор Барбарин", "Иван Петров"}),
      ],
      false),
];

class ChatsList extends StatelessWidget {
  String tabName;
  User user = User("Иван Петров", "image", OnlineStatus(true, "14 мая 2021", "00:09"), {"Все мы"});

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
