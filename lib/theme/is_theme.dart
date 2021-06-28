import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'text_theme.dart';

class ISTheme extends StatelessWidget {
  const ISTheme({
    Key key,
    @required this.data,
    @required this.child,
  })  : assert(child != null),
        assert(data != null),
        super(key: key);

  /// The [CupertinoThemeData] styling for this theme.
  final ISThemeData data;

  /// Retrieves the [CupertinoThemeData] from the closest ancestor [ISTheme]
  /// widget, or a default [CupertinoThemeData] if no [ISTheme] ancestor
  /// exists.
  ///
  /// Resolves all the colors defined in that [CupertinoThemeData] against the
  /// given [BuildContext] on a best-effort basis.
  static ISThemeData of(BuildContext context) {
    final _InheritedCupertinoTheme inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedCupertinoTheme>();
    return (inheritedTheme?.theme?.data ?? const ISThemeData()).resolveFrom(context, nullOk: true);
  }

  /// Retrieves the [Brightness] to use for descendant Cupertino widgets, based
  /// on the value of [CupertinoThemeData.brightness] in the given [context].
  ///
  /// If no [ISTheme] can be found in the given [context], or its `brightness`
  /// is null, it will fall back to [MediaQueryData.brightness].
  ///
  /// Throws an exception if no valid [ISTheme] or [MediaQuery] widgets
  /// exist in the ancestry tree, unless [nullOk] is set to true.
  ///
  /// See also:
  ///
  /// * [CupertinoThemeData.brightness], the property takes precedence over
  ///   [MediaQueryData.platformBrightness] for descendant Cupertino widgets.
  static Brightness brightnessOf(BuildContext context, {bool nullOk = false}) {
    final _InheritedCupertinoTheme inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedCupertinoTheme>();
    return inheritedTheme?.theme?.data?.brightness ?? MediaQuery.of(context)?.platformBrightness;
  }

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _InheritedCupertinoTheme(
      theme: this,
      child: IconTheme(
        data: CupertinoIconThemeData(color: data.primaryColor),
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}

class _InheritedCupertinoTheme extends InheritedWidget {
  const _InheritedCupertinoTheme({
    Key key,
    @required this.theme,
    @required Widget child,
  })  : assert(theme != null),
        super(key: key, child: child);

  final ISTheme theme;

  @override
  bool updateShouldNotify(_InheritedCupertinoTheme old) => theme.data != old.theme.data;
}

// Values derived from https://developer.apple.com/design/resources/.
const _ISThemeDefaults _kDefaultTheme = _ISThemeDefaults(
  null,
  CupertinoColors.systemBlue,
  CupertinoColors.systemBackground,
  CupertinoDynamicColor.withBrightness(
    color: Color(0xF0F9F9F9),
    darkColor: Color(0xF01D1D1D),
    // Values extracted from navigation bar. For toolbar or tabbar the dark color is 0xF0161616.
  ),
  CupertinoColors.systemBackground,
  _ISTextThemeDefaults(CupertinoColors.label, CupertinoColors.inactiveGray),
);

class ISThemeData extends CupertinoThemeData {
  const ISThemeData({
    Brightness brightness,
    Color primaryColor,
    Color primaryContrastingColor,
    ISTextThemeData textTheme,
    Color barBackgroundColor,
    Color scaffoldBackgroundColor,
  }) : this.raw(
          brightness,
          primaryColor,
          primaryContrastingColor,
          textTheme,
          barBackgroundColor,
          scaffoldBackgroundColor,
        );

  @protected
  const ISThemeData.raw(
    Brightness brightness,
    Color primaryColor,
    Color primaryContrastingColor,
    ISTextThemeData textTheme,
    Color barBackgroundColor,
    Color scaffoldBackgroundColor,
  ) : this._rawWithDefaults(
          brightness,
          primaryColor,
          primaryContrastingColor,
          textTheme,
          barBackgroundColor,
          scaffoldBackgroundColor,
          _kDefaultTheme,
        );

  const ISThemeData._rawWithDefaults(
    this.brightness,
    this._primaryColor,
    this._primaryContrastingColor,
    this._textTheme,
    this._barBackgroundColor,
    this._scaffoldBackgroundColor,
    this._defaults,
  );

  final _ISThemeDefaults _defaults;

  final Brightness brightness;

  Color get primaryColor => _primaryColor ?? _defaults.primaryColor;
  final Color _primaryColor;

  Color get primaryContrastingColor => _primaryContrastingColor ?? _defaults.primaryContrastingColor;
  final Color _primaryContrastingColor;

  ISTextThemeData get textTheme {
    return _textTheme; // ?? _defaults.textThemeDefaults.createDefaults(primaryColor: primaryColor);
  }

  final ISTextThemeData _textTheme;

  Color get barBackgroundColor => _barBackgroundColor ?? _defaults.barBackgroundColor;
  final Color _barBackgroundColor;

  Color get scaffoldBackgroundColor => _scaffoldBackgroundColor ?? _defaults.scaffoldBackgroundColor;
  final Color _scaffoldBackgroundColor;

  @protected
  ISThemeData resolveFrom(BuildContext context, {bool nullOk = false}) {
    Color convertColor(Color color) => CupertinoDynamicColor.resolve(color, context);

    return ISThemeData._rawWithDefaults(
      brightness,
      convertColor(_primaryColor),
      convertColor(_primaryContrastingColor),
      _textTheme?.resolveFrom(context),
      convertColor(_barBackgroundColor),
      convertColor(_scaffoldBackgroundColor),
      _defaults.resolveFrom(context, _textTheme == null, nullOk: nullOk),
    );
  }

  ISThemeData copyWith({
    Brightness brightness,
    Color primaryColor,
    Color primaryContrastingColor,
    CupertinoTextThemeData textTheme,
    Color barBackgroundColor,
    Color scaffoldBackgroundColor,
  }) {
    return ISThemeData._rawWithDefaults(
      brightness ?? this.brightness,
      primaryColor ?? _primaryColor,
      primaryContrastingColor ?? _primaryContrastingColor,
      textTheme ?? _textTheme,
      barBackgroundColor ?? _barBackgroundColor,
      scaffoldBackgroundColor ?? _scaffoldBackgroundColor,
      _defaults,
    );
  }
}

@immutable
class _ISThemeDefaults {
  const _ISThemeDefaults(
    this.brightness,
    this.primaryColor,
    this.primaryContrastingColor,
    this.barBackgroundColor,
    this.scaffoldBackgroundColor,
    this.textThemeDefaults,
  );

  final Brightness brightness;
  final Color primaryColor;
  final Color primaryContrastingColor;
  final Color barBackgroundColor;
  final Color scaffoldBackgroundColor;
  final _ISTextThemeDefaults textThemeDefaults;

  _ISThemeDefaults resolveFrom(BuildContext context, bool resolveTextTheme, {@required bool nullOk}) {
    assert(nullOk != null);
    Color convertColor(Color color) => CupertinoDynamicColor.resolve(color, context);

    return _ISThemeDefaults(
      brightness,
      convertColor(primaryColor),
      convertColor(primaryContrastingColor),
      convertColor(barBackgroundColor),
      convertColor(scaffoldBackgroundColor),
      resolveTextTheme ? textThemeDefaults?.resolveFrom(context, nullOk: nullOk) : textThemeDefaults,
    );
  }
}

@immutable
class _ISTextThemeDefaults {
  const _ISTextThemeDefaults(
    this.labelColor,
    this.inactiveGray,
  );

  final Color labelColor;
  final Color inactiveGray;

  _ISTextThemeDefaults resolveFrom(BuildContext context, {@required bool nullOk}) {
    return _ISTextThemeDefaults(
      CupertinoDynamicColor.resolve(labelColor, context),
      CupertinoDynamicColor.resolve(inactiveGray, context),
    );
  }

  ISTextThemeData createDefaults({@required Color primaryColor}) {
    assert(primaryColor != null);
    return _DefaultCupertinoTextThemeData(
      primaryColor: primaryColor,
//      secondaryColor: secondaryColor,
      labelColor: labelColor,
      inactiveGray: inactiveGray,
    );
  }
}

// CupertinoTextThemeData with no text styles explicitly specified.
// The implementation of this class may need to be updated when any of the default
// text styles changes.
class _DefaultCupertinoTextThemeData extends ISTextThemeData {
  _DefaultCupertinoTextThemeData({
    @required this.labelColor,
    @required this.inactiveGray,
    @required Color primaryColor,
//    @required Color secondaryColor,
  })  : assert(labelColor != null),
        assert(inactiveGray != null),
        assert(primaryColor != null),
//        assert(secondaryColor != null),
        super(primaryColor: labelColor, secondaryColor: inactiveGray);

  final Color labelColor;
  final Color inactiveGray;
}
