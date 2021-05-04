import 'User.dart';
import 'Message.dart';

class Chat {
  List<User> memberList; //список участников чата
  List<Message> messageList; //список сообщений в чате
  bool isStudy; // учебное или неучебное

  Chat(List<User> memberList, List<Message> messageList, bool isStudy) {
    this.memberList = memberList;
    this.messageList = messageList;
    this.isStudy = isStudy;
  }
  List<User> getMemberList(){
    return memberList;
  }
  List<Message> getMessageList(){
    return messageList;
  }
}