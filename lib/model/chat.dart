class Chat {
  String image, name, message, date;
  bool isRead, isStudy;
  int unReadCount;


  Chat(String image, name, message, date, bool isRead, isStudy,
      int unReadCount) {
    this.image = image;
    this.date = date;
    this.message = message;
    this.name = name;
    this.isRead = isRead;
    this.unReadCount = unReadCount;
    this.isStudy = isStudy;
  }
}
