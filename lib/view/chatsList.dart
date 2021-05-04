import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/model/chat.dart';
//import 'package:flutter_fluffychat_ios/newModels/Chat.dart';
import 'chatRow.dart';

List chats = [
  Chat("image", "Alexey Akulovich", "Lorem ipsum dolor sit amet", "6:34", false, true, true, true, true, 112),
  Chat("image", "Ilya Scherbak", "Lorem ipsum dolor sit amet", "6:34", true, false, true, false, false, 0),
  Chat("image", "Vyacheslav Flokk", "Lorem ipsum dolor sit amet", "6:34", false, false, false, true, false, 5),
  Chat("image", "Vyacheslav Flokk", "Lorem ipsum dolor sit amet", "6:34", false, true, false, false, false, 5)
];

class ChatsList extends StatelessWidget {
  String tabName;

  Widget build(BuildContext context) {
    final unreadChats = chats.where((element) => element.isRead == false);
    final privateChats = chats;
    final studyChats = chats.where((element) => element.isStudy == true);

    if (tabName == "private") {
      return ListView(
          children: privateChats.map((chat)  {
            return new ChatRow(chat.name, chat.message, chat.date, chat.unReadCount, chat.isRead, chat.isMute, chat.isFromMe, chat.isPrivate);
          }).toList()
      );
    } else if (tabName == "unread") {
      return ListView(
          children: unreadChats.map((chat)  {
            return new ChatRow(chat.name, chat.message, chat.date, chat.unReadCount, chat.isRead, chat.isMute, chat.isFromMe, chat.isPrivate);
          }).toList()
      );
    } else if (tabName == "study") {
      return ListView(
          children: studyChats.map((chat)  {
            return new ChatRow(chat.name, chat.message, chat.date, chat.unReadCount, chat.isRead, chat.isMute, chat.isFromMe, chat.isPrivate);
          }).toList()
      );
    }
  }

  ChatsList(String tabName) {
    this.tabName = tabName;
  }
}