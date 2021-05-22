import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/view/chatsList.dart';
//import 'package:flutter_fluffychat_ios/models/chat.dart';

void main() => runApp(TestFlutter());

class TestFlutter extends StatelessWidget {
  final contrastColor = const Color.fromARGB(100, 0, 145, 255);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
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
                                  ..color = contrastColor,
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
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "ЛИЧНЫЕ"),
                      Tab(text: "НЕПРОЧИТАННЫЕ"),
                      Tab(text: "УЧЁБА")
                    ],
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
