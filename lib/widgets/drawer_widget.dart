import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/main.dart';
import '/routes.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: Text('My Diary App', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            selected: appState.selectedIndex == 0,
            onTap: () {
              appState.updateIndex(0);
              Navigator.pushReplacementNamed(context, RoutePage.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.auto_stories_outlined),
            title: Text('Diary'),
            selected: appState.selectedIndex == 1,
            onTap: () {
              appState.updateIndex(1);
              Navigator.pushReplacementNamed(context, RoutePage.diary);
            },
          ),
        ],
      )
    );
  }
}
