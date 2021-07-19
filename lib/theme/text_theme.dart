// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show Brightness;
import 'package:flutter/widgets.dart';

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Values derived from https://developer.apple.com/design/resources/.
const TextStyle _kDefaultTextStyle = TextStyle(
  inherit: false,
  fontFamily: 'SFProText',
  fontSize: 22.0,
  letterSpacing: -0.41,
  color: CupertinoColors.label,
  decoration: TextDecoration.none,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Values derived from https://developer.apple.com/design/resources/.
const TextStyle _kDefaultActionTextStyle = TextStyle(
  inherit: false,
  fontFamily: 'SFProText',
  fontSize: 17.0,
  letterSpacing: -0.41,
  color: CupertinoColors.activeBlue,
  decoration: TextDecoration.none,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Values derived from https://developer.apple.com/design/resources/.
const TextStyle _kDefaultTabLabelTextStyle = TextStyle(
  inherit: false,
  fontFamily: 'SFProText',
  fontSize: 10.0,
  letterSpacing: -0.24,
  color: CupertinoColors.inactiveGray,
);

const TextStyle _kDefaultMiddleTitleTextStyle = TextStyle(
  inherit: false,
  fontFamily: 'SFProText',
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.41,
  color: CupertinoColors.label,
);

const TextStyle _kDefaultLargeTitleTextStyle = TextStyle(
  inherit: false,
  fontFamily: 'SFProDisplay',
  fontSize: 34.0,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.41,
  color: CupertinoColors.label,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Inspected on iOS 13 simulator with "Debug View Hierarchy".
// Value extracted from off-center labels. Centered labels have a font size of 25pt.
const TextStyle _kDefaultPickerTextStyle = TextStyle(
  inherit: false,
  fontFamily: 'SFProDisplay',
  fontSize: 21.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.41,
  color: CupertinoColors.label,
);

// Please update _TextThemeDefaultsBuilder accordingly after changing the default
// color here, as their implementation depends on the default value of the color
// field.
//
// Inspected on iOS 13 simulator with "Debug View Hierarchy".
// Value extracted from off-center labels. Centered labels have a font size of 25pt.
const TextStyle _kDefaultDateTimePickerTextStyle = TextStyle(
  inherit: false,
  fontFamily: 'SFProDisplay',
  fontSize: 21,
  fontWeight: FontWeight.normal,
  color: CupertinoColors.label,
);

const TextStyle _title3Bold =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 20, letterSpacing: 0.75, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProDisplayBold");

const TextStyle _title3BoldSecondary =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 20, letterSpacing: 0.75, color: Color.fromRGBO(60, 60, 67, 0.6), fontFamily: "SFProDisplayBold");

const TextStyle _title3SemiBold =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 20, letterSpacing: 0.75, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProDisplaySemibold");

const TextStyle _title3SemiBoldSecondary =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 20, letterSpacing: 0.75, color: Color.fromRGBO(60, 60, 67, 0.6), fontFamily: "SFProDisplaySemibold");

const TextStyle _title3Default =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 20, letterSpacing: 0.75, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProDisplay");

const TextStyle _title2Bold =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 22, letterSpacing: 0.8, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProDisplayBold");

const TextStyle _title1Bold =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 28, letterSpacing: 0.36, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProDisplayBold");

const TextStyle _title2DefaultSecondary =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 22, letterSpacing: 0.35, color: Color.fromRGBO(60, 60, 67, 0.6), fontFamily: "SFProDisplay");

const TextStyle _largeTitleBold =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 34, letterSpacing: 0.37, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProDisplayBold");

const TextStyle _bodyDefault =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 17, letterSpacing: -0.41, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProText");

const TextStyle _bodyMedium =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 17, letterSpacing: -0.41, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProTextMedium");

const TextStyle _bodySemibold =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 17, letterSpacing: -0.41, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProTextSemibold");

const TextStyle _bodyBold =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 17, letterSpacing: -0.41, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProDisplayBold");

const TextStyle _headlineDefault =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 17, letterSpacing: -0.41, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProText");

