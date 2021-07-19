class Folder {
  int folderID; // id папки
  String folderName; // имя папки
  Set<String> chatsID; // список ID чатов

  Folder(String folderName, Set<String> chatsID, int folderID) {
    this.folderName = folderName;
    this.chatsID = chatsID;
    this.folderID = folderID;
  }
  Folder.defArgs(){
    this.folderName = folderName;
    this.chatsID = chatsID;
    this.folderID = folderID;
  }
  String getFolderName(){
    return folderName;
  }
  int getFolderID(){
    return folderID;
  }
  Set<String> getChatsID(){
    return chatsID;
  }
}
