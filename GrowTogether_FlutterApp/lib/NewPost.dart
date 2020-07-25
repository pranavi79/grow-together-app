import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  String _date = "Not set";
  String _time = "Not set";

  @override
  void initState() {
    super.initState();
  }

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
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    elevation: 4.0,
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          minTime: DateTime(2015, 1, 1),
                          maxTime: DateTime(2030, 12, 31), onConfirm: (date) {
                        print('confirm $date');
                        _date = '${date.year} - ${date.month} - ${date.day}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      size: 18.0,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      " $_date",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "  Change",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    elevation: 4.0,
                    onPressed: () {
                      DatePicker.showTimePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true, onConfirm: (time) {
                        print('confirm $time');
                        _time =
                            '${time.hour} : ${time.minute} : ${time.second}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time,
                                      size: 18.0,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      " $_time",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "  Change",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
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
