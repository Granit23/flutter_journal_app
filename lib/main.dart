import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Journal',
      darkTheme: ThemeData.dark(),
      theme: ThemeData( primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
