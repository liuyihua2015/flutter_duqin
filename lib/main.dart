import 'package:duqin/config/app_theme.dart';
import 'package:flutter/material.dart';

import 'transit_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: TransitPage(),
    );
  }
}
