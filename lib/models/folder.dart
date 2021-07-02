class Folder {
  String folderName; // имя папки
  Set<String> chatsID; // список ID чатов

  Folder(String folderName, Set<String> chatsID) {
    this.folderName = folderName;
    this.chatsID = chatsID;
  }
  Folder.defArgs(){
    this.folderName = folderName;
    this.chatsID = chatsID;
  }
  String getFolderName(){
    return folderName;
  }
  Set<String> getChatsID(){
    return chatsID;
  }
}
