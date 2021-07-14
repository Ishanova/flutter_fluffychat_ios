import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

import 'package:flutter_fluffychat_ios/helper/colors.dart';

// import 'package:flutter_fluffychat_ios/helper/tabBar.dart';
import 'package:flutter_fluffychat_ios/helper/is_nav_bar.dart';
import 'package:flutter_fluffychat_ios/helper/tab_controller_remake.dart';
import 'package:flutter_fluffychat_ios/helper/tabs_remake.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/models/folder.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/theme/theme.dart';
import 'dart:math' as math;

import 'package:flutter_fluffychat_ios/view/chat/chatsView.dart';


class AppBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          ISSliverNavigationBar(
            previousPageTitle: "",
            border: Border.all(style: BorderStyle.none),
            strokeTitle: Text(
              "CHAT",
              maxLines: 1,
            ),
            strokeColor: darkBlue,
            largeTitle: Text("Чат"),
            //actionsForegroundColor:blue,
            foreground: Paint()
              ..shader = LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [black, black],
              ).createShader(Rect.fromLTWH(0, 0, 144, 41)),
          ),
          /*CupertinoSliverNavigationBar(
           //: Text("Чат"),
           backgroundColor: white,
           largeTitle: Stack (
             children: [
               Container(
                 margin: EdgeInsets.fromLTRB(45, 15, 0, 0),
                 child: Stack(
                   children: <Widget>[
                     Text(
                       'CHAT',
                       style: TextStyle(
                         fontSize: 50,
                         fontWeight: FontWeight.w500,
                         foreground: Paint()
                           ..style = PaintingStyle.stroke
                           ..strokeWidth = 3
                           ..color = blue,
                       ),
                     ),
                     Text(
                       'CHAT',
                       style: TextStyle(
                         fontSize: 50,
                         fontWeight: FontWeight.w500,
                         color: white,
                       ),
                     ),
                   ],
                 ),
               ),
               Container(
                 margin: EdgeInsets.fromLTRB(15, 35, 0, 0),
                 child:  Text("Чат",
                   style: new TextStyle(
                       fontSize: 34,
                       fontWeight: FontWeight.w800,
                       color: black
                   ),
                 ),
               ),
             ],
           ),
         ),*/
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
                collapsedHeight: height - 65, expandedHeight: height - 42, height: height),
            pinned: true,
          )
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  _SliverAppBarDelegate({
    @required this.height,
    @required this.collapsedHeight,
    @required this.expandedHeight,
  });

  final double expandedHeight;

  final double collapsedHeight;

  String activeKey;

  ScrollController menuController = new ScrollController();
  Map<String, int> positions = new Map();

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => math.max(expandedHeight, minExtent);

  int countUnread(int folderID) {
    int counter = 0;
    if (folderID == 1) return 0;
    for (Folder i in me.folders) {
      if (i.folderID == folderID) {
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

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      color: AppThemeSwitcherWidget.of(context).themeData.scaffoldBackgroundColor,
      child: DefaultTabController(
        length: me.folders.length,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                // indicatorColor: blue,
                labelColor: black,
                unselectedLabelColor: grey,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                tabs: me.folders.map((element) {
                  return SizedBox(
                    height: 35,
                    child: new Tab(
                      text: element.folderName,
                      counter: countUnread(element.folderID),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: TabBarView(
                  children: me.folders.map((element) {
                    return SizedBox(
                      height: 35,
                      child: ChatsList(element),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true; // activeKey != oldDelegate.activeKey; //expandedHeight != oldDelegate.expandedHeight || collapsedHeight != oldDelegate.collapsedHeight;
  }
}

int countUnread(int folderID) {
  int counter = 0;
  if (folderID == 1) return 0;
  for (Folder i in me.folders) {
    if (i.folderID == folderID) {
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