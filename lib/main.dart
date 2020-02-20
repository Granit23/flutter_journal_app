import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/home_page.dart';
import 'components/journal_entry.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  static final routes = {
    HomePage.routeName: (context) => HomePage(),
    JournalEntry.routeName: (context) => JournalEntry()
  };

  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (Brightness brightness) => new ThemeData(
        primarySwatch: Colors.blue,
        brightness: brightness,
    ),
    themedWidgetBuilder: (context, theme) {
    return MaterialApp(
      title: 'Journal',
      theme: theme,
      initialRoute: '/',
      routes: routes,
    );
    }
    );
  }
}
