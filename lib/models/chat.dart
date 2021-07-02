import 'user.dart';
import 'message.dart';

class Chat {
  String chatName; //название чата
  Set<User> memberList; //список участников чата
  List<Message> messageList; //список сообщений в чате
  String chatID;

  Chat(String chatName, Set<User> memberList, List<Message> messageList, String chatID) {
    this.chatName = chatName;
    this.memberList = memberList;
    this.messageList = messageList;
    this.chatID = chatID;
  }
  Set<User> getMemberList(){
    return memberList;
  }
  List<Message> getMessageList(){
    return messageList;
  }
  String getChatName(String userID){
    if(chatName == ""){
      return this.companion(userID);
    }
    return chatName;
  }
  String companion(String userID){
    for(int i = 0; i < memberList.length; i++){
      if(memberList.toList()[i].userID == userID){
        continue;
      }
      return memberList.toList()[i].userID;
    }
    return "default name";
  }

  User companionObj(String userID){
    for(int i = 0; i < memberList.length; i++){
      if(memberList.toList()[i].userID == userID){
        continue;
      }
      return memberList.toList()[i];
    }
    return User.defArgs();
  }

  int unreadCount (String userID) {
    int count = 0;
    for (int i=messageList.length-1; i!=0; i--) {
      if (messageList[i].readList.contains(userID)) {break;}
      count++;
    }
   return count;
  }
}

