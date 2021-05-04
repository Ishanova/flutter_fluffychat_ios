import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluffychat_ios/view/chatsList.dart';
import 'package:flutter_fluffychat_ios/newModels/Chat.dart';

void main() => runApp(TestFlutter());

class TestFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text("Chat",
                style: new TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              bottom: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Private"),
                  Tab(text: "Unread"),
                  Tab(text: "Study")
                ],
              ),
              backgroundColor: Colors.white,
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
