import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fluffychat_ios/theme/theme.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatsView.dart';
import 'package:flutter_fluffychat_ios/view/chat/chatTab.dart';
import 'package:flutter_fluffychat_ios/helper/appBarView.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(AppThemeSwitcherWidget(child: TestFlutter()));// стоит переименовать тестфлаттер

class TestFlutter extends StatelessWidget {
  final contrastColor = const Color.fromARGB(255, 0, 145, 255);
  final brightColor = const Color.fromARGB(255, 255, 255, 255);
  final chatColor = const Color.fromARGB(56, 45, 47, 182);


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    FlutterStatusbarcolor.setStatusBarColor(brightColor);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(textStyle: TextStyle(fontFamily: "SFProText")),
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
        home: AppBarView(),
    );
  }
}