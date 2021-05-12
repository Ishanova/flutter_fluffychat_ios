import 'user.dart';
import 'message.dart';

class Chat {
  String chatName; //название чата
  Set<User> memberList; //список участников чата
  List<Message> messageList; //список сообщений в чате
  bool isStudy; // учебное или неучебное

  Chat(String chatName, Set<User> memberList, List<Message> messageList, bool isStudy) {
    this.chatName = chatName;
    this.memberList = memberList;
    this.messageList = messageList;
    this.isStudy = isStudy;
  }
  /*List<User> getMemberList(){
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
    for(int i = 0; i < memberList.length(); i++){
      if(memberList[i].userID == userID){
        continue;
      }
      return memberList[i].userID;
    }
    return "default name";
  }*/
}

