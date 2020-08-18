import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Dashboard.dart';
import 'LogIn.dart';

class Posting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grow Together',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[200],
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
                // PopupMenuItem(
                //   child: Text("My Profile"),
                //   value: 1,
                // ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Logout"),
                ),
              ],
              onSelected: (value) {
                // if (value == 1) {
                //   //add links to my profile
                // } else if (value == 3) {
                if (value == 3) {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new AppTabBar())); //add links to dasboard
                } else {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new LogIn()));
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

final kBoxDecorationStyle = BoxDecoration(
  //color: Colors.white,
  borderRadius: BorderRadius.circular(200.0),
  // boxShadow: [
  //   BoxShadow(
  //     color: Colors.black12,
  //     blurRadius: 6.0,
  //     offset: Offset(0, 2),
  //   ),
  // ],
);

final kHintTextStyle = TextStyle(
  color: Colors.grey,
  fontFamily: 'OpenSans',
);

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
  String birthDateInString;
  var birthDate;
  bool isDateSelected;

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
                        fillColor: Colors.white,
                        labelText: 'Enter Title of Event',
                        hintText: 'Title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(200.0),
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
                                    borderRadius: BorderRadius.circular(200.0),
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
                                    borderRadius: BorderRadius.circular(200.0),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: null,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'Enter Description of Event',
                          hintText: 'Description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200.0),
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
                  ),
                  // SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(14.0),
                        prefixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            ),
                            onPressed: () async {
                              final datePick = await showDatePicker(
                                  context: context,
                                  initialDate: new DateTime.now(),
                                  firstDate: new DateTime(1900),
                                  lastDate: new DateTime(2100));
                              if (datePick != null && datePick != birthDate) {
                                setState(() {
                                  birthDate = datePick;
                                  isDateSelected = true;

                                  // put it here
                                  return birthDateInString =
                                      "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
                                });
                              }
                            }),
                        hintText: 'Event date in mm/dd/yyyy',
                        hintStyle: kHintTextStyle,
                      ),
                      controller: TextEditingController(
                        text: birthDateInString,
                      ),
                    ),
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
