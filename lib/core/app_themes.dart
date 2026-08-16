import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: LightModeColor.primary.color,
    // primaryColorLight: LightModeColor.navBorder.color,
    // primaryColorDark: LightModeColor.navActive.color,
    scaffoldBackgroundColor: LightModeColor.primary.color,
    canvasColor: LightModeColor.rideCard.color,
    dividerColor: LightModeColor.statColor.color,
    cardTheme: CardThemeData(
      color: LightModeColor.primary.color,
      surfaceTintColor: LightModeColor.primary.color,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: LightModeColor.primary.color,
      surfaceTintColor: LightModeColor.primary.color,
      iconTheme: IconThemeData(color: LightModeColor.textPrimary.color),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(LightModeColor.buttonBackground.color),
        shape: WidgetStatePropertyAll(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[300],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.green, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.green, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),

    // ✅ NEW: NavigationBarTheme for Material 3 bottom navigation
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: LightModeColor.primary.color,
      elevation: 0,
      indicatorColor: LightModeColor.navBorder.color,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return sansDevanagariRegular14(
            color: LightModeColor.navActive.color,
          );
        }
        return sansDevanagariRegular14(
          color: LightModeColor.navInactive.color,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: LightModeColor.navActive.color);
        }
        return IconThemeData(color: LightModeColor.navInactive.color);
      }),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: DarkModeColor.primary.color,
    scaffoldBackgroundColor: DarkModeColor.primary.color,
    canvasColor: DarkModeColor.rideCard.color,
    dividerColor: DarkModeColor.statColor.color,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkModeColor.primary.color,
      surfaceTintColor: DarkModeColor.primary.color,
      iconTheme: IconThemeData(color: DarkModeColor.textPrimary.color),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(DarkModeColor.buttonBackground.color),
        shape: WidgetStatePropertyAll(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   fillColor: DarkModeColor.primary.color,
    //   filled: true,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(5),
    //     borderSide: BorderSide(
    //       color: DarkModeColor.statColor.color,
    //       width: 1,
    //     ),
    //   ),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[300],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade700, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DarkModeColor.navBorder.color,
      selectedItemColor: DarkModeColor.navActive.color,
      unselectedItemColor: DarkModeColor.navInactive.color,
    ),
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? LightModeColor.primary.color
          : DarkModeColor.primary.color,
    ));
  }
}

extension ThemeExtras on ThemeData {
  Color get particlesColor => brightness == Brightness.light
      ? LightModeColor.primary.color
      : DarkModeColor.primary.color;
}
