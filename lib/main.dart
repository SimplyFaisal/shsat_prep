import 'package:flutter/material.dart';
import 'package:shsat_prep/dashboard_tab.dart';
import 'package:shsat_prep/questions_tab.dart';
import 'package:shsat_prep/resources_tab.dart';
import 'package:shsat_prep/schools_tab.dart';

void main() => runApp(ApplicationShell());

class ApplicationShell extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SHSAT',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
        ),
        home: HomePage(
          title: "SHSAT Prep",
        ));
  }
}

/// This serves as the "landing page" of our app.
///
/// It renders a [Scaffold] that holds a [BottomNavigationBar]. Each item in the
/// bar corresponds to a widget that will be shown when it is selected:
/// - [DashboardTab]
/// - [QuestionsTab]
/// - [SchoolsTab]
/// - [ResourcesTab]
class HomePage extends StatefulWidget {
  HomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The index of the currently selected tab.
  int _currentIndex = 0;

  // The widgets for the tabs.
  static List<Widget> _tabs = [
    DashboardTab(),
    QuestionsTab(),
    SchoolsTab(),
    ResourcesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var accentColor = Theme.of(context).accentColor;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _tabs.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('Dashboard'),
              icon: Icon(
                Icons.dashboard,
                color: accentColor,
              )),
          BottomNavigationBarItem(
              title: Text('Questions'),
              icon: Icon(Icons.poll, color: accentColor)),
          BottomNavigationBarItem(
              title: Text('Schools'),
              icon: Icon(Icons.school, color: accentColor)),
          BottomNavigationBarItem(
              title: Text('Resources'),
              icon: Icon(Icons.timeline, color: accentColor)),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        selectedItemColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