const TextStyle _footnoteSmallMedium =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 12, letterSpacing: -0.08, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProTextMedium");

const TextStyle _footnoteSmallDefault =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: 0, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProText");

const TextStyle _footnoteDaySmallDefault =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: 0, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProText");

const TextStyle _footnoteSmallDefaultSecondary =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: 0, color: Color.fromRGBO(235, 235, 245, 0.6), fontFamily: "SFProText");

const TextStyle _footnoteDefault =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 13, letterSpacing: 0.12, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProText");

const TextStyle _footnoteDefaultSecondary =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 13, letterSpacing: -0.08, color: Color.fromRGBO(235, 235, 245, 0.6), fontFamily: "SFProText");

const TextStyle _footnoteBold =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 13, letterSpacing: -0.08, color: Color.fromRGBO(0, 0, 0, 1), fontFamily: "SFProTextBold");

const TextStyle _footnoteBoldSecondary =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 13, letterSpacing: -0.08, color: Color.fromRGBO(235, 235, 245, 0.6), fontFamily: "SFProTextBold");

const TextStyle _subHeadlineDefault =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 15, letterSpacing: -0.24, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: "SFProText");

const TextStyle _subHeadlineSecondary =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 15, letterSpacing: -0.24, color: Color.fromRGBO(60, 60, 67, 0.6), fontFamily: "SFProText");

const TextStyle _subHeadlineSemiBold =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 15, letterSpacing: -0.24, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: "SFProTextSemibold");

const TextStyle _bodyDefaultSecondary =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 17, letterSpacing: -0.41, color: Color.fromRGBO(235, 235, 245, 0.6), fontFamily: "SFProText");

const TextStyle _calloutDefault =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: -0.32, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: "SFProText");

const TextStyle _caption2Default =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: 0.07, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: "SFProText");

const TextStyle _caption2Bold =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 11, letterSpacing: 0.06, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: "SFProTextSemibold");

const TextStyle _caption2Secondary =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: 0.07, color: Color.fromRGBO(235, 235, 245, 0.6), fontFamily: "SFProText");

TextStyle _resolveTextStyle(TextStyle style, BuildContext context, bool nullOk) {
  // This does not resolve the shadow color, foreground, background, etc.
  return style?.copyWith(
    color: CupertinoDynamicColor.resolve(style?.color, context),
    backgroundColor: CupertinoDynamicColor.resolve(style?.backgroundColor, context),
    decorationColor: CupertinoDynamicColor.resolve(style?.decorationColor, context),
  );
}

