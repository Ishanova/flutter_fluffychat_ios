import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/helper/is_nav_bar.dart';
import 'package:flutter_fluffychat_ios/helper/tab_controller_remake.dart';
import 'package:flutter_fluffychat_ios/helper/tabs_remake.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/models/folder.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/theme/theme.dart';
import 'package:flutter_fluffychat_ios/icons_chat.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatRow.dart';
import 'dart:math' as math;

import 'package:flutter_fluffychat_ios/view/chat/chatsView.dart';

class AppBarView extends StatefulWidget {
  @override
  _AppBarViewState createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int page = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: me.folders.length, vsync: this);
    tabController.addListener(() {
      print(tabController.index);
      print(me.folders.elementAt(page).chatsID);
      setState(() {
        page = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = 100;
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, flag){
          return [
            ISSliverNavigationBar(
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    child: Icon(
                      Icons_Chat.call_plus_out_28,
                      color: blue,
                      size: 28,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {},
                    child: Icon(
                      Icons_Chat.pen_out_28,
                      color: blue,
                      size: 28,
                    ),
                  ),
                ],
              ),
              previousPageTitle: "",
              border: Border.all(style: BorderStyle.none),
              strokeTitle: Text(
                "CHAT",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.w700,
                  fontFamily: "SFProDisplay",
                ),
              ),
              strokeColor: darkBlue,
              largeTitle: Text(
                "Чат",
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                  tabController: tabController,
                  collapsedHeight: height - 65,
                  expandedHeight: height - 42,
                  height: 60),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
              controller: tabController,
              children: me.folders.map((element) {
                return ChatsList(element);
              }).toList(),
            )

        // [
        //
        //
        //   /*CupertinoSliverNavigationBar(
        //    //: Text("Чат"),
        //    backgroundColor: white,
        //    largeTitle: Stack (
        //      children: [
        //        Container(
        //          margin: EdgeInsets.fromLTRB(45, 15, 0, 0),
        //          child: Stack(
        //            children: <Widget>[
        //              Text(
        //                'CHAT',
        //                style: TextStyle(
        //                  fontSize: 50,
        //                  fontWeight: FontWeight.w500,
        //                  foreground: Paint()
        //                    ..style = PaintingStyle.stroke
        //                    ..strokeWidth = 3
        //                    ..color = blue,
        //                ),
        //              ),
        //              Text(
        //                'CHAT',
        //                style: TextStyle(
        //                  fontSize: 50,
        //                  fontWeight: FontWeight.w500,
        //                  color: white,
        //                ),
        //              ),
        //            ],
        //          ),
        //        ),
        //        Container(
        //          margin: EdgeInsets.fromLTRB(15, 35, 0, 0),
        //          child:  Text("Чат",
        //            style: new TextStyle(
        //                fontSize: 34,
        //                fontWeight: FontWeight.w800,
        //                color: black
        //            ),
        //          ),
        //        ),
        //      ],
        //    ),
        //  ),*/
        //   SliverList(delegate: SliverChildBuilderDelegate((context, index) {
        //     print(getChatByID(me.folders.elementAt(page).chatsID.elementAt(index)));
        //     return ChatRow(getChatByID(me.folders.elementAt(page).chatsID.elementAt(index)));
        //   }, childCount: me.folders.elementAt(page).chatsID.length)),
        //   // SliverToBoxAdapter(
        //   //   child: Padding(
        //   //     padding: EdgeInsets.only(top: 8),
        //   //     child: TabBarView(
        //   //       controller: tabController,
        //   //       children: me.folders.map((element) {
        //   //         return SizedBox(
        //   //           height: 35,
        //   //           child: ChatsList(element),
        //   //         );
        //   //       }).toList(),
        //   //     ),
        //   //   ),
        //   // )
        //   // SliverList(delegate: SliverChildListDelegate())
        //   /*SliverToBoxAdapter(
        //     child: DefaultTabController(
        //       length: me.folders.length,
        //       child: Column(
        //         children: [
        //           Container(
        //             height: 35,
        //             child: ListView(
        //               // shrinkWrap: true,
        //                 scrollDirection: Axis.horizontal,
        //                 children: [
        //                   TabBar(
        //                     isScrollable: true,
        //                     labelColor: black,
        //                     unselectedLabelColor: grey,
        //                     indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
        //                     tabs: me.folders.map((element) {
        //                       return SizedBox(
        //                         height: 35,
        //                         child: new Tab(
        //                           text: element.folderName,
        //                           counter: countUnread(element.folderID),
        //                         ),
        //                       );
        //                     }).toList(),
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Icon(
        //                       Icons_Chat.filter_out_24,
        //                       color: grey,
        //                       size: 15,
        //                     ),
        //                   ),
        //                 ]),
        //           ),
        //           Padding(
        //             padding: EdgeInsets.only(top: 8),
        //             child: TabBarView(
        //               children: me.folders.map((element) {
        //                 return SizedBox(
        //                   height: 35,
        //                   child: ChatsList(element),
        //                 );
        //               }).toList(),
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   )*/
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  _SliverAppBarDelegate(
      {@required this.height,
      @required this.collapsedHeight,
      @required this.expandedHeight,
      @required this.tabController});

  final double expandedHeight;

  final double collapsedHeight;

  final TabController tabController;
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
      color:
          AppThemeSwitcherWidget.of(context).themeData.scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            height: 35,
            child: ListView(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  TabBar(
                    isScrollable: true,
                    labelColor: black,
                    unselectedLabelColor: grey,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                    controller: tabController,
                    tabs: me.folders.map((element) {
                      return SizedBox(
                        //height: 35,
                        child: new Tab(
                          text: element.folderName,
                          counter: countUnread(element.folderID),
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons_Chat.filter_out_24,
                      color: grey,
                      size: 15,
                    ),
                  ),
                ]),
          ),
        ],
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
