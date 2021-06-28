import 'chat.dart';
import 'onlineStatus.dart';

class User {
  String userID, image; // имя и аватарка
  OnlineStatus onlineStatus;
  Set<String> mutedChatsName; //список заглушенных чатов
  Map<String, List<String>> folders;

  User(String userID, image,
      OnlineStatus onlineStatus,
      Set<String> mutedChatsName,
      Map<String, List<String>> folders) {
    this.userID = userID;
    this.image = image;
    this.onlineStatus = onlineStatus;
    this.mutedChatsName = mutedChatsName;
    this.folders = folders;
  }
  User.defArgs(){
    this.userID = userID;
    this.image = image;
    this.onlineStatus = onlineStatus;
    this.mutedChatsName = mutedChatsName;
    this.folders = folders;
  }

  bool isMute(String toCompare){
    return mutedChatsName.contains(toCompare);
  }
}
