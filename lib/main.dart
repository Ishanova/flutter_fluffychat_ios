import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatsView.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatTab.dart';
import 'package:flutter_fluffychat_ios/helper/appBarView.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(TestFlutter());// стоит переименовать тестфлаттер

class TestFlutter extends StatelessWidget {
  final contrastColor = const Color.fromARGB(255, 0, 145, 255);
  final brightColor = const Color.fromARGB(255, 255, 255, 255);
  final chatColor = const Color.fromARGB(56, 45, 47, 182);

  var listFolders = [
    {"name": "Личные", "status": true}, {"name": "Непрочитанные", "status": false},
    {"name": "Учёба", "status": true}
  ];
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(brightColor);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
        home: AppBarView(),
    );
  }
}


int countUnread(){
 return 1;
}
bool tagged(){
  return true;
}