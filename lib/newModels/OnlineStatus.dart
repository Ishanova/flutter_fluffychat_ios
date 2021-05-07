class OnlineStatus {
  bool isOnline;
  String lastDate;
  String lastTime; //дата последнего посещения, время последнего посещения

  OnlineStatus(bool isOnline,
      String lastDate, lastTime) {
    this.isOnline = isOnline;
    this.lastDate = lastDate;
    this.lastTime = lastTime;
  }
}