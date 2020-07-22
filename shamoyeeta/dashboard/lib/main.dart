import 'package:flutter/material.dart';
import 'chat.dart';
import 'issues.dart';
import 'feed.dart';

void main() {
  runApp(AppTabBar());
}

class AppTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'FEED',
                ),
                Tab(
                  text: 'ISSUES',
                ),
                Tab(
                  text: 'CHATS',
                ),
              ],
            ),
            title: Text('Grow Together'),
            backgroundColor: Colors.blue,
            elevation: 30.0,
            leading: Icon(Icons.local_hospital),
            actions: <Widget>[
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("My Profile"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Logout"),
                  ),
                ],
              )
            ],
          ),
          body: TabBarView(
            children: [
              FeedScreen(),
              IssueScreen(),
              ChatScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
