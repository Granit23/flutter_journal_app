import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'journal_entry.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  bool isSwitched = false;
  // storeBool(isSwitched);
  @override
  void initState() {
    print("calling init state\n\n");
    super.initState();
    getSwitchValue();
    
  }

  getSwitchValue() async {
    isSwitched = await getBool();
    setState(() {
    });
    
  }

   storeBool(switched) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSwitched', switched);
    return prefs.setBool('isSwitched', switched);
  }

  getBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSwitched = prefs.getBool('isSwitched');
    print("Is switched is $isSwitched\n");
    WidgetsBinding.instance.addPostFrameCallback((_) => getTheme(isSwitched, context));
    return isSwitched;
  }
  
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
            onChanged: (bool value) {
              setState(() {
                if (value == true) {
                print("in switch $value");
                DynamicTheme.of(context).setThemeData(ThemeData.dark());
                } else {
                print("in else switch $value");
                  DynamicTheme.of(context).setThemeData(ThemeData.light());
                }
                isSwitched = value;
                storeBool(value);
                // bool a = getBool();
                // print(a);
              });
              print("here");
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,

          )))
      ]
    );
  }
    
 
  void getTheme(bool isSwitched, BuildContext context) {
    print("setting theme for isSwitched $isSwitched");
    if (isSwitched == true) {
      DynamicTheme.of(context).setThemeData(ThemeData.dark());
    } else {
      DynamicTheme.of(context).setThemeData(ThemeData.light());
    }
  }

  newJournalEntry(context) => Navigator.of(context).pushNamed(JournalEntry.routeName);
}