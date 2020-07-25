import 'package:flutter/material.dart';
import 'NewPost.dart';

class IssueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/posting': (BuildContext context) => new Posting()
      },
      home: ListOfPostedIssues(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListOfPostedIssues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
