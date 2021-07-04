import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/helper/tabBar.dart';
import 'package:flutter_fluffychat_ios/helper/is_nav_bar.dart';
import 'package:flutter_fluffychat_ios/theme/theme.dart';
import 'dart:math' as math;


class AppBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                 collapsedHeight: 35,
                 expandedHeight: 35),
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

  _SliverAppBarDelegate({
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

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return new Container(
        height: 35,
        color: AppThemeSwitcherWidget.of(context).themeData.scaffoldBackgroundColor,
        child: TabBar());
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true; // activeKey != oldDelegate.activeKey; //expandedHeight != oldDelegate.expandedHeight || collapsedHeight != oldDelegate.collapsedHeight;
  }
}