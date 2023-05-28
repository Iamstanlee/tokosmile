import 'package:flutter/material.dart';
import 'package:tokosmile/core/constant.dart';
import 'package:tokosmile/core/design_system/color.dart';
import 'package:tokosmile/core/design_system/typography.dart';

class TokoTheme {
  const TokoTheme._();

  static ThemeData get light => ThemeData(
        primaryColor: TokoColor.primary500,
        fontFamily: TokoConstants.primaryTypeface,
        scaffoldBackgroundColor: TokoColor.grey100,
        appBarTheme: const AppBarTheme(
          color: TokoColor.grey0,
          elevation: 0.0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 2,
          selectedItemColor: TokoColor.primary500,
          unselectedItemColor: TokoColor.grey500,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TokoTypography.body1,
          unselectedLabelStyle: TokoTypography.label,
        ),
      );
}
