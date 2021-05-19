import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/view/chatsList.dart';
import 'package:flutter_fluffychat_ios/models/chat.dart';

void main() => runApp(TestFlutter());

class TestFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: AppBar(
                elevation: 0.0,
                centerTitle: false,
                flexibleSpace: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 22, 0, 0),
                      child:  Text("Chat",
                        style: new TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            color: Colors.deepPurpleAccent[100]
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(15, 35, 0, 0),
                      child:  Text("Chat",
                        style: new TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ],
                ),
                bottom:
                TabBar(
                  //isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "PRIVATE"),
                    Tab(text: "UNREAD"),
                    Tab(text: "STUDY")
                  ],
                  labelStyle: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.white,
              ),
            ),

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
