import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/helper/is_nav_bar.dart';
import 'package:flutter_fluffychat_ios/helper/tab_controller_remake.dart';
import 'package:flutter_fluffychat_ios/helper/tabs_remake.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';
import 'package:flutter_fluffychat_ios/models/folder.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';
import 'package:flutter_fluffychat_ios/theme/theme.dart';
import 'package:flutter_fluffychat_ios/icons_chat.dart';
import 'dart:math' as math;
import 'package:flutter_fluffychat_ios/view/chat/chatsView.dart';
import 'package:flutter_fluffychat_ios/search/search_logic.dart';
import 'package:flutter_fluffychat_ios/search/cupertino_style_search.dart';

import 'avatarka.dart';
import 'cupertinoSearch.dart';
import 'dart:developer' as developer;

List<SearchItem> search(String text) {
  return items
      .where((element) =>
      element.name.toLowerCase().contains(text.toLowerCase()))
      .toList();
}

final List<SearchItem> items = chats.map((element)  {
  print(element.toString());
  return SearchItem(element.chatName,
      Avatarka("assets/ac.jpg", false));
}).toList();

class AppBarView extends StatefulWidget {
  final List<SearchItem> Function(String text) search;

  const AppBarView({Key key, this.search}) : super(key: key);

  @override
  _AppBarViewState createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> with SingleTickerProviderStateMixin {
  TabController tabController;
  FocusNode _focusNode;
  List<ScrollController> scrollController = <ScrollController>[];
  int page = 0;


  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: me.folders.length, vsync: this);
    tabController.addListener(() {
      developer.log(tabController.index.toString(), name: 'appBarView_tabControllerIndex');
      developer.log(me.folders.elementAt(page).chatsID.toString(), name: 'appBarView_chatsInFolder');
      setState(() {
        page = tabController.index;
      });
      scrollController.forEach((controller) => controller.jumpTo(controller.position.maxScrollExtent));
      // scrollController.initialScrollOffset;
    });
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showPlatformSearch(
          context: context,
          delegate: CupertinoSearchDelegate(widget.search),
        );
      }
      _focusNode.unfocus();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = 100;
    return CupertinoPageScaffold(
      // backgroundColor: white,
      child: NestedScrollView(
        // controller: scrollController,
        headerSliverBuilder: (context, flag){
          return [
            ISSliverNavigationBar(
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    onPressed: () {},
                    child: Icon(
                      Icons_Chat.call_plus_out_28,
                      color: blue,
                      size: 28,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                  fontFamily: "SFProDisplayBold",
                ),
              ),
              //strokeColor: darkBlue,
              largeTitle: Text(
                "Чат",
              ),
              //middle: CupertinoSearchTextField (),
            ),

            SliverPersistentHeader(
              delegate: _SliverSearchBarDelegate(
                search,
                _focusNode,
                collapsedHeight: height - 45,
                expandedHeight: height - 45,
                height: 0),
              pinned: false,
            ),

            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                // this.scrollController,
                tabController: tabController,
                  collapsedHeight: height - 65,
                  expandedHeight: height - 65,
                  height: 38,
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          dragStartBehavior: DragStartBehavior.start,
          controller: tabController,
          children: me.folders.map((element) {
            return ChatsList(element, scrollController);
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
  // List<ScrollController> scrollController = <ScrollController>[];

  _SliverAppBarDelegate(
      // this.scrollController,
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
                      // scrollController.add(new ScrollController());
                      return SizedBox(
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


class _SliverSearchBarDelegate extends SliverPersistentHeaderDelegate{
  Function(String) search;
  FocusNode _focusNode;
  final double expandedHeight;
  final double height;
  final double collapsedHeight;
  _SliverSearchBarDelegate(
    this.search,
    this._focusNode,
    {
      @required this.height,
      @required this.collapsedHeight,
      @required this.expandedHeight
    }
  );

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => math.max(expandedHeight, minExtent);



@override
Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    child: CupertinoTextField(
      decoration: BoxDecoration(color: transparentGrey.withAlpha(20), borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Icon(
          CupertinoIcons.search,
          color: grey,
          size: 16,
        ),
      ),
      cursorColor: blue,
      style: TextStyle(
        fontSize: 17,
        color: darkText_secondary,
        fontFamily: "SFProText",
        fontWeight: FontWeight.normal
      ),
      placeholder: 'Поиск',
      placeholderStyle: TextStyle(
        fontSize: 17,
        color: darkText_secondary,
        fontFamily: "SFProText",
        fontWeight: FontWeight.normal
      ),
      readOnly: true,
      onTap: () {
        showPlatformSearch(
          context: context,
          delegate: CupertinoSearchDelegate(search),
        );
        // Navigator.push(
        //     context,
        //     CupertinoPageRoute(
        //         builder: (context) => CupertinoSearch(search)));
      },
      // readOnly: true,
    ),
    /*child: GestureDetector(
      onTap: () {
        showPlatformSearch(
          context: context,
          delegate: CupertinoSearchDelegate(search),
        );
      },
      child: CupertinoSearchTextField(
        focusNode: _focusNode,
      ),
    ),*/
  );
  /*Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: CupertinoSearchTextField(
        suffixMode: OverlayVisibilityMode.always,
        prefixInsets: EdgeInsetsDirectional.fromSTEB(12, 10, 8, 10),
        controller: TextEditingController(
          text: "Поиск",
        ),
        // placeholder: 'Поиск',
        // onChanged: () => ,
        backgroundColor: Color.fromRGBO(118, 118, 128, 0.12),
          style: TextStyle(
              color: grey,
              fontSize: 17,
              fontWeight: FontWeight.w400,
              fontFamily: "SFProtext"),
        ),
      );*/
}

  @override
  bool shouldRebuild(_SliverSearchBarDelegate oldDelegate) {
    return true;
  }
}