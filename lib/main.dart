import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/view/chatsList.dart';
import 'package:flutter_fluffychat_ios/widgets/tab.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_fluffychat_ios/view/data.dart';
void main() => runApp(TestFlutter());

class TestFlutter extends StatelessWidget {
  final contrastColor = const Color.fromARGB(255, 0, 145, 255);
  final chatColor = const Color.fromARGB(56, 45, 47, 182);
  int counter;
  var listFolders = [
    {"name": "Личные", "status": true}, {"name": "Непрочитанные", "status": false},
    {"name": "Учёба", "status": true}
  ];
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(130),
              child: SafeArea(
                child: AppBar(
                  elevation: 0.0,
                  centerTitle: false,
                  flexibleSpace: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(45, 15, 0, 0),
                        child:
                        Stack(
                          children: <Widget>[
                            Text(
                              'CHAT',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w500,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = chatColor,
                              ),
                            ),
                            // Solid text as fill.
                            Text(
                              'CHAT',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(15, 35, 0, 0),
                        child:  Text("Чат",
                          style: new TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w800,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        child: TabModel(element["name"], element["status"], counter),
                      ));
                    }).toList(),
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight:  FontWeight.w500,
                    ),
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
              ],
            ),
          ),
        )
    );
  }
}
