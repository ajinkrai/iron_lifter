// this is a sample change
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iron_Lifter/globals.dart' as globals;
import 'package:iron_Lifter/UserModel.dart';
import 'package:flutter/material.dart';

import 'UserModel.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: ListView(
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 0.7,
            child: Image(image: AssetImage('assets/img/logo_title.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.person), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailLoginController,
                          decoration: InputDecoration(hintText: 'Email'),
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          controller: passwordLoginController,
                          decoration: InputDecoration(hintText: 'Password'),
                          obscureText: true,
                        ))),
              ],
            ),
          ),
          FractionallySizedBox(
              widthFactor: 1 / 4,
              child: RaisedButton(
                onPressed: () {
                  loginUser();
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                padding: EdgeInsets.all(5),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 10, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    " Not a member?sign up now",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'SignUp');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 19,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )),
          Text(
            "Made In India",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.orange[600],
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          FractionallySizedBox(
              widthFactor: 1 / 3,
              child: RaisedButton(
                onPressed: () {
                  if (emailLoginController.text.trim() ==
                      'ajinkrai0786@gmail.com') {
                    if (passwordLoginController.text == 'ajink12')
                      Navigator.pushReplacementNamed(
                          context, 'AdminPageRequests');
                  } else {
                    Navigator.pushReplacementNamed(context, 'SignIn');
                  }
                },
                child: Text(
                  'Admin Sign In',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                padding: EdgeInsets.all(5),
              )),
        ],
      ),
    );
  }

  loginUser() async {
    try {
      DocumentSnapshot userSnapshot = await Firestore.instance
          .collection("users")
          .where("email", isEqualTo: emailLoginController.text)
          .limit(1)
          .getDocuments()
          .then(
        (value) {
          if (value.documents.length > 0) {
            print(value.documents.single.data);
            return value.documents.single;
          } else {
            return null;
          }
        },
      );
      globals.currentUser = UserModel.toObject(userSnapshot);
      if (globals.currentUser.password == passwordLoginController.text) {
        await Navigator.pushReplacementNamed(context, 'HomePage');
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password Incorrect"),
            );
          },
        );
      }
    } catch (err) {
      print(err);
    }
  }
}
