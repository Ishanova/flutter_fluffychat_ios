class Chat {
  String image, name, message, date;
  bool isRead, isStudy, isMute, isFromMe, isPrivate;
  int unReadCount;


  Chat(String image, name, message, date, bool isRead, isMute, isFromMe, isPrivate, isStudy,
      int unReadCount) {
    this.image = image;
    this.date = date;
    this.message = message;
    this.name = name;
    this.isRead = isRead;
    this.isMute = isMute;
    this.isFromMe = isFromMe;
    this.isPrivate = isPrivate;
    this.unReadCount = unReadCount;
    this.isStudy = isStudy;
  }
}
