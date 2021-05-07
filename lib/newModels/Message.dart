import 'User.dart';

class Message {
  String senderID; //отправитель
  String date, time, messageText; //дата, время и текст сообщения
  List<String> readList; //список прочитавщих сообщение


  Message(String senderID,
      String date, time, messageText, readList) {
      this.senderID = senderID;
      this.date = date;
      this.time = time;
      this.messageText = messageText;
      this.readList = readList;
  }
}