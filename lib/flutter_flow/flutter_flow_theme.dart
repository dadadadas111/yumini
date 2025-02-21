// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color indigo50;
  late Color indigo100;
  late Color indigo200;
  late Color indigo300;
  late Color indigo400;
  late Color indigo500;
  late Color indigo600;
  late Color indigo700;
  late Color indigo800;
  late Color indigo900;
  late Color indigo950;
  late Color slate50;
  late Color slate100;
  late Color slate200;
  late Color slate300;
  late Color slate400;
  late Color slate500;
  late Color slate600;
  late Color slate700;
  late Color slate800;
  late Color slate900;
  late Color slate950;
  late Color red500;
  late Color red600;
  late Color inversePrimaryText;
  late Color inverseSecondaryText;
  late Color hoverState;
  late Color divider;
  late Color icon;
  late Color outline;
  late Color backgroundAlpha;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF5B6CCF);
  late Color secondary = const Color(0xFF008651);
  late Color tertiary = const Color(0xFF7805BC);
  late Color alternate = const Color(0xFFFE0A7B);
  late Color primaryText = const Color(0xFF11181C);
  late Color secondaryText = const Color(0xFF687076);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFF8FAFC);
  late Color accent1 = const Color(0x1E2037C6);
  late Color accent2 = const Color(0x1E008651);
  late Color accent3 = const Color(0x1E7805BC);
  late Color accent4 = const Color(0x1FFE0A7B);
  late Color success = const Color(0xFF02B18F);
  late Color warning = const Color(0xFFFF9E00);
  late Color error = const Color(0xFFFF5451);
  late Color info = const Color(0xFFC7D2FE);

  late Color indigo50 = Color(0xFFEEF2FF);
  late Color indigo100 = Color(0xFFE0E7FF);
  late Color indigo200 = Color(0xFFC7D2FE);
  late Color indigo300 = Color(0xFFA5B4FC);
  late Color indigo400 = Color(0xFF818CF8);
  late Color indigo500 = Color(0xFF6366F1);
  late Color indigo600 = Color(0xFF4F46E5);
  late Color indigo700 = Color(0xFF4338CA);
  late Color indigo800 = Color(0xFF3730A3);
  late Color indigo900 = Color(0xFF312E81);
  late Color indigo950 = Color(0xFF1E1B4B);
  late Color slate50 = Color(0xFFF8FAFC);
  late Color slate100 = Color(0xFFF1F5F9);
  late Color slate200 = Color(0xFFE2E8F0);
  late Color slate300 = Color(0xFFCBD5E1);
  late Color slate400 = Color(0xFF94A3B8);
  late Color slate500 = Color(0xFF64748B);
  late Color slate600 = Color(0xFF475569);
  late Color slate700 = Color(0xFF334155);
  late Color slate800 = Color(0xFF1E293B);
  late Color slate900 = Color(0xFF0F172A);
  late Color slate950 = Color(0xFF020617);
  late Color red500 = Color(0xFFEF4444);
  late Color red600 = Color(0xFFDC2626);
  late Color inversePrimaryText = Color(0xFFEEEFFC);
  late Color inverseSecondaryText = Color(0xFF858699);
  late Color hoverState = Color(0xFFF1F5F9);
  late Color divider = Color(0xFFD4D8DD);
  late Color icon = Color(0xFF334155);
  late Color outline = Color(0xFFF1F5F9);
  late Color backgroundAlpha = Color(0xDEFFFFFF);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Inter';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get displayMediumFamily => 'Inter';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 26.0,
      );
  String get displaySmallFamily => 'Inter';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 22.0,
      );
  String get headlineLargeFamily => 'Inter';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 22.0,
      );
  String get headlineMediumFamily => 'Inter';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      );
  String get headlineSmallFamily => 'Inter';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleLargeFamily => 'Inter';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleMediumFamily => 'Inter';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get titleSmallFamily => 'Inter';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelLargeFamily => 'Inter';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
      );
  String get labelMediumFamily => 'Inter';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 13.0,
      );
  String get labelSmallFamily => 'Inter';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => 'Inter';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      );
  String get bodyMediumFamily => 'Inter';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 13.0,
      );
  String get bodySmallFamily => 'Inter';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 11.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF5B6CCF);
  late Color secondary = const Color(0xFF008651);
  late Color tertiary = const Color(0xFF7805BC);
  late Color alternate = const Color(0xFFFE0A7B);
  late Color primaryText = const Color(0xFFEEEFFC);
  late Color secondaryText = const Color(0xFF858699);
  late Color primaryBackground = const Color(0xFF181921);
  late Color secondaryBackground = const Color(0xFF21232E);
  late Color accent1 = const Color(0x1E2037C6);
  late Color accent2 = const Color(0x1F008651);
  late Color accent3 = const Color(0x1E7805BC);
  late Color accent4 = const Color(0x1FFE0A7B);
  late Color success = const Color(0xFF02B18F);
  late Color warning = const Color(0xFFFF9E00);
  late Color error = const Color(0xFFFF5451);
  late Color info = const Color(0xFF312E81);

  late Color indigo50 = Color(0xFF1E1B4B);
  late Color indigo100 = Color(0xFF312E81);
  late Color indigo200 = Color(0xFF3730A3);
  late Color indigo300 = Color(0xFF4338CA);
  late Color indigo400 = Color(0xFF4F46E5);
  late Color indigo500 = Color(0xFF6366F1);
  late Color indigo600 = Color(0xFF818CF8);
  late Color indigo700 = Color(0xFFA5B4FC);
  late Color indigo800 = Color(0xFFC7D2FE);
  late Color indigo900 = Color(0xFFE0E7FF);
  late Color indigo950 = Color(0xFFEEF2FF);
  late Color slate50 = Color(0xFF020617);
  late Color slate100 = Color(0xFF262735);
  late Color slate200 = Color(0xFF1E293B);
  late Color slate300 = Color(0xFF334155);
  late Color slate400 = Color(0xFF475569);
  late Color slate500 = Color(0xFF64748B);
  late Color slate600 = Color(0xFF94A3B8);
  late Color slate700 = Color(0xFFCBD5E1);
  late Color slate800 = Color(0xFFE2E8F0);
  late Color slate900 = Color(0xFFF1F5F9);
  late Color slate950 = Color(0xFFF8FAFC);
  late Color red500 = Color(0xFFEF4444);
  late Color red600 = Color(0xFFDC2626);
  late Color inversePrimaryText = Color(0xFF11181C);
  late Color inverseSecondaryText = Color(0xFF687076);
  late Color hoverState = Color(0xFF1E293B);
  late Color divider = Color(0xFF354560);
  late Color icon = Color(0xFFCBD5E1);
  late Color outline = Color(0xFF1E293B);
  late Color backgroundAlpha = Color(0xDE181921);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            );
}
