import 'User.dart';

class Message {
  User sender; //отправитель
  String date, time, messageText; //дата, время и текст сообщения
  List<User> readList; //список прочитавщих сообщение


  Message(User sender,
      String date, time, messageText,
      List<User> readList) {
      this.sender = sender;
      this.date = date;
      this.time = time;
      this.messageText = messageText;
      this.readList = readList;
  }
}