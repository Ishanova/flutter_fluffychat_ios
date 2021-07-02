import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatTab.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/models/folder.dart';

class TabBar extends StatelessWidget {

  final listFolders = toNameList(me.folders);

  final folderSettingsBtn = Container(
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: Icon(
      CupertinoIcons.slider_horizontal_3,
      size: 22,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final List<Container> folders = listFolders.map((element) {
      return Container(
          child:
              ChatTab(element, countUnread(element)),
      );
    }).toList();
    folders.add(folderSettingsBtn);
    return Container(
      color: white,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: folders,

      ),
    );
    /*
          ),
      )

                  bottom:
                  TabBar(
                    isScrollable: true,
                    indicatorColor: contrastColor,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: listFolders.map((element) {
                      return SizedBox(
                        height: 35,
                          child: new Tab(
                        child: chatTab(element["name"], element["status"], countUnread(), tagged()),
                      ));
                    }).toList(),
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: TabBarView(
              children: [
                ChatsList("private"),
                ChatsList("unread"),
                ChatsList("study"),
                // for folder in folders: folder["name"] //from backend
              ],
            ),
          ),
    ;*/
  }
}

List<String> toNameList(Set<Folder> toList){
  List<String> nameList = [];
  for(Folder i in toList){
    nameList.add(i.getFolderName());
  }
  return nameList;
}

int countUnread(String folderName) {
  int counter = 0;
  if(folderName == "Все"){
    return 0;
  }
  for (Folder i in me.folders) {
    if (i.folderName == folderName) {
      for (Chat j in chats) {
        if (i.chatsID.contains(j.chatID)) {
          if (j.unreadCount(me.userID) != 0) {
            counter++;
          }
        }
      }
      break;
    }
  }
  return counter;
}
