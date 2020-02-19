import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'journal_entry.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text("Journal"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
            ),
        ]
      ),
      body: Center(child: Icon(Icons.book, size: 75,)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newJournalEntry(context);
        },
        child: Icon(Icons.add)
      ),
      endDrawer: Drawer(
        child: buildDrawer(context),
        
      ),
    );
  }

  ListView buildDrawer(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 60,
          child:DrawerHeader(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Align(
            alignment: Alignment.topLeft,
            child:Text("Settings", style: TextStyle(fontSize: 15)),),
            )),
        Card(
          child:ListTile(
          leading: Text("Dark Mode"),
          trailing:Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,

          )))
      ]
    );
  }
    



  newJournalEntry(context) => Navigator.of(context).pushNamed(JournalEntry.routeName);
}