import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatTab.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/models/folder.dart';

class TabBar extends StatefulWidget {
  int activeTabID;
  double activeTabWidth;
  double activeTabOffset;

  TabBar({Key key, this.activeTabID, this.activeTabWidth = 0.0, this.activeTabOffset = 0.0}) : super(key: key);

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  final folderSettingsBtn = Container(
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: Icon(
      CupertinoIcons.slider_horizontal_3,
      size: 22,
    ),
  );

  _setActive(int folderID, double folderWidth, double folderOffset) {
    setState(() {
      widget.activeTabID = folderID;
      widget.activeTabWidth = folderWidth;
      widget.activeTabOffset = folderOffset;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Container> folders = me.folders.toList().map((element) {
      return Container(
        // margin: const EdgeInsets.only(right: 15.0),
        child: ChatTab(
            callback: _setActive,
            activeTabID: widget.activeTabID,
            folderID: element.folderID,
            tabName: element.folderName,
           // counter: countUnread(element.getFolderID())),
      ));
    }).toList();
    folders.add(folderSettingsBtn);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: folders,
          ),
        ),
        Container(
          height: 2,
          color: blue,
          // alignment: CrossAxisAlignment.start,
          margin: EdgeInsets.only(top: 8.0, left: widget.activeTabOffset != null ? widget.activeTabOffset : 0),
          width: widget.activeTabWidth,
        )
      ],
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
//
// List<String> toNameList(Set<Folder> toList) {
//   List<String> nameList = [];
//   for (Folder i in toList) {
//     nameList.add(i.getFolderName());
//   }
//   return nameList;
// }

// List<int> toIDList(Set<Folder> toList) {
//   List<int> IDList = [];
//   for (Folder i in toList) {
//     IDList.add(i.getFolderID());
//   }
//   return IDList;
// }


// decoration: BoxDecoration(
// // borderRadius: BorderRadius.circular(10),
// border: Border(
// bottom: BorderSide(
// width: 2,
// color: widget.activeTab == widget.folderID ? blue : white),
// ),
// ),


