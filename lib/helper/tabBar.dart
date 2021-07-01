import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatTab.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';

class TabBar extends StatelessWidget {

  final listFolders = ['Все', 'Непрочитанные', 'Учёба', 'Что-то'];

  final addBtn = Container(
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: Icon(
      CupertinoIcons.slider_horizontal_3,
      size: 22,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final List<Container> folders = listFolders.map((element) {
      return Container(child: ChatTab(element, true, 6, false));
    }).toList();
    folders.add(addBtn);
    return Container(
      color: white,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: folders,
          //(this.tabName, this.isUnread, this.counter, this.isTagged)
          // ChatTab("Все", true, 6, false),
          // ChatTab("Непрочитанные", true, 2, true),
          // ChatTab("Учёба", false, 2, true),
          /*Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                  CupertinoIcons.slider_horizontal_3,
                size: 22,
              ),
          ),*/
        // ],
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