/// Cupertino typography theme in a [CupertinoThemeData].
@immutable
class ISTextThemeData extends CupertinoTextThemeData {
  /// Create a [ISTextThemeData].
  ///
  /// The [primaryColor] is used to derive TextStyle defaults of other attributes
  /// such as [navActionTextStyle] and [actionTextStyle], it must not be null when
  /// either [navActionTextStyle] or [actionTextStyle] is null. Defaults to
  /// [CupertinoColors.systemBlue].
  ///
  /// Other [TextStyle] parameters default to default iOS text styles when
  /// unspecified.
  ISTextThemeData({
    Color primaryColor,
    Color secondaryColor,
    // ignore: avoid_unused_constructor_parameters, the parameter is deprecated.
    @Deprecated('This argument no longer does anything. You can remove it. '
        'This feature was deprecated after v1.10.14.')
        Brightness brightness,
    TextStyle textStyle,
    TextStyle actionTextStyle,
    TextStyle tabLabelTextStyle,
    TextStyle navTitleTextStyle,
    TextStyle navLargeTitleTextStyle,
    TextStyle navActionTextStyle,
    TextStyle pickerTextStyle,
    TextStyle dateTimePickerTextStyle,
    TextStyle title3Bold,
    TextStyle title3BoldSecondary,
    TextStyle title3SemiBold,
    TextStyle title3SemiBoldSecondary,
    TextStyle title3Default,
    TextStyle title2Bold,
    TextStyle title1Bold,
    TextStyle title2DefaultSecondary,
    TextStyle largeTitleBold,
    TextStyle bodyDefault,
    TextStyle bodyMedium,
    TextStyle bodySemibold,
    TextStyle bodyBold,
    TextStyle headlineDefault,
    TextStyle footnoteSmallMedium,
    TextStyle footnoteSmallDefault,
    TextStyle footnoteDaySmallDefault,
    TextStyle footnoteSmallDefaultSecondary,
    TextStyle footnoteDefault,
    TextStyle footnoteDefaultSecondary,
    TextStyle footnoteBold,
    TextStyle footnoteBoldSecondary,
    TextStyle subHeadlineDefault,
    TextStyle subHeadlineSecondary,
    TextStyle subHeadlineSemiBold,
    TextStyle bodyDefaultSecondary,
    TextStyle calloutDefault,
    TextStyle caption2Default,
    TextStyle caption2Bold,
    TextStyle caption2Secondary,
  }) : this._raw(
          _TextThemeDefaultsBuilder(primaryColor, secondaryColor),
          primaryColor,
          secondaryColor,
          textStyle,
          actionTextStyle,
          tabLabelTextStyle,
          navTitleTextStyle,
          navLargeTitleTextStyle,
          navActionTextStyle,
          pickerTextStyle,
          dateTimePickerTextStyle,
          title3Bold,
          title3BoldSecondary,
          title3SemiBold,
          title3SemiBoldSecondary,
          title3Default,
          title2Bold,
          title1Bold,
          title2DefaultSecondary,
          largeTitleBold,
          bodyDefault,
          bodyMedium,
          bodySemibold,
          bodyBold,
          headlineDefault,
          footnoteSmallMedium,
          footnoteSmallDefault,
          footnoteDaySmallDefault,
          footnoteSmallDefaultSecondary,
          footnoteDefault,
          footnoteDefaultSecondary,
          footnoteBold,
          footnoteBoldSecondary,
          subHeadlineDefault,
          subHeadlineSecondary,
          subHeadlineSemiBold,
          bodyDefaultSecondary,
          calloutDefault,
          caption2Default,
          caption2Bold,
          caption2Secondary,
        );

  ISTextThemeData._raw(
    this._defaults,
    this._primaryColor,
    this._secondaryColor,
    this._textStyle,
    this._actionTextStyle,
    this._tabLabelTextStyle,
    this._navTitleTextStyle,
    this._navLargeTitleTextStyle,
    this._navActionTextStyle,
    this._pickerTextStyle,
    this._dateTimePickerTextStyle,
    this._title3Bold,
    this._title3BoldSecondary,
    this._title3SemiBold,
    this._title3SemiBoldSecondary,
    this._title3Default,
    this._title2Bold,
    this._title1Bold,
    this._title2DefaultSecondary,
    this._largeTitleBold,
    this._bodyDefault,
    this._bodyMedium,
    this._bodySemibold,
    this._bodyBold,
    this._headlineDefault,
    this._footnoteSmallMedium,
    this._footnoteSmallDefault,
    this._footnoteDaySmallDefault,
    this._footnoteSmallDefaultSecondary,
    this._footnoteDefault,
    this._footnoteDefaultSecondary,
    this._footnoteBold,
    this._footnoteBoldSecondary,
    this._subHeadlineDefault,
    this._subHeadlineSecondary,
    this._subHeadlineSemiBold,
    this._bodyDefaultSecondary,
    this._calloutDefault,
    this._caption2Default,
    this._caption2Bold,
    this._caption2Secondary,
  ) : assert((_navActionTextStyle != null && _actionTextStyle != null) || _primaryColor != null || _secondaryColor != null);

  final _TextThemeDefaultsBuilder _defaults;
  final Color _primaryColor;

  final Color _secondaryColor;

  final TextStyle _textStyle;

  /// The [TextStyle] of general text content for Cupertino widgets.
  TextStyle get textStyle => _textStyle ?? _defaults.textStyle;

  final TextStyle _actionTextStyle;

