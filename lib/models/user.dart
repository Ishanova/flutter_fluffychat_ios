import 'folder.dart';
import 'onlineStatus.dart';

class User {
  String userID, image; // имя и аватарка
  OnlineStatus onlineStatus;
  Set<String> mutedChatsName; //список заглушенных чатов
  Set<Folder> folders;

  User(String userID, image,
      OnlineStatus onlineStatus,
      Set<String> mutedChatsName,
      Set<Folder> folders) {
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
