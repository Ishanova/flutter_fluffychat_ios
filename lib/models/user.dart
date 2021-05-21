import 'chat.dart';
import 'onlineStatus.dart';

class User {
  String userID, image; // имя и аватарка
  OnlineStatus onlineStatus;
  Set<String> mutedChatsName; //список заглушенных чатов


  User(String userID, image,
      OnlineStatus onlineStatus,
      Set<String> mutedChatsName) {
    this.userID = userID;
    this.image = image;
    this.onlineStatus = onlineStatus;
    this.mutedChatsName = mutedChatsName;
  }
  User.defArgs(){
    this.userID = userID;
    this.image = image;
    this.onlineStatus = onlineStatus;
    this.mutedChatsName = mutedChatsName;
  }

  bool isMute(String toCompare){
    return mutedChatsName.contains(toCompare);
  }
}