  /// The [TextStyle] of interactive text content such as text in a button without background.
  TextStyle get actionTextStyle {
    return _actionTextStyle ?? _defaults.actionTextStyle(primaryColor: _primaryColor);
  }

  final TextStyle _tabLabelTextStyle;

  /// The [TextStyle] of unselected tabs.
  TextStyle get tabLabelTextStyle => _tabLabelTextStyle ?? _defaults.tabLabelTextStyle;

  final TextStyle _navTitleTextStyle;

  /// The [TextStyle] of titles in standard navigation bars.
  TextStyle get navTitleTextStyle => _navTitleTextStyle ?? _defaults.navTitleTextStyle;

  final TextStyle _navLargeTitleTextStyle;

  /// The [TextStyle] of large titles in sliver navigation bars.
  TextStyle get navLargeTitleTextStyle => _navLargeTitleTextStyle ?? _defaults.navLargeTitleTextStyle;

  final TextStyle _navActionTextStyle;

  /// The [TextStyle] of interactive text content in navigation bars.
  TextStyle get navActionTextStyle {
    return _navActionTextStyle ?? _defaults.navActionTextStyle(primaryColor: _primaryColor);
  }

  final TextStyle _pickerTextStyle;

  /// The [TextStyle] of pickers.
  TextStyle get pickerTextStyle => _pickerTextStyle ?? _defaults.pickerTextStyle;

  final TextStyle _dateTimePickerTextStyle;

  /// The [TextStyle] of date time pickers.
  TextStyle get dateTimePickerTextStyle => _dateTimePickerTextStyle ?? _defaults.dateTimePickerTextStyle;

  final TextStyle _title3Bold;

  TextStyle get title3Bold => _title3Bold ?? _defaults.title3Bold;

  final TextStyle _title3BoldSecondary;

  TextStyle get title3BoldSecondary => _title3BoldSecondary ?? _defaults.title3BoldSecondary;

  final TextStyle _title3SemiBold;

  TextStyle get title3SemiBold => _title3SemiBold ?? _defaults.title3SemiBold;

  final TextStyle _title3SemiBoldSecondary;

  TextStyle get title3SemiBoldSecondary => _title3SemiBoldSecondary ?? _defaults.title3SemiBoldSecondary;

  final TextStyle _title3Default;

  TextStyle get title3Default => _title3Default ?? _defaults.title3Default;

  final TextStyle _title2Bold;

  TextStyle get title2Bold => _title2Bold ?? _defaults.title2Bold;

  final TextStyle _title1Bold;

  TextStyle get title1Bold => _title1Bold ?? _defaults.title1Bold;

  final TextStyle _title2DefaultSecondary;

  TextStyle get title2DefaultSecondary => _title2DefaultSecondary ?? _defaults.title2DefaultSecondary;

  final TextStyle _largeTitleBold;

  TextStyle get largeTitleBold => _largeTitleBold ?? _defaults.largeTitleBold;

  final TextStyle _bodyDefault;

  TextStyle get bodyDefault => _bodyDefault ?? _defaults.bodyDefault;

  final TextStyle _bodyMedium;

  TextStyle get bodyMedium => _bodyMedium ?? _defaults.bodyMedium;

  final TextStyle _bodySemibold;

  TextStyle get bodySemibold => _bodySemibold ?? _defaults.bodySemibold;

  final TextStyle _bodyBold;

  TextStyle get bodyBold => _bodyBold ?? _defaults.bodyBold;

  final TextStyle _headlineDefault;

  TextStyle get headlineDefault => _headlineDefault ?? _defaults.headlineDefault;

  final TextStyle _footnoteSmallMedium;

  TextStyle get footnoteSmallMedium => _footnoteSmallMedium ?? _defaults.footnoteSmallMedium;

  final TextStyle _footnoteSmallDefault;

  TextStyle get footnoteSmallDefault => _footnoteSmallDefault ?? _defaults.footnoteSmallDefault;

  final TextStyle _footnoteDaySmallDefault;

  TextStyle get footnoteDaySmallDefault => _footnoteDaySmallDefault ?? _defaults.footnoteDaySmallDefault;

