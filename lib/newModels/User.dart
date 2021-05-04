import 'Chat.dart';
import 'OnlineStatus.dart';

class User {
  String userID, image; // имя и аватарка
  OnlineStatus onlineStatus;
  List<Chat> mutedChats; //список заглушенных чатов


  User(String userID, image,
      OnlineStatus onlineStatus,
      List<Chat> mutedChats) {
    this.userID = userID;
    this.image = image;
    this.onlineStatus = onlineStatus;
    this.mutedChats = mutedChats;
  }
}