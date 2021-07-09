import 'user.dart';

class Message {
  int senderID; //отправитель
  String date, time, messageText; //дата, время и текст сообщения
  Set<String> readList; //список прочитавщих сообщение

  Message(
      int senderID, String date, time, messageText, Set<String> readList) {
    this.senderID = senderID;
    this.date = date;
    this.time = time;
    this.messageText = messageText;
    this.readList = readList;
  }

  bool isRead(String toCompare) {
    return readList.contains(toCompare);
  }
}
