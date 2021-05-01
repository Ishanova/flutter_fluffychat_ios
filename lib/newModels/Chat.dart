import 'User.dart';
import 'Message.dart';

class Chat {
  List<User> memberList;
  List<Message> messageList;
  bool isStudy;

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