  final TextStyle _footnoteSmallDefaultSecondary;

  TextStyle get footnoteSmallDefaultSecondary => _footnoteSmallDefaultSecondary ?? _defaults.footnoteSmallDefaultSecondary;

  final TextStyle _footnoteDefault;

  TextStyle get footnoteDefault => _footnoteDefault ?? _defaults.footnoteDefault;

  final TextStyle _footnoteDefaultSecondary;

  TextStyle get footnoteDefaultSecondary => _footnoteDefaultSecondary ?? _defaults.footnoteDefaultSecondary;

  final TextStyle _footnoteBold;

  TextStyle get footnoteBold => _footnoteBold ?? _defaults.footnoteBold;

  final TextStyle _footnoteBoldSecondary;

  TextStyle get footnoteBoldSecondary => _footnoteBoldSecondary ?? _defaults.footnoteBoldSecondary;

  final TextStyle _subHeadlineDefault;

  TextStyle get subHeadlineDefault => _subHeadlineDefault ?? _defaults.subHeadlineDefault;

  final TextStyle _subHeadlineSemiBold;

  TextStyle get subHeadlineSemiBold => _subHeadlineSemiBold ?? _defaults.subHeadlineSemiBold;

  final TextStyle _subHeadlineSecondary;

  TextStyle get subHeadlineSecondary => _subHeadlineSecondary ?? _defaults.subHeadlineSecondary;

  final TextStyle _bodyDefaultSecondary;

  TextStyle get bodyDefaultSecondary => _bodyDefaultSecondary ?? _defaults.bodyDefaultSecondary;

  final TextStyle _caption2Default;

  TextStyle get caption2Default => _caption2Default ?? _defaults.caption2Default;

  final TextStyle _calloutDefault;

  TextStyle get calloutDefault => _calloutDefault ?? _defaults.calloutDefault;

  final TextStyle _caption2Bold;

  TextStyle get caption2Bold => _caption2Bold ?? _defaults.caption2Bold;

  final TextStyle _caption2Secondary;

  TextStyle get caption2Secondary => _caption2Secondary ?? _defaults.caption2Secondary;

  /// Returns a copy of the current [ISTextThemeData] with all the colors
  /// resolved against the given [BuildContext].
  ///
  /// Throws an exception if any of the [InheritedWidget]s required to resolve
  /// this [ISTextThemeData] is not found in [context], unless [nullOk] is
  /// set to true, in which case [CupertinoDynamicColor]s that fail to resolve will
  /// be used as-is.
  ISTextThemeData resolveFrom(BuildContext context, {bool nullOk = false}) {
    return ISTextThemeData._raw(
      _defaults?.resolveFrom(context, nullOk),
      CupertinoDynamicColor.resolve(_primaryColor, context),
      CupertinoDynamicColor.resolve(_secondaryColor, context),
      _resolveTextStyle(_textStyle, context, nullOk),
      _resolveTextStyle(_actionTextStyle, context, nullOk),
      _resolveTextStyle(_tabLabelTextStyle, context, nullOk),
      _resolveTextStyle(_navTitleTextStyle, context, nullOk),
      _resolveTextStyle(_navLargeTitleTextStyle, context, nullOk),
      _resolveTextStyle(_navActionTextStyle, context, nullOk),
      _resolveTextStyle(_pickerTextStyle, context, nullOk),
      _resolveTextStyle(_dateTimePickerTextStyle, context, nullOk),
      _resolveTextStyle(_title3Bold, context, nullOk),
      _resolveTextStyle(_title3BoldSecondary, context, nullOk),
      _resolveTextStyle(_title3SemiBold, context, nullOk),
      _resolveTextStyle(_title3SemiBoldSecondary, context, nullOk),
      _resolveTextStyle(_title3Default, context, nullOk),
      _resolveTextStyle(_title2Bold, context, nullOk),
      _resolveTextStyle(_title1Bold, context, nullOk),
      _resolveTextStyle(_title2DefaultSecondary, context, nullOk),
      _resolveTextStyle(_largeTitleBold, context, nullOk),
      _resolveTextStyle(_bodyDefault, context, nullOk),
      _resolveTextStyle(_bodyMedium, context, nullOk),
      _resolveTextStyle(_bodySemibold, context, nullOk),
      _resolveTextStyle(_bodyBold, context, nullOk),
      _resolveTextStyle(_headlineDefault, context, nullOk),
      _resolveTextStyle(_footnoteSmallMedium, context, nullOk),
      _resolveTextStyle(_footnoteSmallDefault, context, nullOk),
      _resolveTextStyle(_footnoteDaySmallDefault, context, nullOk),
      _resolveTextStyle(_footnoteSmallDefaultSecondary, context, nullOk),
      _resolveTextStyle(_footnoteDefault, context, nullOk),
      _resolveTextStyle(_footnoteDefaultSecondary, context, nullOk),
      _resolveTextStyle(_footnoteBold, context, nullOk),
      _resolveTextStyle(_footnoteBoldSecondary, context, nullOk),
      _resolveTextStyle(_subHeadlineDefault, context, nullOk),
      _resolveTextStyle(_subHeadlineSecondary, context, nullOk),
      _resolveTextStyle(_subHeadlineSemiBold, context, nullOk),
      _resolveTextStyle(_bodyDefaultSecondary, context, nullOk),
      _resolveTextStyle(_calloutDefault, context, nullOk),
      _resolveTextStyle(_caption2Default, context, nullOk),
      _resolveTextStyle(_caption2Bold, context, nullOk),
      _resolveTextStyle(_caption2Secondary, context, nullOk),
    );
  }

