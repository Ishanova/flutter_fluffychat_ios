class Message {
  String message, date;
  bool isFromMe;

  Message(String message, date, bool isFromMe) {
    this.message = message;
    this.date = date;
    this.isFromMe = isFromMe;
  }
}