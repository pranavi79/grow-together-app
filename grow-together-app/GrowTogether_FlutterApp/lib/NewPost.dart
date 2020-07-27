import 'package:flutter/material.dart';

class Posting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grow Together',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create a New Event",
          ),
          elevation: 30.0,
          leading: Icon(Icons.local_hospital),
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Dashboard'),
                  value: 3,
                ),
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
                } else if (value == 3) {
                  //add links to dasboard
                } else {
                  //add link to logout
                }
              },
            )
          ],
        ),
        body: NewEventPost(),
      ),
    );
  }
}

class NewEventPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EventPostState();
}

class EventPostState extends State<NewEventPost> {
  final _eventPostKey = GlobalKey<FormState>();
  String titleOfPost = '';
  String descriptionOfPost = '';
  String city = '';
  String locality = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Form(
            key: _eventPostKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter Title of Event',
                        hintText: 'Title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide())),
                    maxLength: 20,
                    onSaved: (newValue) {
                      setState(() {
                        titleOfPost = newValue;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter Title";
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Enter City',
                                hintText: 'City',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide())),
                            onSaved: (newValue) {
                              setState(() {
                                city = newValue;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter City";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Enter Locality',
                                hintText: 'Locality',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide())),
                            onSaved: (newValue) {
                              setState(() {
                                locality = newValue;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Locality";
                              }
                              return null;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    minLines: 3,
                    maxLines: null,
                    decoration: InputDecoration(
                        labelText: 'Enter Description of Event',
                        hintText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide())),
                    keyboardType: TextInputType.multiline,
                    onSaved: (newValue) {
                      setState(() {
                        descriptionOfPost = newValue;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Enter Description";
                      }
                      return null;
                    },
                  ),
                  new RaisedButton(
                      color: Colors.blue[700],
                      textColor: Colors.white,
                      child: Text('Create New Event'),
                      onPressed: () {
                        onPressedSubmit(context);
                      }),
                ],
              ),
            )),
      ),
    );
  }

  void onPressedSubmit(BuildContext context) {
    if (_eventPostKey.currentState.validate()) {
      _eventPostKey.currentState.save();
      //Push Data to Firebase
    }
  }
}
