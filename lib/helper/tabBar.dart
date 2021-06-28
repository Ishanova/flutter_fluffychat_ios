import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatTab.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';

class TabBar extends StatelessWidget {
  final listFolders = [
    {"name": "Личные", "status": true}, {"name": "Непрочитанные", "status": false},
    {"name": "Учёба", "status": true}
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          chatTab("    vze    ", false, 2, false),
          chatTab("    gav    ", false, 2, true)
        ],
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