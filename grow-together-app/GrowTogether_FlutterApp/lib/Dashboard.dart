import 'package:dashboard/LogIn.dart';
import 'package:flutter/material.dart';
import 'ChatInterface.dart';
import 'issues.dart';
import 'feed.dart';
import 'NewPost.dart';

class AppTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/posting': (BuildContext context) => new Posting()
      },
      title: 'Grow Together',
      home: Tabchanger(),
    );
  }
}

class Tabchanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Post new issue',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/posting', (Route<dynamic> route) => false);
        },
      ),
      body: MyDefaultTabController(),
    );
  }
}

class MyDefaultTabController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
          title: Text(
            'Grow Together',
            textDirection: TextDirection.ltr,
          ),
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
              onSelected: (value) {
                if (value == 1) {
                  //add links to my profile
                } else {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new LogIn()));
                }
              },
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
    );
  }
}
