import 'user.dart';
import 'message.dart';

class Chat {
  String chatName; //название чата
  List<int> memberList; //список id участников чата
  List<Message> messageList; //список сообщений в чате
  bool isStudy; // учебное или неучебное

  Chat(String chatName, List<int> memberList, List<Message> messageList,
      bool isStudy) {
    this.chatName = chatName;
    this.memberList = memberList;
    this.messageList = messageList;
    this.isStudy = isStudy;
  }

  List<int> getMemberList() {
    return memberList;
  }

  List<Message> getMessageList() {
    return messageList;
  }

/*  User companionObj(int userID) {
    for (int i = 0; i < memberList.length; i++) {
      if (memberList[i] == userID) {
        continue;
      }
      return memberList[i];
    }
    return User.defArgs();
  }*/

  int unreadCount(String userID) {
    int count = 0;
    for (int i = messageList.length - 1; i != 0; i--) {
      if (messageList[i].readList.contains(userID)) {
        break;
      }
      count++;
    }
    return count;
  }
}
