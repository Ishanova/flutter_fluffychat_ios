import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';

class AppBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
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
        ),
      ],
      );
   // );


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
