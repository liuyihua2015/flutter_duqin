import 'package:duqin/config/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.page,
  indicatorColor: AppColors.active, // 选项卡栏中所选选项卡指示器的颜色。
  splashColor: Colors.transparent, // 取消水波纹效果
  highlightColor: Colors.transparent, // 取消水波纹效果
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: AppColors.unactive, // 文字颜色
    ),
  ),
  // tabbar的样式
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: AppColors.unactive,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(
      fontSize: 18,
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 12),
  ),
  appBarTheme: AppBarTheme(
    // appbar 的样式去除
    backgroundColor: AppColors.nav,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.nav,
    selectedItemColor: AppColors.active,
    unselectedItemColor: AppColors.unactive,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
    ),
  ),
);
