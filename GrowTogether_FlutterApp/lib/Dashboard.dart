import 'package:flutter/material.dart';
import 'chat.dart';
import 'issues.dart';
import 'feed.dart';
import 'NewPost.dart';

void main() {
  runApp(AppTabBar());
}

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
                  child: Text("Create new Post"),
                  value: 2,
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("Logout"),
                ),
              ],
              onSelected: (value) {
                if (value == 1) {
                  //add links to my profile
                } else if (value == 2) {
                  //create new post
                } else {
                  //add links to logout page
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
