import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'globals.dart' as globals;
import 'requestModel.dart';

class BookConsultation extends StatefulWidget {
  const BookConsultation();

  @override
  _BookConsultationState createState() => _BookConsultationState();
}

class _BookConsultationState extends State<BookConsultation> {
  RequestModel requestModel = new RequestModel();
  DateTime selectedDate = DateTime.now();
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  var height;
  var weight;
  var age;
  var problems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Book a Consultation'),
        ),
        body: Container(
            child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/img/logo_title.jpg')),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your Height'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  height = value.trim();
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your Weight'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  weight = value.trim();
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Enter Your Age'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  age = value.trim();
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Purpose to join gym'),
                maxLines: null,
                minLines: null,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  problems = value.trim();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () async {
                    requestModel.email = globals.currentUser.email;
                    requestModel.firstName = globals.currentUser.firstName;
                    requestModel.lastName = globals.currentUser.lastName;
                    requestModel.mobile = globals.currentUser.mobile;
                    var requestMap = requestModel.toMap();
                    // Store user in Database
                    _formKey.currentState.save();
                    print(height + weight + age + problems);
                    Firestore.instance
                        .collection('users')
                        .document(globals.currentUser.email)
                        .collection('Records')
                        .document('details')
                        .setData({
                      "height": height,
                      "weight": weight,
                      "age": age,
                      "problems": problems
                    });
                    await db
                        .collection('requests')
                        .document(globals.currentUser.email)
                        .setData(requestMap);
                    await Navigator.pop(context);
                  },
                  child: Text('Submit data and\nRaise a Request'),
                ),
              ),
            ],
          ),
        )));
  }
}
