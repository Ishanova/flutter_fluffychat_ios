import 'Chat.dart';
import 'OnlineStatus.dart';

class User {
  String userID, image; // имя и аватарка
  OnlineStatus onlineStatus;
  List<String> mutedChatsName; //список заглушенных чатов


  User(String userID, image,
      OnlineStatus onlineStatus,
      List<String> mutedChatsName) {
    this.userID = userID;
    this.image = image;
    this.onlineStatus = onlineStatus;
    this.mutedChatsName = mutedChatsName;
  }
}