  /// Returns a copy of the current [ISTextThemeData] instance with
  /// specified overrides.
  ISTextThemeData copyWith({
    Color primaryColor,
    Color secondaryColor,
    @Deprecated('This argument no longer does anything. You can remove it. '
        'This feature was deprecated after v1.10.14.')
        Brightness brightness,
    TextStyle textStyle,
    TextStyle actionTextStyle,
    TextStyle tabLabelTextStyle,
    TextStyle navTitleTextStyle,
    TextStyle navLargeTitleTextStyle,
    TextStyle navActionTextStyle,
    TextStyle pickerTextStyle,
    TextStyle dateTimePickerTextStyle,
    TextStyle title3BoldSecondary,
    TextStyle title3Default,
    TextStyle title3SemiBoldSecondary,
    TextStyle title3SemiDefault,
    TextStyle title2Bold,
    TextStyle title1Bold,
    TextStyle title2DefaultSecondary,
    TextStyle largeTitleBold,
    TextStyle bodyDefault,
    TextStyle bodyMedium,
    TextStyle bodySemibold,
    TextStyle bodyBold,
    TextStyle headlineDefault,
    TextStyle footnoteSmallMedium,
    TextStyle footnoteSmallDefault,
    TextStyle footnoteDaySmallDefault,
    TextStyle footnoteSmallDefaultSecondary,
    TextStyle footnoteDefault,
    TextStyle footnoteDefaultSecondary,
    TextStyle footnoteBold,
    TextStyle footnoteBoldSecondary,
    TextStyle subHeadlineDefault,
    TextStyle subHeadlineSecondary,
    TextStyle subHeadlineSemiBold,
    TextStyle bodyDefaultSecondary,
    TextStyle calloutDefault,
    TextStyle caption2Default,
    TextStyle caption2Bold,
    TextStyle caption2Secondary,
  }) {
    return ISTextThemeData._raw(
      _defaults,
      primaryColor ?? _primaryColor,
      secondaryColor ?? _secondaryColor,
      textStyle ?? _textStyle,
      actionTextStyle ?? _actionTextStyle,
      tabLabelTextStyle ?? _tabLabelTextStyle,
      navTitleTextStyle ?? _navTitleTextStyle,
      navLargeTitleTextStyle ?? _navLargeTitleTextStyle,
      navActionTextStyle ?? _navActionTextStyle,
      pickerTextStyle ?? _pickerTextStyle,
      dateTimePickerTextStyle ?? _dateTimePickerTextStyle,
      title3Bold ?? _title3Bold,
      title3BoldSecondary ?? _title3BoldSecondary,
      title3SemiBold ?? _title3SemiBold,
      title3SemiBoldSecondary ?? _title3SemiBoldSecondary,
      title3Default ?? _title3Default,
      title2Bold ?? _title2Bold,
      title1Bold ?? _title1Bold,
      title2DefaultSecondary ?? _title2DefaultSecondary,
      largeTitleBold ?? _largeTitleBold,
      bodyDefault ?? _bodyDefault,
      bodyMedium ?? _bodyMedium,
      bodySemibold ?? _bodySemibold,
      bodyBold ?? _bodyBold,
      headlineDefault ?? _headlineDefault,
      footnoteSmallMedium ?? _footnoteSmallMedium,
      footnoteSmallDefault ?? _footnoteSmallDefault,
      footnoteDaySmallDefault ?? _footnoteDaySmallDefault,
      footnoteSmallDefaultSecondary ?? _footnoteSmallDefaultSecondary,
      footnoteDefault ?? _footnoteDefault,
      footnoteDefaultSecondary ?? _footnoteDefaultSecondary,
      footnoteBold ?? _footnoteBold,
      footnoteBoldSecondary ?? _footnoteBoldSecondary,
      subHeadlineDefault ?? _subHeadlineDefault,
      subHeadlineSecondary ?? _subHeadlineSecondary,
      subHeadlineSemiBold ?? _subHeadlineSemiBold,
      bodyDefaultSecondary ?? _bodyDefaultSecondary,
      calloutDefault ?? _calloutDefault,
      caption2Default ?? _caption2Default,
      caption2Bold ?? _caption2Bold,
      caption2Secondary ?? _caption2Secondary,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    ISTextThemeData defaultData = ISTextThemeData(
      primaryColor: Color.fromRGBO(0, 0, 0, 0),
      secondaryColor: Color.fromRGBO(0, 0, 0, 0),
    );
    properties.add(DiagnosticsProperty<TextStyle>('textStyle', textStyle, defaultValue: defaultData.textStyle));
    properties.add(DiagnosticsProperty<TextStyle>('actionTextStyle', actionTextStyle, defaultValue: defaultData.actionTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>('tabLabelTextStyle', tabLabelTextStyle, defaultValue: defaultData.tabLabelTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>('navTitleTextStyle', navTitleTextStyle, defaultValue: defaultData.navTitleTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>('navLargeTitleTextStyle', navLargeTitleTextStyle, defaultValue: defaultData.navLargeTitleTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>('navActionTextStyle', navActionTextStyle, defaultValue: defaultData.navActionTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>('pickerTextStyle', pickerTextStyle, defaultValue: defaultData.pickerTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>('dateTimePickerTextStyle', dateTimePickerTextStyle, defaultValue: defaultData.dateTimePickerTextStyle));
  }
}

class _TextThemeDefaultsBuilder {
  _TextThemeDefaultsBuilder(
    this.primaryColor,
    this.secondaryColor,
  )   : assert(primaryColor != null),
        assert(secondaryColor != null);

  final Color primaryColor;
  final Color secondaryColor;

  static TextStyle _applyLabelColor(TextStyle original, Color color) {
    return original?.color == color ? original : original?.copyWith(color: color);
  }

  TextStyle get textStyle => _applyLabelColor(_kDefaultTextStyle, primaryColor);

  TextStyle get tabLabelTextStyle => _applyLabelColor(_kDefaultTabLabelTextStyle, secondaryColor);

  TextStyle get navTitleTextStyle => _applyLabelColor(_kDefaultMiddleTitleTextStyle, primaryColor);

  TextStyle get navLargeTitleTextStyle => _applyLabelColor(_kDefaultLargeTitleTextStyle, primaryColor);

  TextStyle get pickerTextStyle => _applyLabelColor(_kDefaultPickerTextStyle, primaryColor);

  TextStyle get dateTimePickerTextStyle => _applyLabelColor(_kDefaultDateTimePickerTextStyle, primaryColor);

  TextStyle actionTextStyle({Color primaryColor}) => _kDefaultActionTextStyle.copyWith(color: primaryColor);

  TextStyle navActionTextStyle({Color primaryColor}) => actionTextStyle(primaryColor: primaryColor);

  TextStyle get title3Bold => _applyLabelColor(_title3Bold, primaryColor);

  TextStyle get title3BoldSecondary => _applyLabelColor(_title3BoldSecondary, secondaryColor);

  TextStyle get title3SemiBold => _applyLabelColor(_title3SemiBold, primaryColor);

  TextStyle get title3SemiBoldSecondary => _applyLabelColor(_title3SemiBoldSecondary, secondaryColor);

  TextStyle get title3Default => _applyLabelColor(_title3Default, primaryColor);

  TextStyle get title2Bold => _applyLabelColor(_title2Bold, primaryColor);

  TextStyle get title1Bold => _applyLabelColor(_title1Bold, primaryColor);

  TextStyle get title2DefaultSecondary => _applyLabelColor(_title2DefaultSecondary, secondaryColor);

  TextStyle get largeTitleBold => _applyLabelColor(_largeTitleBold, primaryColor);

  TextStyle get bodyDefault => _applyLabelColor(_bodyDefault, primaryColor);

  TextStyle get bodyMedium => _applyLabelColor(_bodyMedium, primaryColor);

  TextStyle get bodySemibold => _applyLabelColor(_bodySemibold, primaryColor);

  TextStyle get bodyBold => _applyLabelColor(_bodyBold, primaryColor);

  TextStyle get headlineDefault => _applyLabelColor(_headlineDefault, primaryColor);

  TextStyle get footnoteSmallMedium => _applyLabelColor(_footnoteSmallMedium, primaryColor);

  TextStyle get footnoteSmallDefault => _applyLabelColor(_footnoteSmallDefault, primaryColor);

  TextStyle get footnoteDaySmallDefault => _applyLabelColor(_footnoteDaySmallDefault, primaryColor);

  TextStyle get footnoteSmallDefaultSecondary => _applyLabelColor(_footnoteSmallDefaultSecondary, secondaryColor);

  TextStyle get footnoteDefault => _applyLabelColor(_footnoteDefault, primaryColor);

  TextStyle get footnoteDefaultSecondary => _applyLabelColor(_footnoteDefaultSecondary, secondaryColor);

  TextStyle get footnoteBold => _applyLabelColor(_footnoteBold, primaryColor);

  TextStyle get footnoteBoldSecondary => _applyLabelColor(_footnoteBoldSecondary, secondaryColor);

  TextStyle get subHeadlineDefault => _applyLabelColor(_subHeadlineDefault, primaryColor);

  TextStyle get subHeadlineSecondary => _applyLabelColor(_subHeadlineSecondary, secondaryColor);

  TextStyle get subHeadlineSemiBold => _applyLabelColor(_subHeadlineSemiBold, primaryColor);

  TextStyle get bodyDefaultSecondary => _applyLabelColor(_bodyDefaultSecondary, secondaryColor);

  TextStyle get calloutDefault => _applyLabelColor(_calloutDefault, primaryColor);

  TextStyle get caption2Default => _applyLabelColor(_caption2Default, primaryColor);

  TextStyle get caption2Bold => _applyLabelColor(_caption2Bold, primaryColor);

  TextStyle get caption2Secondary => _applyLabelColor(_caption2Secondary, secondaryColor);

  _TextThemeDefaultsBuilder resolveFrom(BuildContext context, bool nullOk) {
    final Color resolvedLabelColor = CupertinoDynamicColor.resolve(primaryColor, context);
    final Color resolvedInactiveGray = CupertinoDynamicColor.resolve(secondaryColor, context);
    return resolvedLabelColor == primaryColor && resolvedInactiveGray == secondaryColor
        ? this
        : _TextThemeDefaultsBuilder(resolvedLabelColor, resolvedInactiveGray);
  }
}
