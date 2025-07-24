import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/diary_page.dart';

class RoutePage {
  static const String home = '/';
  static const String diary = '/diary';

  static final Map<String, WidgetBuilder> appRoutes = {
    home: (context) => HomePage(),
    diary: (context) => DiaryPage(),
  };
}