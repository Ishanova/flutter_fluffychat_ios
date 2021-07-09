import 'onlineStatus.dart';

class User {
  int userId;
  String name, image; // имя и аватарка
  OnlineStatus onlineStatus;
  Set<String> mutedChatsName; //список заглушенных чатов

  User(int userId, String name, image, OnlineStatus onlineStatus,
      Set<String> mutedChatsName) {
    this.userId = userId;
    this.name = name;
    this.image = image;
    this.onlineStatus = onlineStatus;
    this.mutedChatsName = mutedChatsName;
  }
  User.getName(int id){
    if(id == userId)
      this.name = name;
  }

  User.defArgs() {
    this.name = name;
    this.image = image;
    this.onlineStatus = onlineStatus;
    this.mutedChatsName = mutedChatsName;
  }

/*  User getUser(int id){
    if(id == userId)
      return()
}*/
  bool isMute(String toCompare) {
    return mutedChatsName.contains(toCompare);
  }


}
