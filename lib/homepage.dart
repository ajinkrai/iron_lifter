import 'package:flutter/material.dart';
import 'package:iron_Lifter/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iron_Lifter/requestModel.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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
        drawer: Drawer(
          child: ListView(
              addRepaintBoundaries: true,
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "Hello! " +
                        globals.currentUser.firstName +
                        " " +
                        globals.currentUser.lastName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text(globals.currentUser.email),
                ),
                ListTile(
                  title: Text('Home',
                      style: TextStyle(
                          color: Colors.lightBlue[800], fontSize: 20)),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'HomePage', ModalRoute.withName('/'));
                  },
                ),
                ListTile(
                  title: Text('Profile',
                      style: TextStyle(
                          color: Colors.lightBlue[800], fontSize: 20)),
                  onTap: () {
                    Navigator.pushNamed(context, 'Profile');
                  },
                ),
                ListTile(
                  title: Text('Medical Reports',
                      style: TextStyle(
                          color: Colors.lightBlue[800], fontSize: 20)),
                  onTap: () {
                    Navigator.pushNamed(context, 'Reports');
                  },
                ),
                // ListTile(title: Text('Saved Posts',style:TextStyle(color: Colors.lightBlue[800],fontSize: 20)),onTap: (){Navigator.pushNamed(context,'SavedPosts');},),
                ListTile(
                  title: Text('Logout',
                      style: TextStyle(
                          color: Colors.lightBlue[800], fontSize: 20)),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'SignIn', ModalRoute.withName('/'));
                  },
                )
              ]),
        ),
        appBar: AppBar(
          elevation: 20,
          title: Text(
            'iron Lifter',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, 'BookingPage');
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                label: Text(
                  'Booking',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Column(
          children: [
            Stack(alignment: Alignment.center, children: <Widget>[
              Image(image: AssetImage('assets/img/logo_title.jpg')),
            ]),
            Text(
              "A gym is an indoor sports facility that also has physical therapy to help the injured recover. Fuerza gym is one with all the necessary amenities that have an active cult pass to all the members who own a Cult.fit gym membership. Anybody can access this gym with their cult pass at any time. Fuerza gym HSR in Bangalore has an excellent well-lit gym that is airier with many air conditioners",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Stack(alignment: Alignment.center, children: <Widget>[
              Image(image: AssetImage('assets/img/logo_title.jpg')),
            ]),
            Text(
                "The gym near me ITI Layout in Bangalore has various facilities or amenities and to mention a few they are: The best gym near me HSR in Fuerza has CCTV cameras fixed all around the premise to make sure that all the people visiting the gym are safe and sound. Fuerza gym has a broad and ample bike parking that ensures to allow many two-wheelers parked at the same time under the gym control. The gym near me ITI layout in Bangalore follows stringent safety protocol to prevent the widespread of the pandemic",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          ],
        ))));
  }
}
