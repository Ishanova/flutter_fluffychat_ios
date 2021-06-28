import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/helper/tabBar.dart';
import 'package:flutter_fluffychat_ios/helper/is_nav_bar.dart';


class AppBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
         slivers: [
                 SliverToBoxAdapter(
                   child: ISSliverNavigationBar(
                     previousPageTitle: "",
                     border: Border.all(style: BorderStyle.none),
                     strokeTitle: Text(
                       "ITMOLNIA",
                       maxLines: 1,
                     ),
                     strokeColor: Color(0xFF434244).withOpacity(0.25),
                     largeTitle: Text("ITMOLNIA"),
                     actionsForegroundColor: Color(0xFFF7B500),
                     foreground: Paint()
                       ..shader = LinearGradient(
                         begin: Alignment.topLeft,
                         end: Alignment.bottomRight,
                         colors: [Color(0xFFF9C433), Color(0xFFF7B500)],
                       ).createShader(Rect.fromLTWH(0, 0, 144, 41)),
                   ),
                 ),
        /* CupertinoSliverNavigationBar(
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
           SliverToBoxAdapter(
             child: TabBar(),
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
