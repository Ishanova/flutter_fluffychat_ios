import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'is_theme.dart';
import 'text_theme.dart';

enum Themes {
  light,
  dark,
  system,
}

final ISThemeData lightTheme = ISThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF2D2FB6),
  primaryContrastingColor: Color(0xFFEE215B),
  scaffoldBackgroundColor: Color(0xFFFFFFFF),
  textTheme: ISTextThemeData(primaryColor: Color(0xFF000000), secondaryColor: Color.fromRGBO(60, 60, 67, 0.6)),
  barBackgroundColor: Color(0xFFFFFFFF),
);

final ISThemeData darkTheme = ISThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF2D2FB6),
  primaryContrastingColor: Color(0xFFEE215B),
  scaffoldBackgroundColor: Color(0xFF1B1B1B),
  textTheme: ISTextThemeData(primaryColor: Color(0xFFFFFFFF), secondaryColor: Color.fromRGBO(235, 235, 245, 0.6)),
  barBackgroundColor: Color(0xFF1B1B1B),
);

//CupertinoThemeData.dark().copyWith(
//  primaryColorDark: Color(0xff1B1B1B),
//  primaryColorLight: Colors.white,
//  primaryColor: Color(0xFF8966CF),
//  errorColor: Color(0xFFCF6679),
//  backgroundColor: Color(0xff121212),
//  scaffoldBackgroundColor: Color(0xff1B1B1B),
//  accentColor: Color(0xFFF5B4D2),
//  secondaryHeaderColor: Color(0xff202020),
//  snackBarTheme: SnackBarThemeData(
//    behavior: kIsWeb ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
//  ),
//  dialogTheme: DialogTheme(
//    shape: RoundedRectangleBorder(
//      borderRadius: BorderRadius.circular(8.0),
//    ),
//  ),
//  popupMenuTheme: PopupMenuThemeData(
//    shape: RoundedRectangleBorder(
//      borderRadius: BorderRadius.circular(8.0),
//    ),
//  ),
//  appBarTheme: AppBarTheme(
//    brightness: Brightness.dark,
//    color: Color(0xff1D1D1D),
//    textTheme: TextTheme(
//      headline6: TextStyle(
//        color: Colors.white,
//        fontSize: 20,
//      ),
//    ),
//    iconTheme: IconThemeData(color: Colors.white),
//  ),
//);

final ISThemeData amoledTheme = ISThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF2D2FB6),
  primaryContrastingColor: Color(0xFFEE215B),
  scaffoldBackgroundColor: Color(0xFF1B1B1B),
  textTheme: ISTextThemeData(primaryColor: Color(0xFFFFFFFF), secondaryColor: Color.fromRGBO(235, 235, 245, 0.6)),
  barBackgroundColor: Color(0xFF1B1B1B),
);
//CupertinoThemeData.dark().copyWith(
//  primaryColorDark: Color(0xff121212),
//  primaryColorLight: Colors.white,
//  primaryColor: Color(0xFF8966CF),
//  errorColor: Color(0xFFCF6679),
//  backgroundColor: Colors.black,
//  scaffoldBackgroundColor: Colors.black,
//  accentColor: Color(0xFFF5B4D2),
//  secondaryHeaderColor: Color(0xff1D1D1D),
//  snackBarTheme: SnackBarThemeData(
//    behavior: kIsWeb ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
//  ),
//  dialogTheme: DialogTheme(
//    shape: RoundedRectangleBorder(
//      borderRadius: BorderRadius.circular(8.0),
//    ),
//  ),
//  popupMenuTheme: PopupMenuThemeData(
//    shape: RoundedRectangleBorder(
//      borderRadius: BorderRadius.circular(8.0),
//    ),
//  ),
//  appBarTheme: AppBarTheme(
//    brightness: Brightness.dark,
//    color: Color(0xff1D1D1D),
//    textTheme: TextTheme(
//      headline6: TextStyle(
//        color: Colors.white,
//        fontSize: 20,
//      ),
//    ),
//    iconTheme: IconThemeData(color: Colors.white),
//  ),
//);

Color blackWhiteColor(BuildContext context) => ISTheme.of(context).brightness == Brightness.light ? Color(0xFFFFFFFF) : Color(0xFF000000);

class ThemeSwitcher extends InheritedWidget {
  final AppThemeSwitcherWidgetState data;

  const ThemeSwitcher({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(ThemeSwitcher old) {
    return this != old;
  }
}

class AppThemeSwitcherWidget extends StatefulWidget {
  final Widget child;

  AppThemeSwitcherWidget({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  AppThemeSwitcherWidgetState createState() => AppThemeSwitcherWidgetState();

  /// Returns the (nearest) Client instance of your application.
  static AppThemeSwitcherWidgetState of(BuildContext context) {
    var newState = (context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>()).data;
    newState.context = context;
    return newState;
  }
}

class AppThemeSwitcherWidgetState extends State<AppThemeSwitcherWidget> {
  ISThemeData themeData;
  Themes selectedTheme;
  bool amoledEnabled;
  @override
  BuildContext context;

  Future loadSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String item = prefs.getString('theme') ?? 'light';
    selectedTheme = Themes.values.firstWhere((e) => e.toString() == 'Themes.' + item);

    amoledEnabled = prefs.getBool('amoled_enabled') ?? false;

    switchTheme(selectedTheme, amoledEnabled);
    return;
  }

  void switchTheme(Themes newTheme, bool amoledEnabled) async {
    ISThemeData theme;
    switch (newTheme) {
      case Themes.light:
        theme = lightTheme;
        break;
      case Themes.dark:
        if (amoledEnabled) {
          theme = amoledTheme;
        } else {
          theme = darkTheme;
        }
        break;
      case Themes.system:
        // This needs to be a low level call as we don't have a MaterialApp yet
        var brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window).platformBrightness;
        if (brightness == Brightness.dark) {
          if (amoledEnabled) {
            theme = amoledTheme;
          } else {
            theme = darkTheme;
          }
        } else {
          theme = lightTheme;
        }
        break;
    }

    await saveThemeValue(newTheme);
    await saveAmoledEnabledValue(amoledEnabled);
    setState(() {
      amoledEnabled = amoledEnabled;
      selectedTheme = newTheme;
      themeData = theme;
    });
  }

  Future saveThemeValue(Themes value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', value.toString().split('.').last);
  }

  Future saveAmoledEnabledValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('amoled_enabled', value);
  }

  void setup() async {
    await loadSelection();

    if (selectedTheme == null) {
      switchTheme(Themes.light, false);
    } else {
      switch (selectedTheme) {
        case Themes.light:
          switchTheme(Themes.light, false);
          break;
        case Themes.dark:
          if (amoledEnabled) {
            switchTheme(Themes.dark, true);
          } else {
            switchTheme(Themes.dark, false);
          }
          break;
        case Themes.system:
          switchTheme(Themes.system, false);
          break;
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (amoledEnabled == null || selectedTheme == null) {
        setup();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (themeData == null) {
      // This needs to be a low level call as we don't have a MaterialApp yet
      var brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window).platformBrightness;
      if (brightness == Brightness.dark) {
        themeData = darkTheme;
      } else {
        themeData = lightTheme;
      }
      return ThemeSwitcher(
        data: this,
        child: widget.child,
      );
    } else {
      return ThemeSwitcher(
        data: this,
        child: widget.child,
      );
    }
  }
}
