import 'package:flutter/material.dart';
import 'package:portfolio_shubham_lad/theme/app_text_styles.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightThemeColors.background,
    primaryColor: LightThemeColors.primary,
    cardColor: LightThemeColors.surface,
    // ********************************  Text Theam *******************************
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.headline,
      titleMedium: AppTextStyles.subHeadline,
      bodyMedium: AppTextStyles.body,
      labelLarge: AppTextStyles.button,
      bodySmall: AppTextStyles.caption,
    ),
    // ************************************* Menu Bar *******************************
    appBarTheme: const AppBarTheme(
      backgroundColor: LightThemeColors.surface,
      foregroundColor: LightThemeColors.textPrimary,
    ),

    iconTheme: const IconThemeData(color: LightThemeColors.accent),
    colorScheme: ColorScheme.light(
      primary: LightThemeColors.primary,
      secondary: LightThemeColors.accent,
      background: LightThemeColors.background,
      surface: LightThemeColors.surface,
      onPrimary: Colors.white,
      onSurface: LightThemeColors.textPrimary,
    ),
    dividerTheme: const DividerThemeData(
      color: LightThemeColors.Divider,
      thickness: 1,
      space: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkThemeColors.background,
    primaryColor: DarkThemeColors.primary,
    cardColor: DarkThemeColors.surface,
    // ********************************  Text Theam *******************************
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.headline,
      titleMedium: AppTextStyles.subHeadline,
      bodyMedium: AppTextStyles.body,
      labelLarge: AppTextStyles.button,
      bodySmall: AppTextStyles.caption,
    ),
    // ************************************* Menu Bar *******************************
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkThemeColors.surface,
      foregroundColor: DarkThemeColors.textPrimary,
    ),
    iconTheme: const IconThemeData(color: DarkThemeColors.accent),
    colorScheme: ColorScheme.dark(
      primary: DarkThemeColors.primary,
      secondary: DarkThemeColors.accent,
      background: DarkThemeColors.background,
      surface: DarkThemeColors.surface,
      onPrimary: Colors.black,
      onSurface: DarkThemeColors.textPrimary,
    ),
    dividerTheme: const DividerThemeData(
      color: DarkThemeColors.Divider,
      thickness: 1,
      space: 0,
    ),

  );
}
