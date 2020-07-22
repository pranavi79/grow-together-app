import 'package:flutter/material.dart';

class IssueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListOfPostedIssues(),
    );
  }
}

class ListOfPostedIssues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          tooltip: 'Post new issue', child: Icon(Icons.add), onPressed: null),
    );
  }
}
