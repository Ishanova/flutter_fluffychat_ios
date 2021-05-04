import 'User.dart';
import 'Chat.dart';

class Message {
  User sender; //отправитель
  Chat chat; //ссылка на чат
  String date, time, messageText; //дата, время и текст сообщения
  List<User> readList; //список прочитавщих сообщение


  Message(User sender,
      Chat chat,
      String date, time, messageText,
      List<User> readList) {
      this.sender = sender;
      this.chat = chat;
      this.date = date;
      this.time = time;
      this.messageText = messageText;
      this.readList = readList;
  }
}